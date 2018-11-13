FROM cirepo/java-oracle:8u171-en_US.UTF-8_Asia.Shanghai-alpine

ARG ZIPKIN_VERSION=2.11.7
ARG ARTIFACT_REPOSITORY=unknown
ARG BUILD_TIMESTAMP=unknown
ARG DOCKER_REGISTRY=unknown
ARG GIT_BRANCH=unknown
ARG GIT_COMMIT_ID=unknown
ARG GIT_COMMIT_ID_ABBREV=unknown
ARG GIT_COMMIT_TIME=unknown
ARG GIT_REMOTE_ORIGIN_URL=unknown
ARG JAR_FILE
ARG PROJECT_ARTIFACTID=unknown
ARG PROJECT_GROUPID=unknown
ARG PROJECT_VERSION=unknown

LABEL image.artifact.repository=$ARTIFACT_REPOSITORY
LABEL image.build.timestamp=$BUILD_TIMESTAMP
LABEL image.docker.registry=$DOCKER_REGISTRY
LABEL image.git.branch=$GIT_BRANCH
LABEL image.git.commit.id=$GIT_COMMIT_ID
LABEL image.git.commit.id.abbrev=$GIT_COMMIT_ID_ABBREV
LABEL image.git.commit.time=$GIT_COMMIT_TIME
LABEL image.git.remote.origin.url=$GIT_REMOTE_ORIGIN_URL
LABEL image.project.artifactId=$PROJECT_ARTIFACTID
LABEL image.project.groupId=$PROJECT_GROUPID
LABEL image.project.version=$PROJECT_VERSION

COPY --chown=1000:1000 docker /
COPY --chown=1000:1000 docker-*.yml /

RUN curl -SL https://jcenter.bintray.com/io/zipkin/java/zipkin-server/${ZIPKIN_VERSION:-}/zipkin-server-${ZIPKIN_VERSION:-}-exec.jar > zipkin-server.jar

VOLUME /data

ENTRYPOINT ["/entrypoint.sh"]

CMD exec java -jar zipkin-server.jar
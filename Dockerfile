FROM maven:3-openjdk-8
RUN git clone https://github.com/venkattharun4/onlinebookstore.git
RUN cd maven-web-application/ && mvn package

FROM tomcat:7-jdk8-corretto
LABEL AUTHOR="venkat-tharun"
COPY --from=mvn/onlinebookstore/onlinebookstore-web/ target/onlinebookstore*.war /usr/local/tomcat/webapps/onlinebookstore.war

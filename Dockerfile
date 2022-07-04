FROM golang:1.18 as build

ENV GO111MODULE=on
ENV GOPROXY=https://proxy.golang.com.cn,direct

#定义代码路径
WORKDIR /go/src/cicd-learn
#复制代码
COPY . .
RUN rm -f go.mod go.sum
RUN go mod init
RUN go mod tidy
#编译文件
RUN go build -o cicd-learn .

#服务器端口
EXPOSE 8080

#启动容器时运行的命令
CMD ["/bin/bash", "-c","./cicd-learn"]
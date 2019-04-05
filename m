From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 5 Apr 2019 10:36:40 +0200
Subject: [Buildroot] [RFC PATCH v1 3/6] package/docker-containerd:
 upgrade to go modules
In-Reply-To: <20190317012142.10545-3-christian@paral.in>
References: <20190317012142.10545-1-christian@paral.in>
 <20190317012142.10545-3-christian@paral.in>
Message-ID: <067385b4-62bb-fcdd-95f2-9f50fb5804e2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/03/2019 02:21, Christian Stewart wrote:
>  DOCKER_CONTAINERD_LDFLAGS = \
> -	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
> +	-X github.com/containerd/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)

 This looks like a completely independent change. Or is it because we now have a
go.mod that calls the module containerd/containerd instead of docker/containerd?


> -DOCKER_CONTAINERD_BUILD_TARGETS = cmd/ctr cmd/containerd cmd/containerd-shim
> +DOCKER_CONTAINERD_BUILD_TARGETS = \
> +	github.com/containerd/containerd/cmd/ctr \
> +	github.com/containerd/containerd/cmd/containerd \
> +	github.com/containerd/containerd/cmd/containerd-shim

 Same question, how is this related to the go modules?

 Would it be possible (and useful) to add those prefixes automatically?

 Regards,
 Arnout

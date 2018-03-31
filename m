From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Mar 2018 15:34:34 +0200
Subject: [Buildroot] [PATCH v4 1/8] docker-containerd: remove symlink to
 $(RUNC_SRCDIR)
In-Reply-To: <20180331132736.21105-2-thomas.petazzoni@bootlin.com>
References: <20180331132736.21105-1-thomas.petazzoni@bootlin.com>
 <20180331132736.21105-2-thomas.petazzoni@bootlin.com>
Message-ID: <20180331133434.GE25161@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-03-31 15:27 +0200, Thomas Petazzoni spake thusly:
> The DOCKER_CONTAINERD_CONFIGURE_CMDS creates a symlink to runc's
> source directory, but it does not build depend on runc, which means
> that the runc package may not have been extracted/built before
> docker-containerd.
> 
> Therefore, when doing a build with "make docker-containerd", this
> symbolic link is broken, but it doesn't prevent docker-containerd from
> building.
> 
> Therefore, this symlink is not necessary and be dropped.

*can be dropped

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/docker-containerd/docker-containerd.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
> index ffbadb0c3f..8f0822b77f 100644
> --- a/package/docker-containerd/docker-containerd.mk
> +++ b/package/docker-containerd/docker-containerd.mk
> @@ -27,8 +27,6 @@ endif
>  define DOCKER_CONTAINERD_CONFIGURE_CMDS
>  	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker
>  	ln -s $(@D) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker/containerd
> -	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers
> -	ln -s $(RUNC_SRCDIR) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers/runc
>  endef
>  
>  define DOCKER_CONTAINERD_BUILD_CMDS
> -- 
> 2.14.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

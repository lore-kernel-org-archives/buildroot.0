From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 4 Jul 2016 11:40:08 +0200
Subject: [Buildroot] [PATCH 1/3] package/go-bootstrap: Build host tools
 with host CC
In-Reply-To: <78eb610ef2c82ae5c2adb5be9309401eeffe8cfb.1463696779.git.geoff@infradead.org>
References: <cover.1463696779.git.geoff@infradead.org>
 <78eb610ef2c82ae5c2adb5be9309401eeffe8cfb.1463696779.git.geoff@infradead.org>
Message-ID: <c3671ab3-be2e-e2b5-c29e-cf849cc96a5d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Geoff,

Le 20/05/2016 ? 00:33, Geoff Levand a ?crit :
> Use the host compiler when building host tools.
> 
> The go build system is not compatable with ccache, so use HOSTCC_NOCCACHE
> here.  See https://github.com/golang/go/issues/11685.
> 
> Signed-off-by: Geoff Levand <geoff@infradead.org>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> ---
>  package/go-bootstrap/go-bootstrap.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/go-bootstrap/go-bootstrap.mk b/package/go-bootstrap/go-bootstrap.mk
> index 47f5013..29f2b03 100644
> --- a/package/go-bootstrap/go-bootstrap.mk
> +++ b/package/go-bootstrap/go-bootstrap.mk
> @@ -19,11 +19,14 @@ HOST_GO_BOOTSTRAP_DEPENDENCIES = toolchain
>  
>  HOST_GO_BOOTSTRAP_ROOT = $(HOST_DIR)/usr/lib/go-$(GO_BOOTSTRAP_VERSION)
>  
> +# The go build system is not compatable with ccache, so use HOSTCC_NOCCACHE
> +# here.  See https://github.com/golang/go/issues/11685.
>  HOST_GO_BOOTSTRAP_MAKE_ENV = \
>  	GOOS=linux \
>  	GOROOT_FINAL="$(HOST_GO_BOOTSTRAP_ROOT)" \
>  	GOROOT="$(@D)" \
>  	GOBIN="$(@D)/bin" \
> +	CC=$(HOSTCC_NOCCACHE) \
>  	CGO_ENABLED=0
>  
>  define HOST_GO_BOOTSTRAP_BUILD_CMDS
> 

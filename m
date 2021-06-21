From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Jun 2021 22:52:54 +0200
Subject: [Buildroot] [PATCH 02/15] package/e2fsprogs: fix fsck overwrite
 in HOST_DIR
In-Reply-To: <20210621141130.48654-3-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-3-herve.codina@bootlin.com>
Message-ID: <20210621225254.5ad3e48b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Jun 2021 16:11:17 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> host-e2fsprog overwrites fsck program and some man related files
> previously installed by host-util-linux.

"The host-e2fsprogs package overwrites the fsck program and some
manpages previously installed by the host-util-linux package".

> 
> This patch simply disable fsck in host-e2fsprog.

disableS

host-e2fsprogs

> host-e2fsprog is used to build final ext{2,3,4} images.

host-e2fsprogs

> The missing host-e2fsprog fsck tool (filesystem integrity check

host-e2fsprogs

> tool) in HOST_DIR should not lead to issues.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

With that:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

> ---
>  package/e2fsprogs/e2fsprogs.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index 0a69690e2f..bd147e737e 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -27,6 +27,7 @@ HOST_E2FSPROGS_CONF_OPTS = \
>  	--disable-defrag \
>  	--disable-e2initrd-helper \
>  	--disable-fuse2fs \
> +	--disable-fsck \
>  	--disable-libblkid \
>  	--disable-libuuid \
>  	--disable-testio-debug \



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

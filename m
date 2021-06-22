From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 22 Jun 2021 21:40:24 +0200
Subject: [Buildroot] [PATCH 02/15] package/e2fsprogs: fix fsck overwrite
 in HOST_DIR
In-Reply-To: <20210621141130.48654-3-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-3-herve.codina@bootlin.com>
Message-ID: <20210622194024.GH44262@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herv?, All,

On 2021-06-21 16:11 +0200, Herve Codina spake thusly:
> host-e2fsprog overwrites fsck program and some man related files
> previously installed by host-util-linux.
> 
> This patch simply disable fsck in host-e2fsprog.
> 
> host-e2fsprog is used to build final ext{2,3,4} images.
> The missing host-e2fsprog fsck tool (filesystem integrity check
> tool) in HOST_DIR should not lead to issues.

And the target variant is not susceptible to that issue, because
e2fsprogs' fsck depends on !BR2_PACKAGE_UTIL_LINUX_FSCK. So we're clean
there.

Except for the comments by Thomas, you can carry my:

    Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

when you respin this patch.

Regards,
Yann E. MORIN.

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
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
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

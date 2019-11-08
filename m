From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Nov 2019 21:42:30 +0100
Subject: [Buildroot] [PATCH] package/pkg-meson: really generate the
 global cross-compilation.conf
Message-ID: <20191108204229.GJ3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-11-06 16:25 +0100, Thomas Petazzoni spake thusly:
> Commit ccc9e05990a44d8db5825c07ed61d405ebb40caa ("package/meson:
> install cross-compilation.conf during toolchain install") moved the
> logic to generate the global cross-compilation.conf from
> package/meson/meson.mk to package/pkg-meson.mk. While doing so, it
> renamed the macro from HOST_MESON_INSTALL_CROSS_CONF to
> PKG_MESON_INSTALL_CROSS_CONF, but the registration of this hook in
> TOOLCHAIN_POST_INSTALL_STAGING_HOOKS was not changed accordingly: it
> is still registering HOST_MESON_INSTALL_CROSS_CONF.
> 
> Due to this, the global cross-compilation.conf file was no longer
> generated.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to master. Thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-meson.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index b11bc3a7c0..e7eea2aa58 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -205,4 +205,4 @@ define PKG_MESON_INSTALL_CROSS_CONF
>  	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
>  endef
>  
> -TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += HOST_MESON_INSTALL_CROSS_CONF
> +TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += PKG_MESON_INSTALL_CROSS_CONF
> -- 
> 2.21.0
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

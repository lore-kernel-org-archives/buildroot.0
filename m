From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Jul 2014 00:47:20 +0200
Subject: [Buildroot] [PATCH 1/2] xlib_libFS: Add missing host-pkgconf
 dependency
In-Reply-To: <1405809671-4609-1-git-send-email-bernd.kuhls@t-online.de>
References: <1405809671-4609-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140719224720.GM3593@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-07-20 00:41 +0200, Bernd Kuhls spake thusly:
> Fixes compile error:
> 
> checking for FS... configure: error: in `/home/br/br/output/build/xlib_libFS-1.0.6':
> configure: error: The pkg-config script could not be found or is too old.  Make sure it
> is in your PATH or set the PKG_CONFIG environment variable to the full
> path to pkg-config.
> 
> Alternatively, you may set the environment variables FS_CFLAGS
> and FS_LIBS to avoid the need to call pkg-config.
> See the pkg-config man page for more details.
> 
> To get pkg-config, see <http://pkg-config.freedesktop.org/>.
> See `config.log' for more details
> 
> using this minimal defconfig
> 
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_XAPP_XFS=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/x11r7/xlib_libFS/xlib_libFS.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
> index 19d2800..d7dcb74 100644
> --- a/package/x11r7/xlib_libFS/xlib_libFS.mk
> +++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
> @@ -10,7 +10,7 @@ XLIB_LIBFS_SITE = http://xorg.freedesktop.org/releases/individual/lib
>  XLIB_LIBFS_LICENSE = MIT
>  XLIB_LIBFS_LICENSE_FILES = COPYING
>  XLIB_LIBFS_INSTALL_STAGING = YES
> -XLIB_LIBFS_DEPENDENCIES = xlib_xtrans xproto_xproto xproto_fontsproto
> +XLIB_LIBFS_DEPENDENCIES = xlib_xtrans xproto_xproto xproto_fontsproto host-pkgconf
>  XLIB_LIBFS_CONF_OPT = --disable-malloc0returnsnull
>  
>  $(eval $(autotools-package))
> -- 
> 1.7.10.4
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

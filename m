From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Jul 2018 23:57:54 +0200
Subject: [Buildroot] [PATCH v3 11/22] package/x11r7/xlib_*: mass switch
 to xorgproto
In-Reply-To: <20180630110853.29339-12-bernd.kuhls@t-online.de>
References: <20180630110853.29339-1-bernd.kuhls@t-online.de>
 <20180630110853.29339-12-bernd.kuhls@t-online.de>
Message-ID: <20180702215754.GQ2604@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2018-06-30 13:08 +0200, Bernd Kuhls spake thusly:
> The new package xorgproto will combine and replace all current xproto_*
> packages. For details read
> https://lists.x.org/archives/xorg-announce/2018-February/002835.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[--SNIP--]
> diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
> index 1c50cb2e4e..d8bac5426a 100644
> --- a/package/x11r7/xlib_libXau/xlib_libXau.mk
> +++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
> @@ -10,9 +10,9 @@ XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
>  XLIB_LIBXAU_LICENSE = MIT
>  XLIB_LIBXAU_LICENSE_FILES = COPYING
>  XLIB_LIBXAU_INSTALL_STAGING = YES
> -XLIB_LIBXAU_DEPENDENCIES = host-pkgconf xutil_util-macros xproto_xproto
> +XLIB_LIBXAU_DEPENDENCIES = host-pkgconf xutil_util-macros xorgproto
>  HOST_XLIB_LIBXAU_DEPENDENCIES = \
> -	host-pkgconf host-xutil_util-macros host-xproto_xproto
> +	host-pkgconf host-xutil_util-macros xorgproto

Did you mean host-xorgproto instead?

[--SNIP--]
> diff --git a/package/x11r7/xlib_libXt/Config.in b/package/x11r7/xlib_libXt/Config.in
> index 6557e20bcd..0f55780886 100644
> --- a/package/x11r7/xlib_libXt/Config.in
> +++ b/package/x11r7/xlib_libXt/Config.in
> @@ -2,8 +2,7 @@ config BR2_PACKAGE_XLIB_LIBXT
>  	bool "libXt"
>  	select BR2_PACKAGE_XLIB_LIBSM
>  	select BR2_PACKAGE_XLIB_LIBX11
> -	select BR2_PACKAGE_XPROTO_KBPROTO
> -	select BR2_PACKAGE_XPROTO_XPROTO
> +	select BR2_PACKAGE_XORGPROTO
>  	select BR2_PACKAGE_XCB_PROTO

To be sure, xcb-proto is still a separate package, right?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

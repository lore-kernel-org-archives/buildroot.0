From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Jul 2018 23:23:57 +0200
Subject: [Buildroot] [PATCH v3 04/22] package/libdri2: switch to
 xorgproto
In-Reply-To: <20180630110853.29339-5-bernd.kuhls@t-online.de>
References: <20180630110853.29339-1-bernd.kuhls@t-online.de>
 <20180630110853.29339-5-bernd.kuhls@t-online.de>
Message-ID: <20180702212357.GJ2604@scaer>
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

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libdri2/Config.in  | 2 +-
>  package/libdri2/libdri2.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libdri2/Config.in b/package/libdri2/Config.in
> index a10df7404a..fa3f76e8f3 100644
> --- a/package/libdri2/Config.in
> +++ b/package/libdri2/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBDRI2
>  	select BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_XLIB_LIBXDAMAGE
>  	select BR2_PACKAGE_XLIB_LIBXEXT
> -	select BR2_PACKAGE_XPROTO_DRI2PROTO
> +	select BR2_PACKAGE_XORGPROTO
>  	help
>  	  Library for the DRI2 extension to the X Window System.
>  
> diff --git a/package/libdri2/libdri2.mk b/package/libdri2/libdri2.mk
> index 22854b5060..79f38c680b 100644
> --- a/package/libdri2/libdri2.mk
> +++ b/package/libdri2/libdri2.mk
> @@ -6,7 +6,7 @@
>  
>  LIBDRI2_VERSION = 4f1eef3183df2b270c3d5cbef07343ee5127a6a4
>  LIBDRI2_SITE = $(call github,robclark,libdri2,$(LIBDRI2_VERSION))
> -LIBDRI2_DEPENDENCIES = xlib_libXext xproto_dri2proto xlib_libXdamage libdrm
> +LIBDRI2_DEPENDENCIES = xlib_libXext xlib_libXdamage xorgproto libdrm
>  LIBDRI2_LICENSE = MIT
>  LIBDRI2_LICENSE_FILES = COPYING
>  
> -- 
> 2.17.1
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

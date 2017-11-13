From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Nov 2017 22:09:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_xdriinfo: fix libgl
 dependency
In-Reply-To: <20171113192349.32543-1-bernd.kuhls@t-online.de>
References: <20171113192349.32543-1-bernd.kuhls@t-online.de>
Message-ID: <20171113210937.GD2861@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-11-13 20:23 +0100, Bernd Kuhls spake thusly:
> Fixes
> "mesa3d is in the dependency chain of xapp_xdriinfo that has added it
>  to its _DEPENDENCIES variable without selecting it or depending on it
>  from Config.in."
> http://autobuild.buildroot.net/results/d8a/d8aeed2f64e21a277eb0bc5dc08d2339a14c682e/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Bug was introduced in 2014:
> https://git.buildroot.net/buildroot/commit/package/x11r7/xapp_xdriinfo/Config.in?id=e49a0c656a1a27b80bca730f40101f6ff37d42af
> 
>  package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
> index bb00d3ba07..ffab5170dc 100644
> --- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
> +++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
> @@ -9,6 +9,6 @@ XAPP_XDRIINFO_SOURCE = xdriinfo-$(XAPP_XDRIINFO_VERSION).tar.bz2
>  XAPP_XDRIINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
>  XAPP_XDRIINFO_LICENSE = MIT
>  XAPP_XDRIINFO_LICENSE_FILES = COPYING
> -XAPP_XDRIINFO_DEPENDENCIES = xlib_libX11 xproto_glproto mesa3d
> +XAPP_XDRIINFO_DEPENDENCIES = libgl xlib_libX11 xproto_glproto
>  
>  $(eval $(autotools-package))
> -- 
> 2.11.0
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

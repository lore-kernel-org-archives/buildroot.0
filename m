From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Jul 2018 23:59:30 +0200
Subject: [Buildroot] [PATCH v3 12/22] package/x11r7/xutil_makedepend:
 switch to xorgproto
In-Reply-To: <20180630110853.29339-13-bernd.kuhls@t-online.de>
References: <20180630110853.29339-1-bernd.kuhls@t-online.de>
 <20180630110853.29339-13-bernd.kuhls@t-online.de>
Message-ID: <20180702215930.GR2604@scaer>
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
>  package/x11r7/xutil_makedepend/Config.in           | 1 +
>  package/x11r7/xutil_makedepend/xutil_makedepend.mk | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/x11r7/xutil_makedepend/Config.in b/package/x11r7/xutil_makedepend/Config.in
> index 0b091b0e34..fdf2fb92c1 100644
> --- a/package/x11r7/xutil_makedepend/Config.in
> +++ b/package/x11r7/xutil_makedepend/Config.in
> @@ -1,4 +1,5 @@
>  config BR2_PACKAGE_XUTIL_MAKEDEPEND
>  	bool "makedepend"
> +	select BR2_PACKAGE_XORGPROTO
>  	help
>  	  No description available
> diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
> index 6fd3c1ae36..8a058efcec 100644
> --- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
> +++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
> @@ -10,8 +10,8 @@ XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
>  XUTIL_MAKEDEPEND_LICENSE = MIT
>  XUTIL_MAKEDEPEND_LICENSE_FILES = COPYING
>  
> -XUTIL_MAKEDEPEND_DEPENDENCIES = xproto_xproto
> -HOST_XUTIL_MAKEDEPEND_DEPENDENCIES = host-xproto_xproto
> +XUTIL_MAKEDEPEND_DEPENDENCIES = xorgproto
> +HOST_XUTIL_MAKEDEPEND_DEPENDENCIES = host-xorgproto
>  
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
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

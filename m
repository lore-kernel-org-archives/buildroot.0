From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Jul 2018 23:31:42 +0200
Subject: [Buildroot] [PATCH v3 05/22] package/libvdpau: switch to
 xorgproto
In-Reply-To: <20180630110853.29339-6-bernd.kuhls@t-online.de>
References: <20180630110853.29339-1-bernd.kuhls@t-online.de>
 <20180630110853.29339-6-bernd.kuhls@t-online.de>
Message-ID: <20180702213142.GL2604@scaer>
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

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>o

Regards,
Yann E. MORIN.

> ---
>  package/libvdpau/libvdpau.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libvdpau/libvdpau.mk b/package/libvdpau/libvdpau.mk
> index f29da1e406..93446dbf28 100644
> --- a/package/libvdpau/libvdpau.mk
> +++ b/package/libvdpau/libvdpau.mk
> @@ -18,8 +18,8 @@ LIBVDPAU_DEPENDENCIES = host-pkgconf xlib_libX11 xlib_libXext
>  
>  LIBVDPAU_CONF_OPTS = --with-module-dir=/usr/lib/vdpau
>  
> -ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
> -LIBVDPAU_DEPENDENCIES += xproto_dri2proto
> +ifeq ($(BR2_PACKAGE_XORGPROTO),y)
> +LIBVDPAU_DEPENDENCIES += xorgproto
>  LIBVDPAU_CONF_OPTS += --enable-dri2
>  else
>  LIBVDPAU_CONF_OPTS += --disable-dri2
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

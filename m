From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 7 Sep 2017 18:24:51 +0200
Subject: [Buildroot] [PATCH 3/4] package/tvheadend: add optional support
 for libva-accelerated transcoding
In-Reply-To: <20170906204908.30036-3-bernd.kuhls@t-online.de>
References: <20170906204908.30036-1-bernd.kuhls@t-online.de>
 <20170906204908.30036-3-bernd.kuhls@t-online.de>
Message-ID: <20170907162451.GC2973@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-09-06 22:49 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/tvheadend/tvheadend.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index 4722cb006..ee3607ae9 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -29,6 +29,12 @@ endif
>  ifeq ($(BR2_PACKAGE_TVHEADEND_TRANSCODING),y)
>  TVHEADEND_CONF_OPTS += --enable-libav --enable-libx264
>  TVHEADEND_DEPENDENCIES += ffmpeg x264
> +ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_XORG7),yy)
> +TVHEADEND_CONF_OPTS += --enable-vaapi
> +TVHEADEND_DEPENDENCIES += libva
> +else
> +TVHEADEND_CONF_OPTS += --disable-vaapi
> +endif
>  ifeq ($(BR2_PACKAGE_OPUS),y)
>  TVHEADEND_CONF_OPTS += --enable-libopus
>  TVHEADEND_DEPENDENCIES += opus
> @@ -45,6 +51,7 @@ else
>  TVHEADEND_CONF_OPTS += \
>  	--disable-libav \
>  	--disable-libopus \
> +	--disable-vaapi \
>  	--disable-libx264 \
>  	--disable-libx265
>  endif
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

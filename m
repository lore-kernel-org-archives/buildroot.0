From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 7 Sep 2017 18:25:20 +0200
Subject: [Buildroot] [PATCH 4/4] package/tvheadend: add optional support
 for rpi-userland
In-Reply-To: <20170906204908.30036-4-bernd.kuhls@t-online.de>
References: <20170906204908.30036-1-bernd.kuhls@t-online.de>
 <20170906204908.30036-4-bernd.kuhls@t-online.de>
Message-ID: <20170907162520.GD2973@scaer>
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
> index ee3607ae9..cf8bee9ce 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -41,6 +41,12 @@ TVHEADEND_DEPENDENCIES += opus
>  else
>  TVHEADEND_CONF_OPTS += --disable-libopus
>  endif
> +ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> +TVHEADEND_CONF_OPTS += --enable-omx
> +TVHEADEND_DEPENDENCIES += rpi-userland
> +else
> +TVHEADEND_CONF_OPTS += --disable-omx
> +endif
>  ifeq ($(BR2_PACKAGE_X265),y)
>  TVHEADEND_CONF_OPTS += --enable-libx265
>  TVHEADEND_DEPENDENCIES += x265
> @@ -51,6 +57,7 @@ else
>  TVHEADEND_CONF_OPTS += \
>  	--disable-libav \
>  	--disable-libopus \
> +	--disable-omx \
>  	--disable-vaapi \
>  	--disable-libx264 \
>  	--disable-libx265
> -- 
> 2.11.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

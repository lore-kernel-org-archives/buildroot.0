From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Feb 2020 15:02:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpjsip: add openh264 support
In-Reply-To: <20200202135352.3841459-1-fontaine.fabrice@gmail.com>
References: <20200202135352.3841459-1-fontaine.fabrice@gmail.com>
Message-ID: <20200202140200.GB25002@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-02 14:53 +0100, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libpjsip/libpjsip.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index 86cd31fc81..655ab4498c 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -35,7 +35,6 @@ LIBPJSIP_CONF_OPTS = \
>  	--disable-g722-codec \
>  	--disable-sdl \
>  	--disable-ffmpeg \
> -	--disable-openh264 \
>  	--disable-ipp \
>  	--disable-silk \
>  	--with-external-srtp
> @@ -69,6 +68,13 @@ LIBPJSIP_CONF_OPTS += \
>  	--disable-gsm-codec
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBOPENH264),y)
> +LIBPJSIP_DEPENDENCIES += libopenh264
> +LIBPJSIP_CONF_OPTS += --with-openh264=$(STAGING_DIR)/usr
> +else
> +LIBPJSIP_CONF_OPTS += --disable-openh264
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
>  LIBPJSIP_DEPENDENCIES += libopenssl
>  LIBPJSIP_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
> -- 
> 2.24.1
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

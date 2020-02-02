From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Feb 2020 12:21:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpjsip: add libyuv support
In-Reply-To: <20200202104557.3342451-1-fontaine.fabrice@gmail.com>
References: <20200202104557.3342451-1-fontaine.fabrice@gmail.com>
Message-ID: <20200202112137.GA2643@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-02 11:45 +0100, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libpjsip/libpjsip.mk | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> index a9febcf9c6..86cd31fc81 100644
> --- a/package/libpjsip/libpjsip.mk
> +++ b/package/libpjsip/libpjsip.mk
> @@ -36,7 +36,6 @@ LIBPJSIP_CONF_OPTS = \
>  	--disable-sdl \
>  	--disable-ffmpeg \
>  	--disable-openh264 \
> -	--disable-libyuv \
>  	--disable-ipp \
>  	--disable-silk \
>  	--with-external-srtp
> @@ -94,6 +93,15 @@ else
>  LIBPJSIP_CONF_OPTS += --disable-v4l2
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBYUV),y)
> +LIBPJSIP_DEPENDENCIES += libyuv
> +LIBPJSIP_CONF_OPTS += \
> +	--enable-libyuv \
> +	--with-external-yuv
> +else
> +LIBPJSIP_CONF_OPTS += --disable-libyuv
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OPENCORE_AMR),y)
>  LIBPJSIP_DEPENDENCIES += opencore-amr
>  LIBPJSIP_CONF_OPTS += --with-opencore-amr=$(STAGING_DIR)/usr
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

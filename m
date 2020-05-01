From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2020 21:50:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: add cups support
In-Reply-To: <20200501154950.3790-1-skif@skif-web.ru>
References: <20200501154950.3790-1-skif@skif-web.ru>
Message-ID: <20200501195023.GE3687@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2020-05-01 18:49 +0300, Alexey Lukyanchuk spake thusly:
> Ghostscript can be used for cups printing.
> 
> In current version it's disabled, but may be needed for some customers.
> 
> This patch add cups support if cups enabled.
> 
> Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ghostscript/ghostscript.mk | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
> index 1d6f8d04a0..7d12195f17 100644
> --- a/package/ghostscript/ghostscript.mk
> +++ b/package/ghostscript/ghostscript.mk
> @@ -39,7 +39,6 @@ GHOSTSCRIPT_CONF_ENV = \
>  
>  GHOSTSCRIPT_CONF_OPTS = \
>  	--disable-compile-inits \
> -	--disable-cups \
>  	--enable-fontconfig \
>  	--with-fontpath=/usr/share/fonts \
>  	--enable-freetype \
> @@ -68,6 +67,15 @@ else
>  GHOSTSCRIPT_CONF_OPTS += --disable-openjpeg
>  endif
>  
> +ifeq ($(BR2_PACKAGE_CUPS),y)
> +GHOSTSCRIPT_DEPENDENCIES += cups
> +GHOSTSCRIPT_CONF_OPTS  += \
> +	CUPSCONFIG=$(STAGING_DIR)/usr/bin/cups-config \
> +	--enable-cups
> +else
> +GHOSTSCRIPT_CONF_OPTS += --disable-cups
> +endif
> +
>  ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
>  GHOSTSCRIPT_DEPENDENCIES += xlib_libX11
>  GHOSTSCRIPT_CONF_OPTS += --with-x
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
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

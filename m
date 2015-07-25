From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 19:14:34 +0200
Subject: [Buildroot] [PATCH 05/47] package/kodi: Add option for lirc
 support
In-Reply-To: <1437597069-6448-6-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
 <1437597069-6448-6-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150725171433.GR3662@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-07-22 22:30 +0200, Bernd Kuhls spake thusly:
> https://github.com/xbmc/xbmc/commit/b641e1eea54b4b9ab7f1b95092ab0a755abc63be
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/kodi/Config.in |    5 +++++
>  package/kodi/kodi.mk   |    6 ++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 62553d4..7d4b068 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -166,6 +166,11 @@ comment "hdmi cec support needs udev /dev management and a toolchain w/ dynamic
>  	depends on !BR2_GCC_VERSION_4_5_X
>  	depends on BR2_STATIC_LIBS || !BR2_PACKAGE_HAS_UDEV
>  
> +config BR2_PACKAGE_KODI_LIRC
> +	bool "lirc"
> +	help
> +	  Enable lirc support
> +
>  config BR2_PACKAGE_KODI_LIBMICROHTTPD
>  	bool "web server"
>  	select BR2_PACKAGE_LIBMICROHTTPD
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 0ab3114..f62f1a5 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -185,6 +185,12 @@ else
>  KODI_CONF_OPTS += --disable-libcec
>  endif
>  
> +ifeq ($(BR2_PACKAGE_KODI_LIRC),y)
> +KODI_CONF_OPTS += --enable-lirc
> +else
> +KODI_CONF_OPTS += --disable-lirc
> +endif
> +
>  ifeq ($(BR2_PACKAGE_KODI_WAVPACK),y)
>  KODI_DEPENDENCIES += wavpack
>  endif
> -- 
> 1.7.10.4
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

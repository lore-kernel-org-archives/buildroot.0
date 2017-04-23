From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 10:46:52 +0200
Subject: [Buildroot] [PATCH v5 16/34] package/kodi: add optional support
 for lcms2
In-Reply-To: <20170417195433.26672-17-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-17-bernd.kuhls@t-online.de>
Message-ID: <20170423084652.GI2819@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-17 21:54 +0200, Bernd Kuhls spake thusly:
> Support was added by https://github.com/xbmc/xbmc/pull/11846
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/kodi/Config.in | 6 ++++++
>  package/kodi/kodi.mk   | 7 +++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 013d343a4..cc8470319 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -155,6 +155,12 @@ config BR2_PACKAGE_KODI_LIBCEC
>  comment "hdmi cec support needs udev /dev management"
>  	depends on !BR2_PACKAGE_HAS_UDEV
>  
> +config BR2_PACKAGE_KODI_LCMS2
> +	bool "lcms2"
> +	select BR2_PACKAGE_LCMS2
> +	help
> +	  Enable color management support.
> +
>  config BR2_PACKAGE_KODI_LIRC
>  	bool "lirc"
>  	help
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index a0fc4d992..2e8e047be 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -298,6 +298,13 @@ else
>  KODI_CONF_OPTS += -DENABLE_CEC=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_KODI_LCMS2),y)
> +KODI_DEPENDENCIES += lcms2
> +KODI_CONF_OPTS += -DENABLE_LCMS2=ON
> +else
> +KODI_CONF_OPTS += -DENABLE_LCMS2=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_KODI_LIRC),y)
>  KODI_CONF_OPTS += -DENABLE_LIRC=ON
>  else
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

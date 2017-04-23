From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 10:43:39 +0200
Subject: [Buildroot] [PATCH v5 15/34] package/kodi: add optional support
 for event clients
In-Reply-To: <20170417195433.26672-16-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-16-bernd.kuhls@t-online.de>
Message-ID: <20170423084339.GH2819@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-17 21:54 +0200, Bernd Kuhls spake thusly:
> For details read
> https://github.com/xbmc/xbmc/blob/master/tools/EventClients/README.txt

This pointer...

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/Config.in | 5 +++++
>  package/kodi/kodi.mk   | 6 ++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index c3f73e713..013d343a4 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -132,6 +132,11 @@ config BR2_PACKAGE_KODI_DBUS
>  	help
>  	  Enable D-Bus support
>  
> +config BR2_PACKAGE_KODI_EVENTCLIENTS
> +	bool "eventclients"
> +	help
> +	  Enable event clients support

... should also be here in the help text. ;-)

Otherwise:
    
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  config BR2_PACKAGE_KODI_LIBBLURAY
>  	bool "blu-ray"
>  	select BR2_PACKAGE_LIBBLURAY
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 6cc56718d..a0fc4d992 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -213,6 +213,12 @@ else
>  KODI_CONF_OPTS += -DENABLE_DBUS=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_KODI_EVENTCLIENTS),y)
> +KODI_CONF_OPTS += -DENABLE_EVENTCLIENTS=ON
> +else
> +KODI_CONF_OPTS += -DENABLE_EVENTCLIENTS=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_KODI_ALSA_LIB),y)
>  KODI_CONF_OPTS += -DENABLE_ALSA=ON
>  KODI_DEPENDENCIES += alsa-lib
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

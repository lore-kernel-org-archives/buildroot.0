From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 12:32:49 +0200
Subject: [Buildroot] [PATCH v5 33/34] package/kodi-skin-confluence: new
 package
In-Reply-To: <20170417195433.26672-34-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-34-bernd.kuhls@t-online.de>
Message-ID: <20170423103249.GO7228@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-17 21:54 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I did a build that had confuence enabled and set as the default skin,
but still the skin used was not conjfluence (it was estuary or the
other, I don't remeber), and confluence did not appear in the list of
available skins...

Regards,
Yann E. MORIN.

> ---
>  package/kodi-skin-confluence/Config.in             |  6 ++++++
>  .../kodi-skin-confluence/kodi-skin-confluence.hash |  2 ++
>  .../kodi-skin-confluence/kodi-skin-confluence.mk   | 25 ++++++++++++++++++++++
>  package/kodi/Config.in                             |  4 ++++
>  4 files changed, 37 insertions(+)
>  create mode 100644 package/kodi-skin-confluence/Config.in
>  create mode 100644 package/kodi-skin-confluence/kodi-skin-confluence.hash
>  create mode 100644 package/kodi-skin-confluence/kodi-skin-confluence.mk
> 
> diff --git a/package/kodi-skin-confluence/Config.in b/package/kodi-skin-confluence/Config.in
> new file mode 100644
> index 000000000..08b656808
> --- /dev/null
> +++ b/package/kodi-skin-confluence/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_KODI_SKIN_CONFLUENCE
> +	bool "kodi-skin-confluence"
> +	help
> +	  Kodi confluence skin
> +
> +	  https://github.com/xbmc/skin.confluence
> diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
> new file mode 100644
> index 000000000..7579f694c
> --- /dev/null
> +++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 54f08dd036c9d2fc0b19768060beae5ac2042263375cbaf8a41d5ca0ac7fdc47  kodi-skin-confluence-a87bd1ddd13aff52ad58d9d3f5af91e4567e58c6.tar.gz
> diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
> new file mode 100644
> index 000000000..3ab22ff4e
> --- /dev/null
> +++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# kodi-skin-confluence
> +#
> +################################################################################
> +
> +KODI_SKIN_CONFLUENCE_VERSION = a87bd1ddd13aff52ad58d9d3f5af91e4567e58c6
> +KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
> +KODI_SKIN_CONFLUENCE_LICENSE = GPLv2+
> +KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
> +KODI_SKIN_CONFLUENCE_DEPENDENCIES = kodi
> +KODI_SKIN_CONFLUENCE_CONF_OPTS = -DOVERRIDE_PATHS=1
> +
> +define KODI_SKIN_CONFLUENCE_BUILD_CMDS
> +	$(HOST_DIR)/usr/bin/TexturePacker -input $(@D)/media/ -output $(@D)/media/Textures.xbt -dupecheck -use_none
> +endef
> +
> +define KODI_SKIN_CONFLUENCE_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence
> +	cp -dpfr $(@D)/* $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence
> +	find $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence/media -name *.jpg -delete
> +	find $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence/media -name *.png -delete
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index f4095c9fe..90e432754 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -332,6 +332,10 @@ menu "Screensavers"
>  	source "package/kodi-screensaver-stars/Config.in"
>  endmenu
>  
> +menu "Skins"
> +	source "package/kodi-skin-confluence/Config.in"
> +endmenu
> +
>  menu "Visualisations"
>  	source "package/kodi-visualisation-fishbmc/Config.in"
>  	source "package/kodi-visualisation-goom/Config.in"
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

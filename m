From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 1 May 2017 09:46:21 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/kodi-skin-confluence: new
 package
In-Reply-To: <20170429203608.17700-1-bernd.kuhls@t-online.de>
References: <20170429203608.17700-1-bernd.kuhls@t-online.de>
Message-ID: <20170501074621.GA3118@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-29 22:36 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Yet, a little comment, blow...

> ---
[--SNIP--]
> diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
> new file mode 100644
> index 000000000..c679ec687
> --- /dev/null
> +++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# kodi-skin-confluence
> +#
> +################################################################################
> +

Like for other Kodi packages, should we add "on the Krypton branch" ?

Regards,
Yann E. MORIN.

> +KODI_SKIN_CONFLUENCE_VERSION = 7044dabb3a818d7ff47b7a34bfb3480f2a9441d9
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
> index 6bc81338a..cc747e816 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -326,6 +326,10 @@ menu "Screensavers"
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

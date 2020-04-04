From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Apr 2020 20:00:10 +0200
Subject: [Buildroot] [PATCH 1/2] package/cegui/cegui.mk: fix typos
In-Reply-To: <20200404165101.34931-1-b.bilas@grinn-global.com>
References: <20200404165101.34931-1-b.bilas@grinn-global.com>
Message-ID: <20200404180010.GH22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bartosz, All,

On 2020-04-04 18:51 +0200, Bartosz Bilas spake thusly:
> Configure options should be passed via CONF_OPTS not CONF_OTPS.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

You missed the epoxy case, so I also fixed it, and pushed to master.
Thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cegui/cegui.mk | 52 +++++++++++++++++++++---------------------
>  1 file changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
> index 657492a7f7..9a15511816 100644
> --- a/package/cegui/cegui.mk
> +++ b/package/cegui/cegui.mk
> @@ -25,93 +25,93 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_OGRE),y)
>  CEGUI_DEPENDENCIES += ogre
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_RENDERER_OGRE=ON
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_RENDERER_OGRE=ON
>  else
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_RENDERER_OGRE=OFF
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_RENDERER_OGRE=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_EXPAT),y)
>  CEGUI_DEPENDENCIES += expat
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_XMLPARSER_EXPAT=ON
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_EXPAT=ON
>  else
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_XMLPARSER_EXPAT=OFF
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_EXPAT=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_IRRLICHT),y)
>  CEGUI_DEPENDENCIES += irrlicht
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_RENDERER_IRRLICHT=ON
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_RENDERER_IRRLICHT=ON
>  else
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_RENDERER_IRRLICHT=OFF
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_RENDERER_IRRLICHT=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_SDL2)$(BR2_PACKAGE_SDL2_IMAGE),yy)
>  CEGUI_DEPENDENCIES += sdl2 sdl2_image
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_IMAGECODEC_SDL2=ON
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_IMAGECODEC_SDL2=ON
>  else
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_IMAGECODEC_SDL2=OFF
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_IMAGECODEC_SDL2=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_PCRE),y)
>  CEGUI_DEPENDENCIES += pcre
> -CEGUI_CONF_OTPS += -DCEGUI_HAS_PCRE_REGEX=ON
> +CEGUI_CONF_OPTS += -DCEGUI_HAS_PCRE_REGEX=ON
>  else
> -CEGUI_CONF_OTPS += -DCEGUI_HAS_PCRE_REGEX=OFF
> +CEGUI_CONF_OPTS += -DCEGUI_HAS_PCRE_REGEX=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_FREETYPE),y)
>  CEGUI_DEPENDENCIES += freetype
> -CEGUI_CONF_OTPS += -DCEGUI_HAS_FREETYPE=ON
> +CEGUI_CONF_OPTS += -DCEGUI_HAS_FREETYPE=ON
>  else
> -CEGUI_CONF_OTPS += -DCEGUI_HAS_FREETYPE=OFF
> +CEGUI_CONF_OPTS += -DCEGUI_HAS_FREETYPE=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_MINIZIP),y)
>  CEGUI_DEPENDENCIES += minizip
> -CEGUI_CONF_OTPS += -DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=ON
> +CEGUI_CONF_OPTS += -DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=ON
>  else
> -CEGUI_CONF_OTPS += -DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF
> +CEGUI_CONF_OPTS += -DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_XERCES),y)
>  CEGUI_DEPENDENCIES += xerces
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_XMLPARSER_XERCES=ON
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_XERCES=ON
>  else
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_XMLPARSER_XERCES=OFF
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_XERCES=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBXML2),y)
>  CEGUI_DEPENDENCIES += libxml2
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_XMLPARSER_LIBXML2=ON
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_LIBXML2=ON
>  else
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_XMLPARSER_LIBXML2=OFF
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_LIBXML2=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_RAPIDXML),y)
>  CEGUI_DEPENDENCIES += rapidxml
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_XMLPARSER_RAPIDXML=ON
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_RAPIDXML=ON
>  else
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_XMLPARSER_RAPIDXML=OFF
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_RAPIDXML=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_TINYXML),y)
>  CEGUI_DEPENDENCIES += tinyxml
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_XMLPARSER_TINYXML=ON
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML=ON
>  else
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_XMLPARSER_TINYXML=OFF
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_TINYXML2),y)
>  CEGUI_DEPENDENCIES += tinyxml2
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_XMLPARSER_TINYXML2=ON
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML2=ON
>  else
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_XMLPARSER_TINYXML2=OFF
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML2=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBFREEIMAGE),y)
>  CEGUI_DEPENDENCIES += libfreeimage
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_IMAGECODEC_FREEIMAGE=ON
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_IMAGECODEC_FREEIMAGE=ON
>  else
> -CEGUI_CONF_OTPS += -DCEGUI_BUILD_IMAGECODEC_FREEIMAGE=OFF
> +CEGUI_CONF_OPTS += -DCEGUI_BUILD_IMAGECODEC_FREEIMAGE=OFF
>  endif
>  
>  $(eval $(cmake-package))
> -- 
> 2.26.0
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

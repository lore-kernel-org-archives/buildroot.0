From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 30 Oct 2016 17:33:39 +0100
Subject: [Buildroot] [PATCH 05/10] package/glmark2: make it a waf-package
In-Reply-To: <f6fc1b27937bb6ba57a7324e383cb349665587cb.1477843328.git.yann.morin.1998@free.fr>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
 <f6fc1b27937bb6ba57a7324e383cb349665587cb.1477843328.git.yann.morin.1998@free.fr>
Message-ID: <2c6adec3-adba-f396-5eb2-8a2ce5598c29@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 30/10/2016 ? 17:02, Yann E. MORIN a ?crit :
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Spenser Gilliland <spenser@gillilanding.com>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  package/glmark2/glmark2.mk | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
> index 2f662fe..e35e36a 100644
> --- a/package/glmark2/glmark2.mk
> +++ b/package/glmark2/glmark2.mk
> @@ -8,7 +8,7 @@ GLMARK2_VERSION = fa71af2dfab711fac87b9504b6fc9862f44bf72a
>  GLMARK2_SITE = $(call github,glmark2,glmark2,$(GLMARK2_VERSION))
>  GLMARK2_LICENSE = GPLv3+ SGIv1
>  GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
> -GLMARK2_DEPENDENCIES = host-pkgconf host-python jpeg libpng \
> +GLMARK2_DEPENDENCIES = host-pkgconf jpeg libpng \
>  	$(if $(BR2_PACKAGE_HAS_LIBEGL),libegl) \
>  	$(if $(BR2_PACKAGE_HAS_LIBGLES),libgles) \
>  	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl)
> @@ -45,20 +45,4 @@ GLMARK2_CONF_OPTS += \
>  	--prefix=/usr \
>  	--with-flavors=$(subst $(space),$(comma),$(GLMARK2_FLAVORS))
>  
> -define GLMARK2_CONFIGURE_CMDS
> -	(cd $(@D); \
> -		$(TARGET_CONFIGURE_OPTS) \
> -		$(GLMARK2_CONF_ENV) \
> -		$(HOST_DIR)/usr/bin/python2 ./waf configure $(GLMARK2_CONF_OPTS) \
> -	)
> -endef
> -
> -define GLMARK2_BUILD_CMDS
> -	cd $(@D) && $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/python2 ./waf
> -endef
> -
> -define GLMARK2_INSTALL_TARGET_CMDS
> -	cd $(@D) && $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/python2 ./waf install --destdir=$(TARGET_DIR)
> -endef
> -
> -$(eval $(generic-package))
> +$(eval $(waf-package))
> 

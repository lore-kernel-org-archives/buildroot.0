From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 30 Oct 2016 17:40:58 +0100
Subject: [Buildroot] [PATCH 10/10] package/norm: make it a waf-package
In-Reply-To: <f821d5032f417f98141d6fb30f92c28feb16d2e0.1477843328.git.yann.morin.1998@free.fr>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
 <f821d5032f417f98141d6fb30f92c28feb16d2e0.1477843328.git.yann.morin.1998@free.fr>
Message-ID: <2ac50ddf-2fd0-72a7-114c-feea2d5cd10f@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 30/10/2016 ? 17:02, Yann E. MORIN a ?crit :
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  package/norm/norm.mk | 28 +++-------------------------
>  1 file changed, 3 insertions(+), 25 deletions(-)
> 
> diff --git a/package/norm/norm.mk b/package/norm/norm.mk
> index e1b3a5f..8af76f8 100644
> --- a/package/norm/norm.mk
> +++ b/package/norm/norm.mk
> @@ -15,32 +15,10 @@ ifeq ($(BR2_PACKAGE_LIBNETFILTER_QUEUE),y)
>  NORM_DEPENDENCIES += libnetfilter_queue
>  endif
>  
> -define NORM_CONFIGURE_CMDS
> -	cd $(@D); \
> -		$(TARGET_CONFIGURE_OPTS) \
> -		./waf configure --prefix=/usr
> -endef
> -
> -define NORM_BUILD_CMDS
> -	cd $(@D); \
> -		$(TARGET_MAKE_ENV) \
> -		./waf build
> -endef
> -
>  # install target doesn't install headers unfortunately...
> -define NORM_INSTALL_STAGING_CMDS
> -	cd $(@D); \
> -		$(TARGET_MAKE_ENV) \
> -		DESTDIR=$(STAGING_DIR) \
> -		./waf install
> +define NORM_INSTALL_HEADERS
>  	cp -f $(@D)/include/norm* $(STAGING_DIR)/usr/include
>  endef
> +NORM_POST_INSTALL_STAGING_HOOKS += NORM_INSTALL_HEADERS
>  
> -define NORM_INSTALL_TARGET_CMDS
> -	cd $(@D); \
> -		$(TARGET_MAKE_ENV) \
> -		DESTDIR=$(TARGET_DIR) \
> -		./waf install
> -endef
> -
> -$(eval $(generic-package))
> +$(eval $(waf-package))
> 

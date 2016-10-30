From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 30 Oct 2016 17:38:17 +0100
Subject: [Buildroot] [PATCH 07/10] package/jack2: make it a waf-package
In-Reply-To: <0a8d8d5285bc70ab413f32da9c5c4a23ed0e658a.1477843328.git.yann.morin.1998@free.fr>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
 <0a8d8d5285bc70ab413f32da9c5c4a23ed0e658a.1477843328.git.yann.morin.1998@free.fr>
Message-ID: <f51db4d2-0272-725f-c9ec-c338700c41a0@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 30/10/2016 ? 17:02, Yann E. MORIN a ?crit :
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Wojciech M. Zabolotny <wzab01@gmail.com>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  package/jack2/jack2.mk | 34 +++-------------------------------
>  1 file changed, 3 insertions(+), 31 deletions(-)
> 
> diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
> index fa9e451..23c9723 100644
> --- a/package/jack2/jack2.mk
> +++ b/package/jack2/jack2.mk
> @@ -11,6 +11,8 @@ JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python
>  JACK2_INSTALL_STAGING = YES
>  JACK2_PATCH = https://github.com/jackaudio/jack2/commit/ff1ed2c4524095055140370c1008a2d9cccc5645.patch
>  
> +JACK2_CONF_OPTS = --alsa
> +
>  ifeq ($(BR2_PACKAGE_OPUS),y)
>  JACK2_DEPENDENCIES += opus
>  endif
> @@ -42,34 +44,4 @@ endif
>  # gtkiostream, which we do not have, so we don't need to depend on
>  # eigen.
>  
> -define JACK2_CONFIGURE_CMDS
> -	(cd $(@D); \
> -		$(TARGET_CONFIGURE_OPTS)	\
> -		$(HOST_DIR)/usr/bin/python2 ./waf configure \
> -		--prefix=/usr			\
> -		--alsa				\
> -		$(JACK2_CONF_OPTS)		\
> -	)
> -endef
> -
> -define JACK2_BUILD_CMDS
> -	(cd $(@D); \
> -		$(TARGET_CONFIGURE_OPTS) \
> -		$(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
> -endef
> -
> -define JACK2_INSTALL_TARGET_CMDS
> -	(cd $(@D); \
> -		$(TARGET_CONFIGURE_OPTS) \
> -		$(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) \
> -		install)
> -endef
> -
> -define JACK2_INSTALL_STAGING_CMDS
> -	(cd $(@D); \
> -		$(TARGET_CONFIGURE_OPTS) \
> -		$(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(STAGING_DIR) \
> -		install)
> -endef
> -
> -$(eval $(generic-package))
> +$(eval $(waf-package))
> 

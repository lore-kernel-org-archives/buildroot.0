From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 30 Oct 2016 17:35:13 +0100
Subject: [Buildroot] [PATCH 06/10] package/gst1-imx: make it a
	waf-package
In-Reply-To: <0c135c7f96ee794320682db44e5fd881cb0d2069.1477843328.git.yann.morin.1998@free.fr>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
 <0c135c7f96ee794320682db44e5fd881cb0d2069.1477843328.git.yann.morin.1998@free.fr>
Message-ID: <ca096150-cb02-0a5b-3511-da3e1d21a519@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 30/10/2016 ? 17:02, Yann E. MORIN a ?crit :
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gary Bisson <gary.bisson@boundarydevices.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  package/gstreamer1/gst1-imx/gst1-imx.mk | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
> index 3c6b1b6..57a2ad2 100644
> --- a/package/gstreamer1/gst1-imx/gst1-imx.mk
> +++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
> @@ -14,7 +14,6 @@ GST1_IMX_INSTALL_STAGING = YES
>  
>  GST1_IMX_DEPENDENCIES += \
>  	host-pkgconf \
> -	host-python \
>  	gstreamer1 \
>  	gst1-plugins-base
>  
> @@ -53,21 +52,4 @@ endif
>  endif
>  endif
>  
> -define GST1_IMX_CONFIGURE_CMDS
> -	cd $(@D); \
> -		$(TARGET_CONFIGURE_OPTS) \
> -		$(HOST_DIR)/usr/bin/python2 ./waf configure $(GST1_IMX_CONF_OPTS)
> -endef
> -
> -define GST1_IMX_BUILD_CMDS
> -	cd $(@D); \
> -		$(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS)
> -endef
> -
> -define GST1_IMX_INSTALL_TARGET_CMDS
> -	cd $(@D); \
> -		$(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) \
> -		install
> -endef
> -
> -$(eval $(generic-package))
> +$(eval $(waf-package))
> 

From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 30 Oct 2016 17:39:34 +0100
Subject: [Buildroot] [PATCH 08/10] package/libimxvpuapi: make it a
 waf-package
In-Reply-To: <68afe0c571dbe4cf5843205b7ab15cf748075de4.1477843328.git.yann.morin.1998@free.fr>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
 <68afe0c571dbe4cf5843205b7ab15cf748075de4.1477843328.git.yann.morin.1998@free.fr>
Message-ID: <464302bc-d471-f54a-89b3-a613acace22a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 30/10/2016 ? 17:02, Yann E. MORIN a ?crit :
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gary Bisson <gary.bisson@boundarydevices.com>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  package/libimxvpuapi/libimxvpuapi.mk | 23 +----------------------
>  1 file changed, 1 insertion(+), 22 deletions(-)
> 
> diff --git a/package/libimxvpuapi/libimxvpuapi.mk b/package/libimxvpuapi/libimxvpuapi.mk
> index df84806..fde4429 100644
> --- a/package/libimxvpuapi/libimxvpuapi.mk
> +++ b/package/libimxvpuapi/libimxvpuapi.mk
> @@ -11,25 +11,4 @@ LIBIMXVPUAPI_LICENSE_FILES = LICENSE
>  LIBIMXVPUAPI_DEPENDENCIES = host-pkgconf host-python imx-vpu
>  LIBIMXVPUAPI_INSTALL_STAGING = YES
>  
> -define LIBIMXVPUAPI_CONFIGURE_CMDS
> -	cd $(@D); \
> -	$(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python2 ./waf configure \
> -		--prefix=/usr --libdir=/usr/lib
> -endef
> -
> -define LIBIMXVPUAPI_BUILD_CMDS
> -	cd $(@D); \
> -	$(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS)
> -endef
> -
> -define LIBIMXVPUAPI_INSTALL_STAGING_CMDS
> -	cd $(@D); \
> -	$(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(STAGING_DIR) install
> -endef
> -
> -define LIBIMXVPUAPI_INSTALL_TARGET_CMDS
> -	cd $(@D); \
> -	$(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) install
> -endef
> -
> -$(eval $(generic-package))
> +$(eval $(waf-package))
> 

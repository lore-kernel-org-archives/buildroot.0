From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Mar 2015 00:58:31 +0100
Subject: [Buildroot] [PATCH v3 2/2] package/openocd: depends on libftdi1
 instead of libftdi
In-Reply-To: <1426613796-4921-2-git-send-email-s.martin49@gmail.com>
References: <1426613796-4921-1-git-send-email-s.martin49@gmail.com>
 <1426613796-4921-2-git-send-email-s.martin49@gmail.com>
Message-ID: <550A1127.9070800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/03/15 18:36, Samuel Martin wrote:
> Note that, if both libftdi and libftdi1 are available, openocd will
> prefer libftdi1, so does Buildroot. ;-)
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
> ---
> changes v2->v3:
> - rebase
> - fix dependency list (ThomasP)
> - extend commit log
> 
> changes v1->v2:
> - rebase
> ---
>  package/openocd/Config.in  | 8 ++++----
>  package/openocd/openocd.mk | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/openocd/Config.in b/package/openocd/Config.in
> index 7c140c7..2db17fa 100644
> --- a/package/openocd/Config.in
> +++ b/package/openocd/Config.in
> @@ -121,7 +121,7 @@ config BR2_PACKAGE_OPENOCD_PARPORT
>  
>  config BR2_PACKAGE_OPENOCD_FT2XXX
>  	bool "FT2232 based devices (DEPRECATED)"
> -	select BR2_PACKAGE_LIBFTDI
> +	select BR2_PACKAGE_LIBFTDI1
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
>  	depends on BR2_ARCH_HAS_ATOMICS
>  	help
> @@ -135,7 +135,7 @@ config BR2_PACKAGE_OPENOCD_VPI
>  
>  config BR2_PACKAGE_OPENOCD_UBLASTER
>  	bool "Altera USB-Blaster"
> -	select BR2_PACKAGE_LIBFTDI
> +	select BR2_PACKAGE_LIBFTDI1
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
>  	depends on BR2_ARCH_HAS_ATOMICS
>  	help
> @@ -176,7 +176,7 @@ config BR2_PACKAGE_OPENOCD_GW16012
>  
>  config BR2_PACKAGE_OPENOCD_PRESTO
>  	bool "ASIX Presto Programmer"
> -	select BR2_PACKAGE_LIBFTDI
> +	select BR2_PACKAGE_LIBFTDI1
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
>  	depends on BR2_ARCH_HAS_ATOMICS
>  	help
> @@ -185,7 +185,7 @@ config BR2_PACKAGE_OPENOCD_PRESTO
>  
>  config BR2_PACKAGE_OPENOCD_OPENJTAG
>  	bool "OpenJTAG Programmer"
> -	select BR2_PACKAGE_LIBFTDI
> +	select BR2_PACKAGE_LIBFTDI1
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
>  	depends on BR2_ARCH_HAS_ATOMICS
>  	help
> diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
> index fd7e09f..3b76850 100644
> --- a/package/openocd/openocd.mk
> +++ b/package/openocd/openocd.mk
> @@ -23,7 +23,7 @@ OPENOCD_CONF_OPTS = \
>  # the dependencies they need.
>  
>  OPENOCD_DEPENDENCIES = \
> -	$(if $(BR2_PACKAGE_LIBFTDI),libftdi) \
> +	$(if $(BR2_PACKAGE_LIBFTDI1),libftdi1) \
>  	$(if $(BR2_PACKAGE_LIBUSB),libusb) \
>  	$(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
>  	$(if $(BR2_PACKAGE_LIBHID),libhid)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

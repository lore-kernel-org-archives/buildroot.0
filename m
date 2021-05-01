From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 May 2021 15:24:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/imx-uuc: bump version and
 enable for i.MX8 architecture
In-Reply-To: <20210426233954.19401-1-charles.hardin@chargepoint.com>
References: <20210426233954.19401-1-charles.hardin@chargepoint.com>
Message-ID: <12f161bb-0cc5-a745-3684-e1801cea924d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/04/2021 01:39, Charles Hardin wrote:
> From: Charles Hardin <ckhardin@gmail.com>
> 
> The imx-uuc package was only selectable on 32-bit arm targets; this
> patch allows aarch64 targets such as i.MX8 to select the package
> and use the ufb for fastboot support against the mfgtools "uuu".
> 
> Also bumping to latest upstream commit from
>     https://github.com/NXPmicro/imx-uuc
> 
> Tested on i.MX8QXP.
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/freescale-imx/imx-uuc/Config.in    | 2 +-
>  package/freescale-imx/imx-uuc/imx-uuc.hash | 2 +-
>  package/freescale-imx/imx-uuc/imx-uuc.mk   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/freescale-imx/imx-uuc/Config.in b/package/freescale-imx/imx-uuc/Config.in
> index 0e257bde17..6c3d4a6361 100644
> --- a/package/freescale-imx/imx-uuc/Config.in
> +++ b/package/freescale-imx/imx-uuc/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_IMX_UUC
>  	bool "imx-uuc"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on BR2_arm # Only relevant for i.MX
> +	depends on BR2_arm || BR2_aarch64 # Only relevant for i.MX
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # usb_functionfs_descs_head_v2
>  	select BR2_PACKAGE_HOST_DOSFSTOOLS
> diff --git a/package/freescale-imx/imx-uuc/imx-uuc.hash b/package/freescale-imx/imx-uuc/imx-uuc.hash
> index 57a5098597..5d95463903 100644
> --- a/package/freescale-imx/imx-uuc/imx-uuc.hash
> +++ b/package/freescale-imx/imx-uuc/imx-uuc.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256 2784e0826074335893fdad20e9a4faaedced2f206565c383043fbd169e9273a4  imx-uuc-fc48b497fe961d601b4bcced807f562090854ec9.tar.gz
> +sha256 7f4d4838d4bf489932ef4a242677db30ad8d9ffd76065e07f4ddee3e6c35db82  imx-uuc-d6afb27e55d73d7ad08cd2dd51c784d8ec9694dc.tar.gz
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/freescale-imx/imx-uuc/imx-uuc.mk b/package/freescale-imx/imx-uuc/imx-uuc.mk
> index 2ed910cb84..4e065c19ea 100644
> --- a/package/freescale-imx/imx-uuc/imx-uuc.mk
> +++ b/package/freescale-imx/imx-uuc/imx-uuc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IMX_UUC_VERSION = fc48b497fe961d601b4bcced807f562090854ec9
> +IMX_UUC_VERSION = d6afb27e55d73d7ad08cd2dd51c784d8ec9694dc
>  IMX_UUC_SITE = $(call github,NXPmicro,imx-uuc,$(IMX_UUC_VERSION))
>  IMX_UUC_LICENSE = GPL-2.0+
>  IMX_UUC_LICENSE_FILES = COPYING
> 

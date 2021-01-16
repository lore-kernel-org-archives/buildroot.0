From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 16 Jan 2021 16:40:28 +0100
Subject: [Buildroot] [PATCH v2 1/8] package/freescale-imx/firmware-imx:
 bump version to 8.10
In-Reply-To: <20210105152420.26379-2-stephane.viau@oss.nxp.com>
References: <20210105152420.26379-1-stephane.viau@oss.nxp.com>
 <20210105152420.26379-2-stephane.viau@oss.nxp.com>
Message-ID: <0f9e83af-c4fb-50f2-feeb-9768a97aa94d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephane,

Le 05/01/2021 ? 16:24, Stephane Viau a ?crit?:
> - Same version as NXP release 5.4.70-2.3.0
> - EULA/COPYING: update to LA_OPT_NXP_Software_License v17
> 
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Still not related to this version bump but the sdma firmwares for imx[6,7,8] are
provided by two packages: firmware-imx and linux-firmware

$ sha256sum ./firmware-imx-8.10/firmware/sdma/sdma-imx6q.bin
7790c161b7e013a9dbcbffb17cc5d4cb63d952949a505647e4679f02d04c4784
./firmware-imx-8.10/firmware/sdma/sdma-imx6q.bin

$ sha256sum  ./linux-firmware-20201022/imx/sdma/sdma-imx6q.bin
7790c161b7e013a9dbcbffb17cc5d4cb63d952949a505647e4679f02d04c4784
./linux-firmware-20201022/imx/sdma/sdma-imx6q.bin

We have two options: BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME and
BR2_PACKAGE_LINUX_FIRMWARE_IMX_SDMA

The only difference is that firmware-imx provide firmware for old imx cpus.

$ ls linux-firmware-20201022/imx/sdma/sdma-imx
sdma-imx6q.bin  sdma-imx7d.bin

$ ls firmware-imx-8.10/firmware/sdma/sdma-imx
sdma-imx25-to1.bin  sdma-imx31-to1.bin  sdma-imx31-to2.bin  sdma-imx35-to1.bin
sdma-imx35-to2.bin  sdma-imx51-to3.bin  sdma-imx53-to1.bin  sdma-imx6q.bin
sdma-imx7d.bin

Maybe we can keep one of firmware provider.

Best regards,
Romain


> ---
> v2:
> - Add "EULA/COPYING: update to LA_OPT_NXP_Software_License v17" in
>   commit log (Gary)
> ---
>  package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
>  package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
> index 3230677d49..0a717d40f5 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.hash
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  a72f70fd2ecaa58800bb88ed672fddc322ab9843ee7777eb89b82016b0aa3614  firmware-imx-8.9.bin
> -sha256  a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc  EULA
> -sha256  69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2  COPYING
> +sha256  2b70f169d4065b2a7ac7a676afe24636128bd2dacc9f5230346758c3b146b2be  firmware-imx-8.10.bin
> +sha256  72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
> +sha256  9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index 7d1f42f1d8..b33ffb7ee8 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FIRMWARE_IMX_VERSION = 8.9
> +FIRMWARE_IMX_VERSION = 8.10
>  FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
>  FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
>  
> 

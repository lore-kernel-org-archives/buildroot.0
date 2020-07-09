From: Maeva Manuel (OSS) <maeva.manuel@oss.nxp.com>
Date: Thu, 9 Jul 2020 06:54:12 +0000
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-seco: bump
 version to 3.6.3
In-Reply-To: <20200708121459.GA331830@p1g2>
References: <20200708074353.8169-1-maeva.manuel@oss.nxp.com>
 <20200708121459.GA331830@p1g2>
Message-ID: <VI1PR04MB4976F0AF13CBBEC145861FE09D640@VI1PR04MB4976.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gary,

License was updated from:
LA_OPT_NXP_Software_License v10 December 2019
to:
LA_OPT_NXP_Software_License v11 February 2020
which explain the change of EULA/COPYING license files.

This LA_OPT_NXP_Software_License is used by a wide range proprietary
binaries/firmwares, from NXP and also 3rd parties (e.g. DDR firmwares,
VPU firmwares, ...). It is periodically updated with the introduction
of new products. It's recommended to review it in detail with, if a
system uses it in production.

Regarding the C0 revision of i.MX8QXP:

1) The QXP C0 chip exists publicly, it's on the latest revisions of EVK boards.
2) The imx-seco 3.6.3 package (just like the rest of the BSP 5.4.24_2.1.0) adds support for this chip.
3) In order not to break the compatibility with the BR imx-seco 2.3.1 package, it remains with B0 support.
4) I think it's not a good idea that it's the final script that chooses the right file, because the names often change. This could mean that the script would have to be updated every time the package is updated too. By being in the recipe it collects all the changes in the recipe.
5) C0 support should introduce a Kconfig, and this will be done in a future patch.

Regards,

Maeva 

-----Original Message-----
From: Gary Bisson <gary.bisson@boundarydevices.com> 
Sent: Wednesday, July 8, 2020 2:15 PM
To: Maeva Manuel (OSS) <maeva.manuel@oss.nxp.com>
Cc: buildroot at buildroot.org; Gary Bisson <bisson.gary@gmail.com>; Refik Tuzakli <tuzakli.refik@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-seco: bump version to 3.6.3

Hi Maeva,

Thank you for your contribution, please see my comments below.

On Wed, Jul 08, 2020 at 09:43:52AM +0200, Maeva Manuel wrote:
> This version is aligned with 5.4.24_2.1.0 NXP Linux BSP.
> Firmware file names now include the SoC revision.
> 
> Tested-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
> [Maeva: tested on i.MX8QXP MEK (Board rev D1, SoC rev B0) and on 
> i.MX8QM MEK (SoC rev B0)]
> Signed-off-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
> ---
>  package/freescale-imx/imx-seco/imx-seco.hash | 6 +++---
>  package/freescale-imx/imx-seco/imx-seco.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/freescale-imx/imx-seco/imx-seco.hash 
> b/package/freescale-imx/imx-seco/imx-seco.hash
> index 56f56369d4..930801e839 100644
> --- a/package/freescale-imx/imx-seco/imx-seco.hash
> +++ b/package/freescale-imx/imx-seco/imx-seco.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  
> b429ac58b2ea1771b3fdf7ae87bf1d37ccaf596bde01a5ecccae27b2145f6824  
> imx-seco-2.3.1.bin
> -sha256  
> 69d19847bac9af7f9e832170a15138f5ef144d8064413434114d75a68982cc9c  EULA
> -sha256  
> 6467f2e81d06b19fe541de49bdba32a9a205e8d1c230220fe24247b48672cb46  
> COPYING
> +sha256  
> +52ba07633e0f8707d8c26724b5cd03ef96444c8de1e0e134acac50acacf3e7dd  
> +imx-seco-3.6.3.bin
> +sha256  
> +7ffad92e72e5f6b23027e7cf93a770a4acef00a92dcf79f22701ed401c5478c0  
> +EULA
> +sha256  
> +2ceab29de5ea533b86f570bcc4e9ddbfb5fe85a1da4978a8613ff3fd9bed781d  
> +COPYING

Usually when EULA/COPYING is updated it means there are new terms, can you drop a line on this in your commit log?

> diff --git a/package/freescale-imx/imx-seco/imx-seco.mk 
> b/package/freescale-imx/imx-seco/imx-seco.mk
> index d06bf4c5cc..be3f3c4419 100644
> --- a/package/freescale-imx/imx-seco/imx-seco.mk
> +++ b/package/freescale-imx/imx-seco/imx-seco.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ######################################################################
> ##########
>  
> -IMX_SECO_VERSION = 2.3.1
> +IMX_SECO_VERSION = 3.6.3
>  IMX_SECO_SITE = $(FREESCALE_IMX_SITE)  IMX_SECO_SOURCE = 
> imx-seco-$(IMX_SECO_VERSION).bin
>  
> @@ -22,12 +22,12 @@ IMX_SECO_INSTALL_IMAGES = YES  # is done in 
> post-image script.
>  ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
>  define IMX_SECO_INSTALL_IMAGES_CMDS
> -	cp $(@D)/firmware/seco/mx8qx-ahab-container.img \
> +	cp $(@D)/firmware/seco/mx8qxb0-ahab-container.img \
>  		$(BINARIES_DIR)/ahab-container.img

What about C0 firmware? Are C0 CPU already available? If so, maybe there should be a way to select which version we want to use.
Or another approach would be to copy them all without renaming and have the final script pick the right one depending on some configuration.

Let me know your thoughts.

Regards,
Gary

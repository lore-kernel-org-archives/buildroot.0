From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Thu, 6 Feb 2020 12:50:24 +0300
Subject: [Buildroot] [PATCH v4 8/9] package/nxp/qoriq-rcw: introduce
 BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE for boot mode
In-Reply-To: <20200205105227.13698-8-jerry.huang@nxp.com>
References: <20200205105227.13698-1-jerry.huang@nxp.com>
 <20200205105227.13698-8-jerry.huang@nxp.com>
Message-ID: <20200206095024.ajgwlhvl6j5opsds@bars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Introduce BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE for the boot mode.
> Because the RCW binary can be stored in different media, for example:
> sd - RCW locate in SD card, boot the board from SD card
> emmc - RCW locate in eMMC chip, boot the board from eMMC chip
> qspi - RCW locate in QSPI flash, boot the board from QSPI flash
> flexspi_nor - RCW locate in flexSPI, boot the board from flexSPI Nor/Nand flash
> 
> Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> ---
> changes since v3:
> 1. split this option from board patch.
> ---
>  package/nxp/qoriq-rcw/Config.in.host | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/nxp/qoriq-rcw/Config.in.host b/package/nxp/qoriq-rcw/Config.in.host
> index 9bf55894e8..7f5fbb3202 100644
> --- a/package/nxp/qoriq-rcw/Config.in.host
> +++ b/package/nxp/qoriq-rcw/Config.in.host
> @@ -37,4 +37,10 @@ config BR2_PACKAGE_HOST_QORIQ_RCW_BIN
>  
>  	  If this option is empty, no rcw file is used.
>  
> +config BR2_PACKAGE_HOST_QORIQ_RCW_BOOT_MODE
> +	string "QorIQ RCW Boot mode"
> +	depends on !BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH
> +	help
> +	  Specify the boot mode, for example, sd, emmc, flexspi_nor.
> +
>  endif

Does it make sense to add any default value for this option ?

Regards,
Sergey

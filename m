From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 22:58:31 +0200
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx: Add option for
 all i.MX FW needs
In-Reply-To: <1593012228-18959-2-git-send-email-stephane.viau@oss.nxp.com>
References: <1593012228-18959-1-git-send-email-stephane.viau@oss.nxp.com>
 <1593012228-18959-2-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <20200624225831.2183d1b0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for doing this work! It's definitely bringing some good sanity
into this firmware-imx mess! See below some comments.

On Wed, 24 Jun 2020 17:23:47 +0200
Stephane Viau <stephane.viau@oss.nxp.com> wrote:

> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 0be37ce..2cac650 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -12,40 +12,63 @@ choice
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX25_3STACK
>  	bool "imx25-3stack"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
>  	bool "imx27ads"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX37_3STACK
>  	bool "imx37-3stack"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX50
>  	bool "imx50"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
>  	bool "imx51"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
>  	bool "imx53"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
>  	bool "imx6q/imx6dl"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_EPDC_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
>  	bool "imx6sl/imx6sx"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_EPDC_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
>  	bool "imx6ul/imx6ull"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
>  	bool "imx7d/imx7ulp"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
>  	bool "imx8"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_IMX8_IMX8X
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
>  	bool "imx8m"
>  	select BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_HDMI_FW
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
>  	bool "imx8mm"
> @@ -57,6 +80,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
>  	bool "imx8x"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_IMX8_IMX8X
>  endchoice
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
> @@ -102,6 +126,21 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
>  config BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
>  	bool
>  
> +config BR2_PACKAGE_FREESCALE_IMX_NEED_EPDC_FW
> +	bool
> +
> +config BR2_PACKAGE_FREESCALE_IMX_NEED_HDMI_FW
> +	bool
> +
> +config BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	bool
> +
> +config BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
> +	bool
> +
> +config BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_IMX8_IMX8X
> +	bool

It would be nicer to use "NEEDS" instead of "NEED". That would require
a preparation patch that renames BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
to BR2_PACKAGE_FREESCALE_IMX_NEEDS_DDR_FW.

However, I am wondering if package/freescale-imx/Config.in is the right
place for all this logic. After all, this is only related to the
firmware-imx package.

Shouldn't we instead move that to
package/freescale-imx/firmware-imx/Config.in, with the following form:

config BR2_PACKAGE_FREESCALE_IMX_NEEDS_DDR_FW
	bool
	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN

and ditto the other options ? Here as well, it would require a
preparation patch to take care of the NEEDS_DDR_FW case, and then your
patch that handles all other FW files.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

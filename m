From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 23 Feb 2018 11:40:58 +0100
Subject: [Buildroot] [PATCH v2 2/3] firmware-imx: add support for iMX8M
 firmware
In-Reply-To: <1519293778-5185-3-git-send-email-karl.erik.larsson@gmail.com>
References: <1519293778-5185-1-git-send-email-karl.erik.larsson@gmail.com>
 <1519293778-5185-3-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <20180223104058.GA6998@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erik,

On Thu, Feb 22, 2018 at 11:02:57AM +0100, Erik Larsson wrote:
> Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
> ---
>  package/freescale-imx/Config.in                    | 4 +++-
>  package/freescale-imx/firmware-imx/Config.in       | 2 +-
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 8 ++++++++
>  3 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index b5e5ab2..b5df642 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -1,6 +1,6 @@
>  menuconfig BR2_PACKAGE_FREESCALE_IMX
>  	bool "Freescale i.MX libraries"
> -	depends on BR2_arm
> +	depends on BR2_arm || BR2_aarch64
>  	help
>  	  Those packages provide hardware acceleration for GPU or VPU,
>  	  hardware optimization or some hardware tools for Freescale
> @@ -40,6 +40,8 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
>  	bool "imx7d/imx7ulp"
>  
> +config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
> +	bool "imx8m"
>  endchoice
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM

I actually this should be a separate patch that just adds i.MX8M to the
list of supported devices.

Also it is missing BR2_PACKAGE_FREESCALE_IMX_PLATFORM assignment to
"IMX8" in order to match Yocto platform naming.

Finally, as an optional step we could hide packages that don't apply to
that architecture such as imx-lib, but that can come later.

Regards,
Gary

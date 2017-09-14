From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 14 Sep 2017 07:39:00 +0200
Subject: [Buildroot] [PATCH 1/1 v2] package/freescale-imx: add support
 for i.MX6UL
In-Reply-To: <1504789206-23147-1-git-send-email-julien.boibessot@free.fr>
References: <1504789206-23147-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <1505367540.9315.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2017-09-07 at 15:00 +0200, julien.boibessot at free.fr wrote:
> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> 
> Mostly to compile imx-lib (providing libpxp) on i.MX6UL (which have a PXP 
> hardware unit) and to prevent compilation of imx-lib's modules not supported
> on i.MX6UL.
> 
> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> ---
> Changes v1 -> v2:
>   - add more commit comments (as suggested by Baruch)
> 
>  package/freescale-imx/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 656b44b..fa3f9a0 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -31,6 +31,9 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
>  	bool "imx6q"
>  
> +config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
> +	bool "imx6ul"
> +
>  endchoice
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
> @@ -42,6 +45,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
>  	default "IMX51" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
>  	default "IMX53" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
>  	default "IMX6Q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
> +	default "IMX6UL" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
>  
>  config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
>  	bool

Acked-by: J?rg Krause <joerg.krause@embedded.rocks>

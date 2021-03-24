From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 24 Mar 2021 15:57:47 +0100
Subject: [Buildroot] [PATCH v2 1/5] package/freescale-imx: add option
 for i.MX8M Plus
In-Reply-To: <20210322091252.11392-2-stephane.viau@oss.nxp.com>
References: <20210322091252.11392-1-stephane.viau@oss.nxp.com>
 <20210322091252.11392-2-stephane.viau@oss.nxp.com>
Message-ID: <YFtTa+wRGP+0TLTg@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephane,

On Mon, Mar 22, 2021 at 10:12:48AM +0100, Stephane Viau wrote:
> The i.MX Plus focuses on machine learning and vision and industrial
          ^
	  8M

> automation. It also provides advanced multimedia, including a VPU and
> the GC7000UL GPU.
              ^
	      + GC520L (2D)

> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> ---
>  package/freescale-imx/Config.in | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index b0c7de8436..bedd05a471 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -52,6 +52,9 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
>  	bool "imx8mn"
>  
> +config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
> +	bool "imx8mp"
> +
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
>  	bool "imx8x"
>  endchoice
> @@ -72,6 +75,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
>  	default "IMX8MQ" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
>  	default "IMX8MM" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
>  	default "IMX8MN" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
> +	default "IMX8MP" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
>  
>  config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
>  	bool
> @@ -83,7 +87,8 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
>  config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
>  	bool
>  	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
> -		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
>  
>  config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
>  	bool
> @@ -94,6 +99,7 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
>  		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
>  		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
>  		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP || \
>  		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X

Note that I've received a complaint from NXP some time back because the
CPU name wasn't spelled correctly, I was told: "there should always be a
space between 'i.MX' and the series number like '8M'".
So the title should be "i.MX 8M Plus" ;-)

With those minor changes:
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary

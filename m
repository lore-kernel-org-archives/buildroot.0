From: Gary Bisson <bisson.gary@gmail.com>
Date: Fri, 8 Nov 2019 18:30:26 +0100
Subject: [Buildroot] [PATCH 2/7] package/freescale-imx: add option for
 i.MX8QM
In-Reply-To: <20190909121525.13935-2-maeva.manuel@nxp.com>
References: <20190909121525.13935-1-maeva.manuel@nxp.com>
 <20190909121525.13935-2-maeva.manuel@nxp.com>
Message-ID: <20191108173026.GB9828@g751>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maeva,

Sorry for the (very) late reply.

On Mon, Sep 09, 2019 at 12:14:58PM +0000, Maeva Manuel wrote:
> Signed-off-by: Maeva Manuel <maeva.manuel@nxp.com>
> ---
>  package/freescale-imx/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index f010aab87b..5672e09b05 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -40,6 +40,9 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
>  	bool "imx7d/imx7ulp"
>  
> +config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
> +	bool "imx8"
> +
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
>  	bool "imx8m"

This isn't sufficient, you also need to make sure to add
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 in the
BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU definition as I'm sure it has a
Vivante GPU ;)

Looking at Config.in, seems that MX8MM has the same issue.

Regards,
Gary

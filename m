From: Gary Bisson <bisson.gary@gmail.com>
Date: Tue, 07 Oct 2014 09:42:19 -0700
Subject: [Buildroot] [02/11] freescale-imx: bump to version 3.10.17-1.0.1
In-Reply-To: <1412340212-3089-3-git-send-email-jezz@sysmic.org>
References: <1412340212-3089-3-git-send-email-jezz@sysmic.org>
Message-ID: <543417EB.4080301@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerome,

On 10/03/2014 05:43 AM, J?r?me Pouiller wrote:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>   package/freescale-imx/freescale-imx.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
> index 64ea1f9..58dc9f0 100644
> --- a/package/freescale-imx/freescale-imx.mk
> +++ b/package/freescale-imx/freescale-imx.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -FREESCALE_IMX_VERSION = 3.10.17-1.0.0
> +FREESCALE_IMX_VERSION = 3.10.17-1.0.1
This FREESCALE_IMX_VERSION variable is used by other packages which do 
not have a 1.0.1 update such as imx-lib, imx-vpu or firmware-imx. 
Therefore this patch would break them.
I suggest modifying only the gpu-viv package version but this implies to 
also modifying all the i.MX6 configs to update their kernels as it has 
been done in Yocto:
https://lists.yoctoproject.org/pipermail/meta-freescale/2014-August/009906.html

Let me know if you need help updating all the configurations 
(nitrogen6x, sabresd, wandboard etc...).

Thanks,
Gary
>   FREESCALE_IMX_SITE    = http://www.freescale.com/lgfiles/NMG/MAD/YOCTO
>   
>   include $(sort $(wildcard package/freescale-imx/*/*.mk))
>
>

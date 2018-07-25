From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 25 Jul 2018 19:26:58 +0300
Subject: [Buildroot] [PATCH 2/8] imx-vpu: rename package to imx-vpu-cnm
In-Reply-To: <20180725150149.30774-3-gary.bisson@boundarydevices.com>
References: <20180725150149.30774-1-gary.bisson@boundarydevices.com>
 <20180725150149.30774-3-gary.bisson@boundarydevices.com>
Message-ID: <20180725162658.w46nlncptoxgukrj@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Wed, Jul 25, 2018 at 05:01:43PM +0200, Gary Bisson wrote:
> So far the i.MX processors have been using a Chips&Media CODA VPU.
> But the latest generation of processors (starting with i.MX8MQ) uses
> VPU cores from Hantro which is provided as imx-vpu-hantro package.
> 
> NXP chose in Yocto to keep the imx-vpu naming for Chips&Media package
> and created a virtual "imxvpu" package that can either be provided by
> imx-vpu or imx-vpu-hantro.
> 
> Since this naming can be confusing (IMO), renaming the imx-vpu package
> to imx-vpu-cnm and then create a virtual imx-vpu one should be clearer.

What about Config.in.legacy?

[..]

> -config BR2_PACKAGE_IMX_VPU
> -	bool "imx-vpu"
> +config BR2_PACKAGE_IMX_VPU_CNM
> +	bool "imx-vpu-cnm"
>  	depends on BR2_arm # Only relevant for i.MX
>  	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
>  	select BR2_PACKAGE_FIRMWARE_IMX
>  	help
>  	  Library of userspace helpers specific for the Freescale i.MX
> -	  platform. It wraps the kernel interfaces for the i.MX platform
> -	  Video Processing Unit (VPU) driver. It requires a kernel that
> -	  includes the i.MX specific headers to be built.
> +	  platform integrating a Chips&Media CODA Video Processing Unit
> +	  (VPU). It requires a kernel that includes the i.MX specific
> +	  headers to be built.

I think it is worth mentioning here which i.MX variants have this VPU. 
Otherwise the user has no easy way to know which package supports a specific 
SoC.

>  	  This library is provided by Freescale as-is and doesn't have
>  	  an upstream.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

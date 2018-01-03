From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Jan 2018 21:52:31 +0100
Subject: [Buildroot] [PATCH 07/16] gst1-imx: update g2d libraries
 dependencies
In-Reply-To: <20180103183842.10182-8-gary.bisson@boundarydevices.com>
References: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
 <20180103183842.10182-8-gary.bisson@boundarydevices.com>
Message-ID: <20180103215231.618476ed@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 Jan 2018 19:38:33 +0100, Gary Bisson wrote:
> To match the new imx-gpu-g2d package.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/gstreamer1/gst1-imx/Config.in   | 6 +++---
>  package/gstreamer1/gst1-imx/gst1-imx.mk | 4 ++++
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
> index e4cee05b90..7b46233b53 100644
> --- a/package/gstreamer1/gst1-imx/Config.in
> +++ b/package/gstreamer1/gst1-imx/Config.in
> @@ -27,12 +27,12 @@ comment "imxeglvivsink needs the Vivante 3D libraries"
>  
>  config BR2_PACKAGE_GST1_IMX_G2D
>  	bool "imxg2d"
> -	depends on BR2_PACKAGE_IMX_GPU_VIV_G2D
> +	depends on BR2_PACKAGE_IMX_GPU_G2D

Doing this now is bogus... because you've removed the option
BR2_PACKAGE_IMX_GPU_VIV_G2D since PATCH 03/16. You need a different
ordering, otherwise you break bisectability.

Perhaps you need to introduce the imx-gpu-g2d package first, then bump
imx-gpu-viv and adjust the packages using imx-gpu-d2d at the same time.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 09:45:27 +0200
Subject: [Buildroot] [PATCH 1/5] board/freescale/common/imx: make
 imx8-bootloader-prepare more generic
In-Reply-To: <20180719073253.22433-2-gary.bisson@boundarydevices.com>
References: <20180719073253.22433-1-gary.bisson@boundarydevices.com>
 <20180719073253.22433-2-gary.bisson@boundarydevices.com>
Message-ID: <20180719094527.6275cd12@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jul 2018 09:32:49 +0200, Gary Bisson wrote:
> Allow user to override the hardcoded dtb name by using
> BR2_ROOTFS_POST_SCRIPT_ARGS.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  .../freescale/common/imx/imx8-bootloader-prepare.sh  | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
> index 2648147ab0..ce2c3405a0 100755
> --- a/board/freescale/common/imx/imx8-bootloader-prepare.sh
> +++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
> @@ -2,9 +2,17 @@
>  
>  main ()
>  {
> -	# Currently we support imx8mqevk.
> +	if [ $# -le 1 ]; then
> +		UBOOT_DTB=${BINARIES_DIR}/fsl-imx8mq-evk.dtb

I don't think it's worth keeping some kind of "backward compatibility"
here. Just change configs/freescale_imx8mqevk_defconfig to pass the DTB
name as argument.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

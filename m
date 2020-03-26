From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 21:57:14 +0100
Subject: [Buildroot] [PATCH 3/3] configs/nitrogen8mm: Add new defconfig
In-Reply-To: <20200326144436.529906-4-gary.bisson@boundarydevices.com>
References: <20200326144436.529906-1-gary.bisson@boundarydevices.com>
 <20200326144436.529906-4-gary.bisson@boundarydevices.com>
Message-ID: <20200326215714.3a5fa6dc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gary,

I was about to apply, but there are a few things that could be
improved. See below.

On Thu, 26 Mar 2020 15:44:36 +0100
Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> NXP i.MX8MMini based SBC with 2GB of LPDDR4 and 8GB eMMC.
> 
> More details on the platform here:
> https://boundarydevices.com/product/nitrogen8m-mini
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  configs/nitrogen8mm_defconfig | 56 +++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 configs/nitrogen8mm_defconfig

Could you update board/boundary/common/readme.txt to also list this
platform as being supported, and any other note that might be relevant ?

> +BR2_TARGET_GENERIC_GETTY=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/boundarydevices/common/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"

Could you drop this script and use support/scripts/genimage.sh ?
Indeed, it does the same thing, and in fact support/scripts/genimage.sh
got fixed to use an empty rootpath and avoid a useless extra copy
(commit 31d1fb27b0e62a6542112a7476ff188f2f7b8d38).

It would be good to do that in a preparation commit for all existing
Boundary Devices boards.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

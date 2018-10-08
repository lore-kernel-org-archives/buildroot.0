From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 16:27:42 +0200
Subject: [Buildroot] [PATCH 1/1] configs: bananapi_m1: bump kernel and
 uboot version
In-Reply-To: <20181008125118.31837-1-lothar.felten@gmail.com>
References: <20181008125118.31837-1-lothar.felten@gmail.com>
Message-ID: <20181008162742.1cfa6a33@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this update!

On Mon,  8 Oct 2018 14:51:18 +0200, Lothar Felten wrote:

> -# Linux headers same as kernel, a 4.13 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y

You should not remove this opion.

> -
> -# Bootloader
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M1"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m1/genimage.cfg"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"

You should select a specific version of the kernel.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 21:48:14 +0200
Subject: [Buildroot] [PATCH] configs/rock_pi_n8: new defconfig
In-Reply-To: <1594097887-25563-1-git-send-email-sunil@amarulasolutions.com>
References: <1594097887-25563-1-git-send-email-sunil@amarulasolutions.com>
Message-ID: <20200714214814.53fe99a0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Jul 2020 10:28:07 +0530
Suniel Mahesh <sunil@amarulasolutions.com> wrote:


> diff --git a/configs/rock_pi_n8_defconfig b/configs/rock_pi_n8_defconfig
> new file mode 100644
> index 0000000..291fa18
> --- /dev/null
> +++ b/configs/rock_pi_n8_defconfig
> @@ -0,0 +1,49 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a17=y
> +BR2_ARM_FPU_NEON_VFPV4=y
> +
> +# Linux headers same as kernel, a 5.4 series

5.7 series

> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/amarula/u-boot-amarula.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rock-pi"

This is a branch, we need a tag, or commit. Or better, an upstream
version.

> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/amarula/linux-amarula.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rockpi"

Ditto: this is a branch, we need a tag or commit. Or better, an
upstream version.

> +BR2_LINUX_KERNEL_USE_DEFCONFIG=y
> +BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
> +BR2_LINUX_KERNEL_UIMAGE=y
> +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"

Why a uImage, with a modern U-Boot ? This doesn't make sense.

> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-rock-pi-n8"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y

This is useless since the kernel image is in a separate FAT filesystem.

> +
> +# Filesystem
> +BR2_TARGET_GENERIC_HOSTNAME="rockpi-n8"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to ROCKPI-N8..!!"

Drop the "..!!" at the end of this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

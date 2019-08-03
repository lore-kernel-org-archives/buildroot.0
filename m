From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 16:41:02 +0200
Subject: [Buildroot] [PATCH V2] board: Add Oceanic 5205 5inMFD board
 support
In-Reply-To: <20190419093448.30685-1-shyam.saini@amarulasolutions.com>
References: <20190419093448.30685-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190803164102.5de262b3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Sorry for the very long delay in reviewing this patch.

First, the commit title should be:

	configs/oceanic_5205_5inmfd: new defconfig

On Fri, 19 Apr 2019 15:04:48 +0530
Shyam Saini <shyam.saini@amarulasolutions.com> wrote:


> diff --git a/configs/oceanic_5205_5inmfd_defconfig b/configs/oceanic_5205_5inmfd_defconfig
> new file mode 100644
> index 0000000000..cd43677862
> --- /dev/null
> +++ b/configs/oceanic_5205_5inmfd_defconfig
> @@ -0,0 +1,50 @@
> +BR2_aarch64=y
> +BR2_cortex_a53=y
> +BR2_ARM_FPU_VFPV4=y
> +
> +# Linux headers same as kernel, a 5.0 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
> +
> +# Firmware
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y

This ATF repo is marked as obsolete, and Andre recommends using
mainline ATF. Could you use that instead ?

> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="1692c73ccb39fb790d7ba1a43ca2f14a0f9f1f32"

I'm sure it's now in a U-Boot release. Could you use it ?

> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/amarula/linux-amarula"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="504a49ae70efd2ef936f6850dcdd71a250c4cb54"
> +BR2_LINUX_KERNEL_VERSION="504a49ae70efd2ef936f6850dcdd71a250c4cb54"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-oceanic-5205-5inmfd"

The support for this board is now in upstream Linux, could you use the
upstream Linux kernel instead ?

Could you repost after adjusting those various aspects ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

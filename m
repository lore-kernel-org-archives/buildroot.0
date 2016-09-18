From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 20:07:52 +0200
Subject: [Buildroot] [PATCH 05/11] Update and improve default
 configuration files for Arietta G25 (both 128MB and 256MB version)
In-Reply-To: <1470827167-9426-7-git-send-email-biagio.hkr@gmail.com>
References: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
 <1470827167-9426-7-git-send-email-biagio.hkr@gmail.com>
Message-ID: <20160918200752.049eee80@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Aug 2016 13:06:01 +0200, Biagio Montaruli wrote:

> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

Please remove these and keep the default of uClibc and no C++ enabled.

>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
> -BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.16"
> +BR2_LINUX_KERNEL_PATCH="board/acmesystems/arietta-g25/patches/linux/linux-4.4.16-arietta.patch"

We prefer to use BR2_GLOBAL_PATCH_DIR nowadays in defconfigs.

> +BR2_LINUX_KERNEL_DEFCONFIG="acme-arietta"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
> -BR2_LINUX_KERNEL_XZ=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="acme-arietta"
> +
> +# Root filesystem configuration
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
>  
> -# Bootloader
> +# AT91bootstrap bootloader
>  BR2_TARGET_AT91BOOTSTRAP3=y
>  BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/tanzilli/at91bootstrap.git"
> -BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="cedbde4b36695b715f469f4872f47e5cc8115000"
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/biagiom/at91bootstrap.git"
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="acmesystems-v1.0"

Are you the new maintainer of AT91Bootstrap3 for those boards?

> -# BR2_TARGET_ROOTFS_TAR is not set

You want to keep this line somewhere, to not have a .tar file created
for the root filesystem.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

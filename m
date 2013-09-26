From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Sep 2013 21:42:55 +0200
Subject: [Buildroot] [PATCH] beagleboneblack: add board
In-Reply-To: <1380220826-17732-1-git-send-email-jkridner@beagleboard.org>
 (Jason Kridner's message of "Thu, 26 Sep 2013 18:40:26 +0000")
References: <1380220826-17732-1-git-send-email-jkridner@beagleboard.org>
Message-ID: <87bo3f5pz4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jason" == Jason Kridner <jkridner@beagleboard.org> writes:

Hi Jason,

 Jason> From: Jason Kridner <jdk@ti.com>
 Jason> Signed-off-by: Jason Kridner <jdk@ti.com>
 Jason> ---
 Jason>  board/beagleboneblack/linux-3.8.config | 4305 ++++++++++++++++++++++++++++++++
 Jason>  configs/beagleboneblack_defconfig      |   38 +
 Jason>  2 files changed, 4343 insertions(+)
 Jason>  create mode 100644 board/beagleboneblack/linux-3.8.config
 Jason>  create mode 100644 configs/beagleboneblack_defconfig

 Jason> diff --git a/board/beagleboneblack/linux-3.8.config b/board/beagleboneblack/linux-3.8.config
 Jason> new file mode 100644
 Jason> index 0000000..e6cf0a2
 Jason> --- /dev/null
 Jason> +++ b/board/beagleboneblack/linux-3.8.config
 Jason> @@ -0,0 +1,4305 @@
 Jason> +#
 Jason> +# Automatically generated file; DO NOT EDIT.
 Jason> +# Linux/arm 3.8.13 Kernel Configuration

Please run make ARCH=arm savedefconfig in the kernel source directory to
make a minimal config instead.

 Jason> +++ b/configs/beagleboneblack_defconfig
 Jason> @@ -0,0 +1,38 @@
 Jason> +# architecture
 Jason> +BR2_arm=y
 Jason> +BR2_cortex_a8=y
 Jason> +BR2_ARM_EABIHF=y
 Jason> +
 Jason> +# system
 Jason> +BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
 Jason> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y

DEVTMPFS is default now, so this can be dropped.

 Jason> +BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
 Jason> +# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
 Jason> +
 Jason> +# filesystem
 Jason> +BR2_PACKAGE_AM33X_CM3=y
 Jason> +BR2_TARGET_ROOTFS_EXT2=y
 Jason> +# BR2_TARGET_ROOTFS_TAR is not set
 Jason> +
 Jason> +# lock down headers to avoid breaking with new defaults
 Jason> +BR2_KERNEL_HEADERS_VERSION=y
 Jason> +BR2_DEFAULT_KERNEL_VERSION="3.8.13"
 Jason> +
 Jason> +# bootloader
 Jason> +BR2_TARGET_UBOOT=y
 Jason> +BR2_TARGET_UBOOT_BOARDNAME="am335x_evm"
 Jason> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 Jason> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.04"

Any specific reason to not use 2013.07 instead?

 Jason> +BR2_TARGET_UBOOT_FORMAT_IMG=y
 Jason> +BR2_TARGET_UBOOT_SPL=y
 Jason> +BR2_TARGET_UBOOT_SPL_NAME="MLO"
 Jason> +
 Jason> +# kernel
 Jason> +BR2_LINUX_KERNEL=y
 Jason> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
 Jason> +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/beagleboard/linux.git"
 Jason> +BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="ddd36e546e53d3c493075bbebd6188ee843208f9"
 Jason> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 Jason> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/beagleboneblack/linux-3.8.config"
 Jason> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
 Jason> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-boneblack"

Would there be any issues with bumping the kernel version to this for
the original (white) beaglebone as well?

-- 
Bye, Peter Korsgaard

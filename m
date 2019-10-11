From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Oct 2019 22:21:51 +0200
Subject: [Buildroot] [PATCH v2] configs/licheepi_zero: move to mainline
In-Reply-To: <1570801251-25376-1-git-send-email-angelo@amarulasolutions.com>
References: <1570801251-25376-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <e28e9bc6-6515-75f6-607c-e280d1b61002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/10/2019 15:40, Angelo Compagnucci wrote:
> Mainline kernel and u-boot both supports this board in mainline
> from quite some time.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  configs/licheepi_zero_defconfig | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/configs/licheepi_zero_defconfig b/configs/licheepi_zero_defconfig
> index 826e98c..8bb2129 100644
> --- a/configs/licheepi_zero_defconfig
> +++ b/configs/licheepi_zero_defconfig
> @@ -4,7 +4,7 @@ BR2_cortex_a7=y
>  BR2_ARM_FPU_VFPV4=y
>  
>  # Toolchain
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
>  
>  # System configuration
>  BR2_TARGET_GENERIC_HOSTNAME="licheepi-zero"
> @@ -15,12 +15,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/licheepi/genimage.cfg"
>  
>  # Kernel
> -# Custom 4.14.14 kernel based on stable linux.4.14.y from Lichee-Pi Github repository
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Lichee-Pi/linux"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="cda44c146b9b87290bc7c636ffa7d88cbfb03ace"
> -BR2_LINUX_KERNEL_DEFCONFIG="licheepi_zero"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.5"
> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-v3s-licheepi-zero sun8i-v3s-licheepi-zero-dock"
>  
> @@ -37,9 +35,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  # Bootloaders
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> -BR2_TARGET_UBOOT_CUSTOM_GIT=y
> -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Lichee-Pi/u-boot"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="32ab1804cd7c5858be8009e35ca07502dc8765c7"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="LicheePi_Zero"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> 

From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 9 Nov 2016 09:36:38 +0200
Subject: [Buildroot] [PATCH 1/4] configs: atmel: at91sam9260eknf: update
 defconfig
In-Reply-To: <20161109065948.1851-2-ludovic.desroches@atmel.com>
References: <20161109065948.1851-1-ludovic.desroches@atmel.com>
 <20161109065948.1851-2-ludovic.desroches@atmel.com>
Message-ID: <20161109073638.ozgbr5vy6gglznlx@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ludovic,

On Wed, Nov 09, 2016 at 07:59:45AM +0100, Ludovic Desroches wrote:
> Bump to a recent version of AT91bootstrap and use mainline version of
> U-Boot and Linux.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---
>  configs/at91sam9260eknf_defconfig | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/configs/at91sam9260eknf_defconfig b/configs/at91sam9260eknf_defconfig
> index 92bb071..4c17cb6 100644
> --- a/configs/at91sam9260eknf_defconfig
> +++ b/configs/at91sam9260eknf_defconfig
> @@ -2,9 +2,6 @@
>  BR2_arm=y
>  BR2_arm926t=y
>  
> -# Linux headers same as kernel, a 3.9 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9=y
> -
>  # Packages
>  BR2_PACKAGE_HOST_SAM_BA=y
>  
> @@ -13,15 +10,20 @@ BR2_TARGET_ROOTFS_UBIFS=y
>  BR2_TARGET_ROOTFS_UBI=y
>  
>  # Bootloaders
> -BR2_TARGET_AT91BOOTSTRAP=y
> -BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9260ek"
> -BR2_TARGET_AT91BOOTSTRAP_NANDFLASH=y
> +BR2_TARGET_AT91BOOTSTRAP3=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.7"
> +BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9260eknf_uboot"
>  BR2_TARGET_BAREBOX=y
>  BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="at91sam9260ek"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="at91sam9260ek_nandflash"

Why enable both U-Boot and Barebox?

>  # Kernel
>  BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.1"

For the sake of reproducibility you should set this to the version you tested, 
say, 4.8.6. The same goes for other patches in this series.

> -BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> -BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/atmel/at91sam9260ek/linux-3.9.config"

You can now drop this file.

> +BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9260ek"

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 16 Sep 2018 07:21:41 +0300
Subject: [Buildroot] [PATCH 5/5] configs/solidrun_macchiatobin_marvell:
 bump component versions
In-Reply-To: <20180914153326.19346-6-thomas.petazzoni@bootlin.com>
References: <20180914153326.19346-1-thomas.petazzoni@bootlin.com>
 <20180914153326.19346-6-thomas.petazzoni@bootlin.com>
Message-ID: <20180916042141.4fsryjj54fig2mcc@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Sep 14, 2018 at 05:33:26PM +0200, Thomas Petazzoni wrote:
> Bump Linux to armada-18.09, U-Boot to armada-18.09.1 and ATF to
> armada-18.09.4.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  configs/solidrun_macchiatobin_marvell_defconfig | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/solidrun_macchiatobin_marvell_defconfig b/configs/solidrun_macchiatobin_marvell_defconfig
> index acc8d1589e..4b52e47945 100644
> --- a/configs/solidrun_macchiatobin_marvell_defconfig
> +++ b/configs/solidrun_macchiatobin_marvell_defconfig
> @@ -7,7 +7,8 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Marvell MacchiatoBin"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="43965481990fd92e9666cf9371a8cf478055ec7c"
> +# This commit corresponds to release armada-18.09.4
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="711ecd32afe465b38052b5ba374c825b158eea18"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
> @@ -20,14 +21,15 @@ BR2_TARGET_MV_DDR_MARVELL=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_CUSTOM_GIT=y
>  BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/u-boot-marvell"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="u-boot-2017.03-armada-17.10"
> +# This commit corresponds to armada-18.09.1, based on u-boot 2018.03
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="8fe403172c58440bcfbb3724242301c0108eff5b"
>  BR2_TARGET_UBOOT_BOARDNAME="mvebu_mcbin-88f8040"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,MarvellEmbeddedProcessors,linux-marvell,linux-4.4.52-armada-17.10)/linux-linux-4.4.52-armada-17.10.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,MarvellEmbeddedProcessors,linux-marvell,linux-4.4.52-armada-17.10)/linux-linux-4.4.120-armada-18.09.tar.gz"

Why not bump to linux-4.14.22-armada-18.09? Is there any missing functionality 
in that release?

>  BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v8_lsp"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin"

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

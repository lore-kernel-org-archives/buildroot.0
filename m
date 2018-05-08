From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:08:18 +0200
Subject: [Buildroot] [PATCH 1/1] socrates_cyclone5_defconfig: adjust to
 current kernel and u-boot
In-Reply-To: <20180507202238.2499-1-Florian.LaRoche@googlemail.com>
References: <20180507202238.2499-1-Florian.LaRoche@googlemail.com>
Message-ID: <20180508150818.447d1920@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this patch, see below for some comments.

On Mon,  7 May 2018 22:22:38 +0200, Florian La Roche wrote:
> Adjust socrates_cyclone5_defconfig to current Altera/upstream sources.

It would be nice to be a bit more explicit: the Linux kernel version is
still from a vendor-specific Git repository, while the U-Boot version
used is now the upstream version.

> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,altera-opensource,linux-socfpga,rel_socfpga-4.1.33-ltsi_17.07.02_pr)/linux-rel_socfpga-4.1.33-ltsi_17.07.02_pr.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,altera-opensource,linux-socfpga,socfpga-4.16)/linux-socfpga_socfpga-4.16.tar.gz"

'socfpga-4.16' is the name of a branch, so using that makes the build
non-reproducible, since the actual contents will depend on when it is
being fetched.

Since they don't provide tags apparently, we don't have any other
choice but to use a full commit SHA1. Could you adjust that ?

> +# BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +# BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"

Please don't keep this in comments.

>  BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="socfpga_cyclone5_socrates"
> @@ -16,9 +18,11 @@ BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> -BR2_TARGET_UBOOT_CUSTOM_GIT=y
> -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/altera-opensource/u-boot-socfpga.git"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2017.07"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.03"
> +# BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +# BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/altera-opensource/u-boot-socfpga.git"
> +# BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="socfpga_v2017.09"

Please don't keep these as comments, just delete those lines.

Could you adjust your patch, and send an updated version ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

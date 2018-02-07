From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 8 Feb 2018 00:07:03 +0100
Subject: [Buildroot] [PATCH 1/1] configs: beaglebone: bump kernel and
 uboot version
In-Reply-To: <20180206203606.26096-1-lothar.felten@gmail.com>
References: <20180206203606.26096-1-lothar.felten@gmail.com>
Message-ID: <40a72181-3571-9029-267e-2e10577f62af@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Lothar,

On 06-02-18 21:36, Lothar Felten wrote:
[snip]
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="128M"

 Why do we suddenly need a huge rootfs?

>  BR2_TARGET_UBOOT=y
> -BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y

 It is weird that by going to a more recent U-Boot, you suddenly move *away*
from the new Kconfig-based configuration system...

> -BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"

 You need to still keep a custom version, even if it is the same as the current
default. Otherwise it will be bumped automatically when U-Boot is bumped and we
don't want a bootloader (or kernel) that has not been boot-tested.

> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
> -BR2_TARGET_UBOOT_NEEDS_DTC=y

 So, the newer U-Boot also stopped using DT? I can hardly believe this...

> +BR2_TARGET_UBOOT_BOARDNAME="am335x_evm"
>  # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>  BR2_TARGET_UBOOT_FORMAT_IMG=y
> -BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> -BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"

 Huh, why was this in there before?

>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="MLO"
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_DTC=y

 If U-Boot doesn't need, it, why is host-dtc still needed?


 Regards,
 Arnout

>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

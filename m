From: Lothar Felten <lothar.felten@gmail.com>
Date: Fri, 23 Sep 2016 00:55:51 +0200
Subject: [Buildroot] uboot: building MLO fails
Message-ID: <e564e1a1-d285-c57b-46a1-00d6375d01f9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

with the current uboot.mk the MLO isn't generated anymore.

I modified my defconfig (beaglebone_defconfig) to:
BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"
BR2_TARGET_UBOOT_SPL=y
BR2_TARGET_UBOOT_SPL_NAME="MLO"

In uboot.mk $(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME) is added to 
UBOOT_BINS but not to UBOOT_MAKE_TARGET, why?

If I add:
UBOOT_MAKE_TARGET += $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
the MLO ist built and installed, but I'm not sure if that would break 
qmx6_defconfig, orangepipc_defconfig or toradex_apalis_imx6_defconfig.

Lothar

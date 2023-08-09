Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B0AC001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FBFE41802;
	Wed,  9 Aug 2023 21:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FBFE41802
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id La6yPiasQ5tX; Wed,  9 Aug 2023 21:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AC564092D;
	Wed,  9 Aug 2023 21:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AC564092D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 678861BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EA3A40647
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EA3A40647
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9JMaLEFKSwnH for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:23:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C11F400D9
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C11F400D9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48F108531C; Wed,  9 Aug 2023 21:23:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 23:23:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d582bf978fe6a9002a7950c6fd7c33fe1e0d5df5
X-Git-Newrev: 2cc1902943b2032aca48e050816906e9caa355cd
X-Patchwork-Hint: ignore
Message-Id: <20230809212354.48F108531C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/imxrt1050-evk: new
 defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2cc1902943b2032aca48e050816906e9caa355cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add defconfig for imxrt1050-evk is a development board from NXP.

The i.MXRTxxxx family spreads from i.MXRT1020 to i.MXRT1170 with the
first one supporting 1 USB OTG & 100M ethernet with a cortex-M7@500Mhz
up to the latter with i.MXRT1170 with cortex-M7@1Ghz and
cortex-M4@400Mhz, 2MB of internal SRAM, 2D GPU, 2x 1Gb and 1x 100Mb
ENET. The i.MXRT family is NXP's answer to STM32F7xx, as it uses only
simple SDRAM, it gives the chance of a 4 or less layer PCBs. Seeing
that these chips are comparable to the STM32F7xxs which have Buildroot
ported to them it seems reasonable to add support for them.

https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/i-mx-rt1050-evaluation-kit:MIMXRT1050-EVK

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                  |  6 ++++
 board/freescale/imxrt1050evk/genimage.cfg   | 40 ++++++++++++++++++++++++++
 board/freescale/imxrt1050evk/readme.txt     | 30 ++++++++++++++++++++
 board/freescale/imxrt1050evk/uboot.fragment |  2 ++
 configs/imxrt1050-evk_defconfig             | 44 +++++++++++++++++++++++++++++
 5 files changed, 122 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2c45786a83..a2948e8cb7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1169,12 +1169,14 @@ F:	package/xapian/
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
 F:	board/bananapi/bananapi-m2-ultra/
 F:	board/freescale/imx6ullevk/
+F:	board/freescale/imxrt1050evk/
 F:	board/olimex/a*
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
 F:	configs/bananapi_m2_ultra_defconfig
 F:	configs/freescale_imx6ullevk_defconfig
 F:	configs/imx6ullevk_defconfig
+F:	configs/imxrt1050-evk_defconfig
 F:	configs/olimex_a*
 F:	package/at/
 F:	package/binutils/
@@ -1533,6 +1535,10 @@ F:	package/strongswan/
 F:	package/wmctrl/
 F:	package/x11r7/xdriver_xf86-video-imx/
 
+N:	Jesse Taube <Mr.Bossman075@gmail.com>
+F:	board/freescale/imxrt1050evk/
+F:	configs/imxrt1050-evk_defconfig
+
 N:	Jesse Van Gavere <jesseevg@gmail.com>
 F:	package/qt6/
 
diff --git a/board/freescale/imxrt1050evk/genimage.cfg b/board/freescale/imxrt1050evk/genimage.cfg
new file mode 100644
index 0000000000..daa51bdbe0
--- /dev/null
+++ b/board/freescale/imxrt1050evk/genimage.cfg
@@ -0,0 +1,40 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"uImage",
+			"imxrt1050-evk.dtb",
+		}
+	}
+
+	size = 8M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition SPL {
+		in-partition-table = "no"
+		image = "SPL"
+		offset = 1K
+		size = 127K
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot.img"
+		offset = 128K
+		size = 512K
+	}
+
+	partition boot {
+		partition-type = 0xc
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/freescale/imxrt1050evk/readme.txt b/board/freescale/imxrt1050evk/readme.txt
new file mode 100644
index 0000000000..1fc4edd88b
--- /dev/null
+++ b/board/freescale/imxrt1050evk/readme.txt
@@ -0,0 +1,30 @@
+NXP i.MXRT1050 EVK board
+------------------------
+
+i.MX RT1050 are NXP's crossover MCUs. They combine the high performance and high
+level of integration of an applications processors with the ease-of-use and
+real-time functionality of a microcontroller. The i.MX RT1050 MCU runs on the Arm
+Cortex-M7 core at 600 MHz.
+https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/i-mx-rt1050-evaluation-kit:MIMXRT1050-EVK
+
+To build a minimal support for this board:
+
+$ make imxrt1050-evk_defconfig
+$ make
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be flashed into the SD card:
+
+$ dd if=output/images/sdcard.img of=/dev/sdX
+Where 'sdX' is the device node of the uSD.
+
+Jumper settings:
+
+   SW7: 1 0 1 0
+
+Where 0 means bottom position and 1 means top position (from the
+switch label numbers reference).
+
+Connect the USB cable between the EVK and the PC for the console.
+
+Insert the micro SD card in the board, power it up and U-Boot messages should come up.
diff --git a/board/freescale/imxrt1050evk/uboot.fragment b/board/freescale/imxrt1050evk/uboot.fragment
new file mode 100644
index 0000000000..1c5bb6af35
--- /dev/null
+++ b/board/freescale/imxrt1050evk/uboot.fragment
@@ -0,0 +1,2 @@
+CONFIG_USE_BOOTCOMMAND=y
+CONFIG_BOOTCOMMAND="setenv bootargs console=ttyLP0 root=/dev/mmcblk0p2 rw earlycon rootwait;load mmc 0:1 0x80800000 imxrt1050-evk.dtb;load mmc 0:1 0x80000000 uImage;bootm 0x80000000 - 0x80800000"
diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
new file mode 100644
index 0000000000..af060fb9f4
--- /dev/null
+++ b/configs/imxrt1050-evk_defconfig
@@ -0,0 +1,44 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_m7=y
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
+
+# Toolchain
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1"
+BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imxrt1050-evk"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="16M"
+
+# NOMMU Busybox
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imxrt1050evk/uboot.fragment"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+
+# Required tools to create the SD card image
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

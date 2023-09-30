Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F425E7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 09:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9061281363;
	Sat, 30 Sep 2023 09:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9061281363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMDvPyFJQR9O; Sat, 30 Sep 2023 09:34:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F26980F51;
	Sat, 30 Sep 2023 09:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F26980F51
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 37FB51BF2EA
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20F2560E5D
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20F2560E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YzQxiUglOrgO for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 09:34:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E689760E4E
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 09:34:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E689760E4E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFC80838CE; Sat, 30 Sep 2023 09:34:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 11:34:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01ec4a39f5ceb83c62b0040067ba53197a0a6843
X-Git-Newrev: 6bafe36caf7aefd11835f6ca4ca57d922156e89f
X-Patchwork-Hint: ignore
Message-Id: <20230930093441.CFC80838CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/bananapi_m2_berry: new defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=6bafe36caf7aefd11835f6ca4ca57d922156e89f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for Bananapi M2 Berry board based on the Allwinner V40/A40i
SoC.

- U-Boot 2023.07
- Linux 6.1.38

Board specifications: https://wiki.banana-pi.org/Banana_Pi_BPI-M2_Berry

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  1 +
 board/bananapi/bananapi-m2-berry/boot.cmd     |  7 ++++++
 board/bananapi/bananapi-m2-berry/genimage.cfg | 34 ++++++++++++++++++++++++++
 board/bananapi/bananapi-m2-berry/readme.txt   | 35 +++++++++++++++++++++++++++
 configs/bananapi_m2_berry_defconfig           | 31 ++++++++++++++++++++++++
 5 files changed, 108 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 05ef1c08c0..a027958331 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1199,6 +1199,7 @@ F:	board/freescale/imxrt1050evk/
 F:	board/olimex/a*
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
+F:	configs/bananapi_m2_berry_defconfig
 F:	configs/bananapi_m2_ultra_defconfig
 F:	configs/freescale_imx6ullevk_defconfig
 F:	configs/imx6ullevk_defconfig
diff --git a/board/bananapi/bananapi-m2-berry/boot.cmd b/board/bananapi/bananapi-m2-berry/boot.cmd
new file mode 100644
index 0000000000..9efb6bc89d
--- /dev/null
+++ b/board/bananapi/bananapi-m2-berry/boot.cmd
@@ -0,0 +1,7 @@
+setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p2 rootwait
+
+mmc dev 0
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-v40-bananapi-m2-berry.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/bananapi/bananapi-m2-berry/genimage.cfg b/board/bananapi/bananapi-m2-berry/genimage.cfg
new file mode 100644
index 0000000000..535f3dffee
--- /dev/null
+++ b/board/bananapi/bananapi-m2-berry/genimage.cfg
@@ -0,0 +1,34 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-v40-bananapi-m2-berry.dtb",
+			"boot.scr"
+		}
+	}
+
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1016K # 1MB - 8KB
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/bananapi/bananapi-m2-berry/readme.txt b/board/bananapi/bananapi-m2-berry/readme.txt
new file mode 100644
index 0000000000..838675ed94
--- /dev/null
+++ b/board/bananapi/bananapi-m2-berry/readme.txt
@@ -0,0 +1,35 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Bananapi M2 Berry. With the current
+configuration it will bring-up the board, and allow access through the
+serial console.
+
+Bananapi M2 Berry link:
+https://wiki.banana-pi.org/Banana_Pi_BPI-M2_Berry
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make bananapi_m2_berry_defconfig
+    $ make
+
+Note: you will need access to the internet to download the required
+sources.
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+  $ sudo sync
+
+Insert the micro SDcard in your Bananapi M2 Berry and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/bananapi_m2_berry_defconfig b/configs/bananapi_m2_berry_defconfig
new file mode 100644
index 0000000000..300261d07f
--- /dev/null
+++ b/configs/bananapi_m2_berry_defconfig
@@ -0,0 +1,31 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Berry"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-berry/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.38"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-v40-bananapi-m2-berry"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m2_berry"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m2-berry/boot.cmd"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

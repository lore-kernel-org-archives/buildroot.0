Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FD6C10F1B
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 09:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C45E04071E;
	Mon, 19 Dec 2022 09:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C45E04071E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aBvNiFBJ74UJ; Mon, 19 Dec 2022 09:12:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DF4940743;
	Mon, 19 Dec 2022 09:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DF4940743
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 70D7E1BF3D5
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 09:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C1C64012E
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 09:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C1C64012E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jR0vNsto4AXY for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 09:12:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6591A400F8
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 09:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6591A400F8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52489869E0; Mon, 19 Dec 2022 09:12:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 19 Dec 2022 10:05:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58bb71089e52323aea8696a5de2d7687422bde74
X-Git-Newrev: 704c62bbc5d30df80002fdd1f6a63bebc0e1842d
X-Patchwork-Hint: ignore
Message-Id: <20221219091236.52489869E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/visionfive2_defconfig: new
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=704c62bbc5d30df80002fdd1f6a63bebc0e1842d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a defconfig for the Starfive VisionFive2 board, a board built around the
Starfive JH7110 RISC-V 64bit SoC.

This board comes with functional lowlevel and U-Boot bootloaders in SPI
flash. The defconfig reuses these and only builds a (5.15 based) kernel and
rootfs.

The factory shipped U-Boot is hard coded to look at MMC partition 3.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
[Peter: add to DEVELOPERS]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  4 +++
 board/visionfive2/genimage.cfg                     | 21 +++++++++++++++
 .../overlay/boot/extlinux/extlinux.conf            |  4 +++
 board/visionfive2/readme.txt                       | 30 ++++++++++++++++++++++
 configs/visionfive2_defconfig                      | 18 +++++++++++++
 5 files changed, 77 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b0f10148b5..a200edb7f5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1029,6 +1029,10 @@ F:	package/tbb/
 N:	Francisco Gonzalez <gzmorell@gmail.com>
 F:	package/ser2net/
 
+N:	Francois Dugast <francois.dugast.foss@gmail.com>
+F:	board/visionfive2/
+F:	configs/visionfive2_defconfig
+
 N:	Francois Perrad <francois.perrad@gadz.org>
 F:	board/freescale/ls1028ardb/
 F:	board/olimex/a20_olinuxino
diff --git a/board/visionfive2/genimage.cfg b/board/visionfive2/genimage.cfg
new file mode 100644
index 0000000000..c221b49c7b
--- /dev/null
+++ b/board/visionfive2/genimage.cfg
@@ -0,0 +1,21 @@
+# Minimal SD card image for the Starfive VisionFive2 board
+
+image sdcard.img {
+	hdimage {
+	}
+
+	# u-boot is hard coded to look at 3rd partition
+	partition dummy1 {
+		size = 512
+	}
+
+	partition dummy2 {
+		size = 512
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		bootable = "true"
+	}
+}
diff --git a/board/visionfive2/overlay/boot/extlinux/extlinux.conf b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..6e2c5660d6
--- /dev/null
+++ b/board/visionfive2/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /boot/Image
+  devicetree /boot/jh7110-visionfive-v2.dtb
+  append console=ttyS0,115200 root=/dev/mmcblk1p3
diff --git a/board/visionfive2/readme.txt b/board/visionfive2/readme.txt
new file mode 100644
index 0000000000..2da98f3847
--- /dev/null
+++ b/board/visionfive2/readme.txt
@@ -0,0 +1,30 @@
+Starfive VisionFive2
+====================
+
+The VisionFive2 is a low-cost RISC-V 64-bit based platform, powered by a
+Starfive JH7110 processor.
+
+How to build
+============
+
+$ make visionfive2_defconfig
+$ make
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
+
+Preparing the board
+===================
+
+Connect a TTL UART cable to pin 6 (GND), 8 (TX) and 10 (RX).
+
+Insert your SD card.
+
+Power-up the board using an USB-C cable.
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
new file mode 100644
index 0000000000..5b07a8efbc
--- /dev/null
+++ b/configs/visionfive2_defconfig
@@ -0,0 +1,18 @@
+BR2_riscv=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/visionfive/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,7b7b4eddd8d5ae55f6e0ee09b93e16e23ab4f97b)/linux-7b7b4eddd8d5ae55f6e0ee09b93e16e23ab4f97b.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="starfive_visionfive2"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7110-visionfive-v2"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

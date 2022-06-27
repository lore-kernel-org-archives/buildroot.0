Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF95C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 21:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0241A60E6D;
	Mon, 27 Jun 2022 21:00:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0241A60E6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CsRTMVqktj2N; Mon, 27 Jun 2022 21:00:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBC1F60C0A;
	Mon, 27 Jun 2022 21:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBC1F60C0A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 70B791BF2B0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60510405CB
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60510405CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vn15yJ51Wabp for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 21:00:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 350D3408B1
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 21:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 350D3408B1
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EC829875D0; Mon, 27 Jun 2022 20:47:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 27 Jun 2022 22:59:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1409d4b0c44b8c8370e2df1e24d11242e0de51f6
X-Git-Newrev: f089aa9877b0f31bd206714449cf41ade196f8e5
X-Patchwork-Hint: ignore
Message-Id: <20220627204727.EC829875D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/aspeed_ast2500evb: new defconfig
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
Content-Type: multipart/mixed; boundary="===============8037460038727718587=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8037460038727718587==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f089aa9877b0f31bd206714449cf41ade196f8e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel is from upstream with a few extras to reduce the size of
the 'aspeed_g5' zImage because it is too big for the flash layout.
Mainline U-Boot has enough support to load the kernel from the flash
device and from network but it is still behind the OpenBMC branch
where most the development is done.

The main resulting file from the build is a flash image. The partition
layout matches the OpenBMC one for 32M chips. It makes it easier to
update the different partitions from Linux. Intermediate files can be
used to boot from U-Boot over the network or to boot QEMU using
-kernel/-initrd/-dtb.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/aspeed/ast2500-evb/genimage.cfg   | 40 +++++++++++++++++
 board/aspeed/ast2500-evb/linux.fragment |  7 +++
 board/aspeed/ast2500-evb/readme.txt     | 80 +++++++++++++++++++++++++++++++++
 board/aspeed/ast2500-evb/uboot.fragment |  3 ++
 configs/aspeed_ast2500evb_defconfig     | 43 ++++++++++++++++++
 5 files changed, 173 insertions(+)

diff --git a/board/aspeed/ast2500-evb/genimage.cfg b/board/aspeed/ast2500-evb/genimage.cfg
new file mode 100644
index 0000000000..498a71e4d7
--- /dev/null
+++ b/board/aspeed/ast2500-evb/genimage.cfg
@@ -0,0 +1,40 @@
+#
+# This config reproduces the OpenBMC flash layout defined in Linux :
+#
+#    arch/arm/boot/dts/openbmc-flash-layout.dtsi
+#
+# and included by aspeed-ast2500-evb.dts
+#
+flash nor-32M-256 {
+	pebsize = 4K
+	numpebs = 8K
+	minimum-io-unit-size = 256
+}
+
+image flash.img {
+	flash {
+	}
+	flashtype = "nor-32M-256"
+
+	partition uboot {
+		image = "u-boot.bin"
+		size = 384K
+	}
+
+	partition ubootenv {
+		/* TODO */
+		offset = 384K
+		size = 128K
+	}
+
+	partition fitimage {
+		image = "image.itb"
+		offset = 512K
+		size = 4352K
+	}
+
+	partition spare {
+		offset = 4864K
+		size = 27904K
+	}
+}
diff --git a/board/aspeed/ast2500-evb/linux.fragment b/board/aspeed/ast2500-evb/linux.fragment
new file mode 100644
index 0000000000..1cee95f842
--- /dev/null
+++ b/board/aspeed/ast2500-evb/linux.fragment
@@ -0,0 +1,7 @@
+CONFIG_KERNEL_XZ=y
+CONFIG_ARCH_MULTI_V7=n
+CONFIG_MACH_ASPEED_G6=n
+CONFIG_SMP=n
+CONFIG_EXT4_FS=n
+CONFIG_DEBUG_FS=n
+CONFIG_SUSPEND=n
diff --git a/board/aspeed/ast2500-evb/readme.txt b/board/aspeed/ast2500-evb/readme.txt
new file mode 100644
index 0000000000..f509be553b
--- /dev/null
+++ b/board/aspeed/ast2500-evb/readme.txt
@@ -0,0 +1,80 @@
+Aspeed AST2500 EVB
+
+Introduction
+============
+
+The AST2500 EVB is an evaluation board for the AST2500 SoC, most
+commonly used as a Server Management Processor. It includes an 800MHz
+ARM11 processor with DDR3 or DDR4 SDRAM (up to 1GB), SPI flash memory
+devices for BMC and host firmwares and numerous controllers to drive
+the server board.
+
+  https://www.aspeedtech.com/server_ast2500/
+
+How to build it
+===============
+
+Configure buildroot:
+
+  $ make aspeed_ast2500evb_defconfig
+
+Compile everything and build the rootfs image:
+
+  $ make
+
+Result of the build
+===================
+
+After building, the output/images directory contains:
+
+  output/images/
+    ├── aspeed-ast2500-evb.dtb
+    ├── flash.img
+    ├── image.itb
+    ├── rootfs.cpio
+    ├── rootfs.cpio.xz
+    ├── rootfs.tar
+    ├── u-boot.bin
+    └── zImage
+
+Flashing the image
+==================
+
+To update the contents of the first flash device, copy flash.img :
+
+  $ flashcp flash.img /dev/mtd0
+
+or simply the boot loader:
+
+  $ flashcp u-boot.bin /dev/mtd1
+
+Preparing the board
+===================
+
+ * Connect a serial line to the board
+ * Power-up the board
+
+Booting the board
+=================
+
+The AST2500 EVB boots from the SPI flash device directly and loads a
+first bootloader (usually U-Boot). U-Boot will attempt to load a Linux
+kernel from the same flash device by default but other storage could
+be used.
+
+ * from U-Boot
+
+   The FIT image image.itb can be used to boot the board from U-Boot
+   using tftp
+
+ * with QEMU
+
+   $ qemu-system-arm -M ast2500-evb \
+	-drive file=output/images/flash.img,format=raw,if=mtd \
+	-nographic
+
+   $ qemu-system-arm -M ast2500-evb \
+	-kernel output/images/zImage \
+	-initrd output/images/rootfs.cpio \
+	-dtb output/images/aspeed-ast2500-evb.dtb \
+	-nographic
diff --git a/board/aspeed/ast2500-evb/uboot.fragment b/board/aspeed/ast2500-evb/uboot.fragment
new file mode 100644
index 0000000000..8463252e59
--- /dev/null
+++ b/board/aspeed/ast2500-evb/uboot.fragment
@@ -0,0 +1,3 @@
+CONFIG_BOOTCOMMAND="bootm 20080000"
+CONFIG_FIT=y
+CONFIG_SHA256=y
diff --git a/configs/aspeed_ast2500evb_defconfig b/configs/aspeed_ast2500evb_defconfig
new file mode 100644
index 0000000000..c969f18d07
--- /dev/null
+++ b/configs/aspeed_ast2500evb_defconfig
@@ -0,0 +1,43 @@
+# Architecture
+BR2_arm=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="aspeed-evb"
+BR2_TARGET_GENERIC_ISSUE="Aspeed EVB"
+BR2_SYSTEM_DHCP="eth0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_XZ=y
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aspeed/common/post-image.sh"
+
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
+BR2_LINUX_KERNEL_DEFCONFIG="aspeed_g5"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/aspeed/ast2500-evb/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="aspeed-ast2500-evb"
+BR2_LINUX_KERNEL_XZ=y
+
+# Boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="evb-ast2500"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=ast2500-evb"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/aspeed/ast2500-evb/uboot.fragment"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+
+# Target tools
+BR2_PACKAGE_MTD=y

--===============8037460038727718587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8037460038727718587==--

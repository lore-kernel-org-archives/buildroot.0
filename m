Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885FDC43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 21:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B3E140603;
	Mon, 27 Jun 2022 21:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B3E140603
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UEHUKei1NyNG; Mon, 27 Jun 2022 21:00:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A99E040289;
	Mon, 27 Jun 2022 21:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A99E040289
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 86E361BF2B0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60904408C9
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60904408C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QrD0lBtHEUyB for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 21:00:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D52740612
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 21:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D52740612
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E2AA2875CF; Mon, 27 Jun 2022 20:47:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 27 Jun 2022 22:59:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c59a9d12b7805f2ac08be81fe18a4ebc197d5cd9
X-Git-Newrev: 1409d4b0c44b8c8370e2df1e24d11242e0de51f6
X-Patchwork-Hint: ignore
Message-Id: <20220627204727.E2AA2875CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/aspeed_ast2600evb: new defconfig
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
Content-Type: multipart/mixed; boundary="===============7393404352209001845=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7393404352209001845==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1409d4b0c44b8c8370e2df1e24d11242e0de51f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel is from upstream and U-Boot is from the OpenBMC branch
because mainline doesn't have the required support for HW, yet.

The main resulting file from the build is a flash image. The partition
layout matches the OpenBMC one for 64M chips. It makes it easier to
update the different partitions from Linux. Intermediate files can be
used to boot from U-boot over the network or to boot QEMU using
-kernel/-initrd/-dtb.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                             |  4 ++
 board/aspeed/ast2600-evb/genimage.cfg  | 40 +++++++++++++++++
 board/aspeed/ast2600-evb/readme.txt    | 80 ++++++++++++++++++++++++++++++++++
 board/aspeed/common/image.its.template | 56 ++++++++++++++++++++++++
 board/aspeed/common/post-image.sh      | 27 ++++++++++++
 configs/aspeed_ast2600evb_defconfig    | 44 +++++++++++++++++++
 6 files changed, 251 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fc329fec27..2ed43a1c16 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -500,8 +500,10 @@ N:	Cédric Chépied <cedric.chepied@gmail.com>
 F:	package/znc/
 
 N:	Cédric Le Goater <clg@kaod.org>
+F:	board/aspeed/
 F:	board/qemu/ppc-bamboo/
 F:	board/qemu/ppc64le-powernv8/readme.txt
+F:	configs/aspeed*
 F:	configs/qemu_ppc_bamboo_defconfig
 F:	configs/qemu_ppc64le_powernv8_defconfig
 
@@ -1460,6 +1462,8 @@ F:	board/qemu/ppc64le-pseries/
 F:	configs/qemu_ppc64le_pseries_defconfig
 F:	board/qemu/ppc-mac99/
 F:	configs/qemu_ppc_mac99_defconfig
+F:	board/aspeed/
+F:	configs/aspeed*
 
 N:	Johan Derycke <johanderycke@gmail.com>
 F:	package/python-libconfig/
diff --git a/board/aspeed/ast2600-evb/genimage.cfg b/board/aspeed/ast2600-evb/genimage.cfg
new file mode 100644
index 0000000000..56932d4787
--- /dev/null
+++ b/board/aspeed/ast2600-evb/genimage.cfg
@@ -0,0 +1,40 @@
+#
+# This config reproduces the OpenBMC flash layout defined in Linux :
+#
+#    arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
+#
+# and included by aspeed-ast2600-evb.dts
+#
+flash nor-64M-256 {
+	pebsize = 4K
+	numpebs = 16K
+	minimum-io-unit-size = 256
+}
+
+image flash.img {
+	flash {
+	}
+	flashtype = "nor-64M-256"
+
+	partition uboot {
+		image = "u-boot.bin"
+		size = 896K
+	}
+
+	partition ubootenv {
+		/* TODO */
+		offset = 896K
+		size = 128K
+	}
+
+	partition fitimage {
+		image = "image.itb"
+		offset = 1M
+		size = 9M
+	}
+
+	partition spare {
+		offset = 10M
+		size = 54M
+	}
+}
diff --git a/board/aspeed/ast2600-evb/readme.txt b/board/aspeed/ast2600-evb/readme.txt
new file mode 100644
index 0000000000..1f7ba13d5d
--- /dev/null
+++ b/board/aspeed/ast2600-evb/readme.txt
@@ -0,0 +1,80 @@
+Aspeed AST2600 EVB
+
+Introduction
+============
+
+The AST2600 EVB is an evaluation board for the AST2600 SoC, most
+commonly used as a Server Management Processor. It includes a
+Dual-core ARM Cortex A7 processor with DDR4 SDRAM (up to 2GB), SPI
+flash memory devices for BMC and host firmwares and numerous
+controllers to drive the server board.
+
+  https://www.aspeedtech.com/server_ast2600/
+
+How to build it
+===============
+
+Configure buildroot:
+
+  $ make aspeed_ast2600evb_defconfig
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
+    ├── aspeed-ast2600-evb.dtb
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
+The AST2600 EVB boots from the SPI flash device directly and loads a
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
+   $ qemu-system-arm -M ast2600-evb \
+	-drive file=output/images/flash.img,format=raw,if=mtd \
+	-nographic
+
+   $ qemu-system-arm -M ast2600-evb \
+	-kernel output/images/zImage \
+	-initrd output/images/rootfs.cpio \
+	-dtb output/images/aspeed-ast2600-evb.dtb \
+	-nographic
diff --git a/board/aspeed/common/image.its.template b/board/aspeed/common/image.its.template
new file mode 100644
index 0000000000..e3200e2407
--- /dev/null
+++ b/board/aspeed/common/image.its.template
@@ -0,0 +1,56 @@
+/dts-v1/;
+
+/ {
+	description = "Kernel and buildroot image";
+	#address-cells = <1>;
+
+	images {
+		kernel-1 {
+			description = "Linux kernel";
+			data = /incbin/("zImage");
+			type = "kernel";
+			arch = "arm";
+			os = "linux";
+			compression = "none";
+			load = <0x80001000>;
+			entry = <0x80001000>;
+			hash-1 {
+				algo = "sha256";
+			};
+		};
+		fdt-1 {
+			description = "Flattened Device Tree blob";
+			data = /incbin/("%BOARD_DTB%");
+			type = "flat_dt";
+			arch = "arm";
+			compression = "none";
+			hash-1 {
+				algo = "sha256";
+			};
+		};
+		ramdisk-1 {
+			description = "ramdisk";
+			data = /incbin/("rootfs.cpio.xz");
+			type = "ramdisk";
+			arch = "arm";
+			os = "linux";
+			compression = "none";
+			hash-1 {
+				algo = "sha256";
+			};
+		};
+	};
+
+	configurations {
+		default = "conf-1";
+		conf-1 {
+			description = "Boot Linux kernel with FDT blob, ramdisk";
+			kernel = "kernel-1";
+			fdt = "fdt-1";
+			ramdisk = "ramdisk-1";
+			hash-1 {
+				algo = "sha256";
+			};
+		};
+	};
+};
diff --git a/board/aspeed/common/post-image.sh b/board/aspeed/common/post-image.sh
new file mode 100755
index 0000000000..ea65a49aff
--- /dev/null
+++ b/board/aspeed/common/post-image.sh
@@ -0,0 +1,27 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+mkimage=$HOST_DIR/bin/mkimage
+
+BOARD_DT=$(sed -n \
+           's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9\-]*\).*"$/\1/p' \
+           ${BR2_CONFIG})
+
+sed -e "s/%BOARD_DTB%/${BOARD_DT}.dtb/" \
+    $BOARD_DIR/image.its.template > $BINARIES_DIR/image.its
+
+(cd $BINARIES_DIR && $mkimage -f image.its image.itb)
+
+GENIMAGE_CFG="board/aspeed/${BOARD_DT#aspeed-*}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+  --rootpath "${TARGET_DIR}" \
+  --tmppath "${GENIMAGE_TMP}" \
+  --inputpath "${BINARIES_DIR}" \
+  --outputpath "${BINARIES_DIR}" \
+  --config "${GENIMAGE_CFG}"
+
+rm -f $BINARIES_DIR/image.its
diff --git a/configs/aspeed_ast2600evb_defconfig b/configs/aspeed_ast2600evb_defconfig
new file mode 100644
index 0000000000..cd058ad0ac
--- /dev/null
+++ b/configs/aspeed_ast2600evb_defconfig
@@ -0,0 +1,44 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
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
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="aspeed-ast2600-evb"
+
+# Boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/openbmc/u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="f2b82fa4ba17ed8091fe76c284220006645a293b"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="evb-ast2600"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=ast2600a1-evb"
+
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+
+# Target tools
+BR2_PACKAGE_MTD=y

--===============7393404352209001845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7393404352209001845==--

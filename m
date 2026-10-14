Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3988ACC6B1A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 14:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA370607B6;
	Wed, 14 Oct 2026 14:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XS4AjCX0G0HQ; Wed, 14 Oct 2026 14:05:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A15BD60802
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791986707;
	b=JWdUco+Lh9XFobUofvLSNkiWWMQkAbgMl3ExaygiQWlz/+togtTGZsT1HwwE4sAKT1wh
	 eKvYPiXZtaCGwBkSK9o4oXYmwdy69BSpR20ezGCVUYTTOCYBNpic3/Gy40ifG+LvyI5RE
	 tULNB/AJlNA58EjXMmEVp2OXAFxzsn8kxwO4iR/l5NNRDpL5Fkwi51xwomnpXUhrleJaq
	 xyFi21c6IRexQUoW/2IpWwxlJJuOYQtO4Isbr6ptA2KvnJVHgxKMM47QySKr1E5oZhGpb
	 dhp9qu1UeUdxb86kbpGOHnjxo32h8xo1FSXvO3j/8nXvFXUsGmY2U/c8W4y0U7dmZ8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791986707;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rJvC9lh8iulUyvkZrprp5rs2qe05b535YY7Ppgy5ctw=;
	b=P0dZjTrmgBlfo7TO6gjH80OFqOjmpyYw/fjlKWiKa7cBmn/j9lftaoi7I1IBIA5Qrluy
	 kRJHbxoRSNdhfom1zl5HL04jcqiOz0B2hi2bnujJ0HvHCmixpN+Ze+HBBUXeZ/4B9ZXDE
	 p9GPg5XfLhH7WHFcmViZYUYB+AKmGZJbF5Q2zBXqEqJOIobEDiRo2wZgaEMldIHBP9u8J
	 C3uU2GhZy5gAOUDRE+rrmtUq/QSbP9LhKKKc2HvtTeLDMxXmF2Gt2QvDmsmBJg7ku7bg4
	 lfyaXM1j4dOI9Fwbb0Ome/45qMi6gvMKNF1q1snQCBiranvnYz2eiMu0wr6LioI1cpQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791986707;
	bh=rJvC9lh8iulUyvkZrprp5rs2qe05b535YY7Ppgy5ctw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=fJ0oMiKY+ahj3Dkx1kOXdbkMv/y0CddjZxMBkRoVcwGwDIeWGsAJseMjkYSmqwpst
	 zINYpoKcIY1UNhlNXLGjEiXQ4UrFbgdzzyfPxruvuSj35UbZjv8ZJ2NpVH2ZGCc5EI
	 +uRmHPC4yTbnad3K9K6Bd9ENcZzSB38UjqxyYt7Bv8Hfk4mh1hvZY3+bSCcrgBkA3d
	 2MQnlhFjr3XFGvYCuxRNSDqQ96H1r/kE9ig7ao4neOaEzRXy9/eKuzZL/MqjMj9cxQ
	 qki+9aiTVTc58jHIzP3qTlpXCYtZk0EEjKwnpIIDNTmdKWgyYaAOT+Mec3RjwoPjdN
	 hnK49HzJOwj6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A15BD60802;
	Wed, 14 Oct 2026 14:05:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E08A3255
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 14:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D240860684
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 14:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vhlWqef-1dw for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 14:05:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B432F605DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791986705;
 b=tgrK1ss1tdhswhmW9qqK26mjLvfNfJmObQqCHNaYjBUUCs1vFkCsjefW9gznYP+vIOLD
 x8sTE8gbeifQS9n8A9RxP1QbqFV+BJA2h1qyVdB5ElP46OLycURjdjnfxtFbg/rto7njD
 HimOs5bWXMoHwh69Hkq+nFNGps3aMwWX27uHKsgDoq+34AStBKpysQnxB6kLGj7lYJiqI
 dx95f8x7/Mb8oDwWjcXlHKmsc2GKN70+C6mQQkeLrJaShHfPJgxQkshj2qVVO3Nk6PGDS
 0ru+pidtpu3zZnYPEdFnsCDT5YvY0mkP/zD7ddE4nJUvZZxw2UyxCNgb6cfnxkg5Ppg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791986705;
 h=Received-SPF:Received:Received:DKIM-Signature:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Ir7ZScSB4k6lrYkBWVZIdakK8awBa4fPivFdBG79YZk=;
 b=bYZROnAHlWLVOlrnjlNPm4QplzQ/Ror/rrJ/ZMN2wxgj62bvbiR2i8gfRnoFVyIk4xhn
 WP68Z/KvYaS5nNukqOyNb5qcYJH92D0XjKKLfpgrrkwF8azY+U0AjKM5JZKBje8GK8uce
 7G3XieQvqU6BTn/+igklJHWQxKtRFOOaXXmqX8nFJUjk0QYNuhBXVOVopotplJCHJIPDR
 0ybhBKs32LqgPKrOYpcoY/rG4H+m8X0MY90LhFGGePPuGT478kJBotzqMNLaWJqENngBF
 qpvj5DE8aCaRaErPyWrvvImxcd3+1Shhjgte4HHGaN226MyABgaodSP31axiopc113A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kernel.org;
 dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20260515 header.b=IgRjx2q+; 
 arc=none smtp.remote-ip=172.105.4.254
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254;
 helo=tor.source.kernel.org; envelope-from=dinguyen@kernel.org;
 receiver=<UNKNOWN> 
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B432F605DB
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 14:05:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 4309860218
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 14:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3921F00A2F;
 Wed, 14 Oct 2026 14:05:01 +0000 (UTC)
To: buildroot@buildroot.org
Cc: dinguyen@kernel.org
Date: Wed, 14 Oct 2026 09:04:59 -0500
Message-ID: <20261014140459.2113694-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] config: add socfpga_agilex5_defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Dinh Nguyen via buildroot <buildroot@buildroot.org>
Reply-To: Dinh Nguyen <dinguyen@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build Linux, U-Boot, and TF-A for the Agilex 5 SoC Development Kit
from the QPDS 26.1.1 GSRD sources.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 board/altera/agilex5/genimage.cfg   | 27 ++++++++++++++++
 board/altera/agilex5/linux.fragment |  4 +++
 board/altera/agilex5/readme.txt     | 50 +++++++++++++++++++++++++++++
 board/altera/agilex5/uboot.fragment |  4 +++
 configs/socfpga_agilex5_defconfig   | 49 ++++++++++++++++++++++++++++
 5 files changed, 134 insertions(+)
 create mode 100644 board/altera/agilex5/genimage.cfg
 create mode 100644 board/altera/agilex5/linux.fragment
 create mode 100644 board/altera/agilex5/readme.txt
 create mode 100644 board/altera/agilex5/uboot.fragment
 create mode 100644 configs/socfpga_agilex5_defconfig

diff --git a/board/altera/agilex5/genimage.cfg b/board/altera/agilex5/genimage.cfg
new file mode 100644
index 0000000000..720d646546
--- /dev/null
+++ b/board/altera/agilex5/genimage.cfg
@@ -0,0 +1,27 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"socfpga_agilex5_socdk.dtb",
+			"u-boot.itb"
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
+	partition boot {
+		partition-type = 0xc
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/altera/agilex5/linux.fragment b/board/altera/agilex5/linux.fragment
new file mode 100644
index 0000000000..7c8f9dec31
--- /dev/null
+++ b/board/altera/agilex5/linux.fragment
@@ -0,0 +1,4 @@
+# QSPI access fails when 4K sectors are enabled (ES-14728).
+# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
+# Marvell PHY on the SoC Development Kit Ethernet ports.
+CONFIG_MARVELL_PHY=y
diff --git a/board/altera/agilex5/readme.txt b/board/altera/agilex5/readme.txt
new file mode 100644
index 0000000000..4460e43477
--- /dev/null
+++ b/board/altera/agilex5/readme.txt
@@ -0,0 +1,50 @@
+Altera SoCFPGA Agilex 5 SoC Development Kit
+
+Intro
+=====
+
+This configuration builds a Linux system for the Agilex 5 SoC Development
+Kit (socfpga_agilex5_socdk) from the QPDS 26.1.1 Golden System Reference
+Design component versions:
+
+  https://github.com/altera-fpga/linux-socfpga          QPDS26.1.1_REL_GSRD_PR
+  https://github.com/altera-fpga/u-boot-socfpga         QPDS26.1.1_REL_GSRD_PR
+  https://github.com/altera-fpga/arm-trusted-firmware   QPDS26.1.1_REL_GSRD_PR
+
+The HPS first-stage bootloader is packaged by Quartus into the FPGA
+configuration file. This defconfig builds the software that the HPS loads
+after that: U-Boot (u-boot.itb, with TF-A BL31), the kernel Image, the
+socfpga_agilex5_socdk device tree, and a root filesystem.
+
+Build
+=====
+
+    make socfpga_agilex5_defconfig
+    make
+
+output/images will contain:
+
+    Image
+    socfpga_agilex5_socdk.dtb
+    u-boot.itb
+    u-boot-spl-dtb.hex
+    bl31.bin
+    rootfs.ext2
+    rootfs.tar.gz
+    sdcard.img
+
+sdcard.img has a FAT boot partition (Image, device tree, u-boot.itb) and
+an ext4 root filesystem on the second partition.
+
+Creating a bootable SD card
+===========================
+
+Copy a fabric configuration file named ghrd.core.rbf onto the FAT
+partition if the design needs the FPGA loaded before Linux starts. U-Boot
+skips that step when the file is absent.
+
+    dd if=output/images/sdcard.img of=/dev/sdX
+
+Program the HPS first-stage bootloader with Quartus, using
+output/images/u-boot-spl-dtb.hex as the HPS handoff file. Boot the HPS
+from the SD card. The serial console is ttyS0 at 115200 8n1.
diff --git a/board/altera/agilex5/uboot.fragment b/board/altera/agilex5/uboot.fragment
new file mode 100644
index 0000000000..1e3327555c
--- /dev/null
+++ b/board/altera/agilex5/uboot.fragment
@@ -0,0 +1,4 @@
+CONFIG_USE_BOOTARGS=y
+CONFIG_BOOTARGS="console=ttyS0,115200 root=/dev/mmcblk0p2 rw rootwait"
+CONFIG_USE_BOOTCOMMAND=y
+CONFIG_BOOTCOMMAND="if fatload mmc 0:1 ${loadaddr} ghrd.core.rbf; then fpga load 0 ${loadaddr} ${filesize}; bridge enable; fi; mmc rescan; fatload mmc 0:1 82000000 Image; fatload mmc 0:1 86000000 socfpga_agilex5_socdk.dtb; setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p2 rw rootwait; booti 0x82000000 - 0x86000000"
diff --git a/configs/socfpga_agilex5_defconfig b/configs/socfpga_agilex5_defconfig
new file mode 100644
index 0000000000..25d5beaded
--- /dev/null
+++ b/configs/socfpga_agilex5_defconfig
@@ -0,0 +1,49 @@
+BR2_aarch64=y
+BR2_cortex_a55=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_PACKAGE_HOST_GDB=y
+BR2_TARGET_GENERIC_HOSTNAME="agilex5"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/altera/agilex5/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/altera-fpga/linux-socfpga.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="QPDS26.1.1_REL_GSRD_PR"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/altera/agilex5/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="intel/socfpga_agilex5_socdk"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_GDB=y
+BR2_PACKAGE_DROPBEAR=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+BR2_TARGET_ROOTFS_TAR_GZIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/altera-fpga/arm-trusted-firmware.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="QPDS26.1.1_REL_GSRD_PR"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="agilex5"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/altera-fpga/u-boot-socfpga.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="QPDS26.1.1_REL_GSRD_PR"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="socfpga_agilex5"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/altera/agilex5/uboot.fragment"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.hex"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.42.0.411.g813d9a9188

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

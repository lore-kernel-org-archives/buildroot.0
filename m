Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84053606A321
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 20:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pzEqPwNv
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B2A060819;
	Mon,  9 Nov 2026 20:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H0TOJwyamE4n; Mon,  9 Nov 2026 20:51:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1FD616077E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794257477;
	b=lC0IwCVLcu1be0de7kQWX2AxvjsDQx36f49RlwckzNGzCWN0/6LT2Hf0Zx3Kp1P34Hf1
	 LFdlhwO2eaDM15pyo3fEZ2j6w8ATPfJ62HX/eBXnJgfs1RcuJahjVT+lDt1WmOXwYVY9O
	 zFZ/3PvfCo9hnb6+3MwfXOxAvEREpRJOWcRKrANRZOtTLqcuABuueWjJaQhdrzJiD5EIL
	 06v0mHcJkkUwdUVpLZRFfEg4RH+aNEnJEIu/1awHReBH/6NmmlxzUODeLbky0c96BNv0e
	 mCkDYd1B7CydK1qVdSI1GKU3Pwurpke3rqRYpNRTTOqmSVKdIDc5tfSHZ2wyL4xDMGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794257477;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0t4LgPRklJtpceBzkPZM/+Hpdr6Mww1IxYSTEJak6qo=;
	b=NaCMpViSu11nvWbNsPJWzHP3pOgwkeH4lANKCj2gJ+W/BiK/hXEQqjh8GKvpj68HC2F5
	 mjF3KiBoftBkpCCoclIqRvqfIIjTY64tieopvc3xzdvqEqR65RTB5J9aqTQUnfoPJbcRO
	 4vPtiDqVT4lRoncmpKKRETmj8W3mxjPVANEqrOWZAizdbyNUxSRRmaKwJjjOBld8V1gPg
	 6unds/XNzLyhdKmpgV3gJK6wKauSPlCrxV7Zq5jxwPUyqD1rwH1vPjthxktCR6VtNR1hh
	 dVEdd1hwFM5oH05iln+HeIMb7tvYfZ8Luq9A+viLvgQAehG7iWH8hAqT5uKIvMrotpA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794257477;
	bh=0t4LgPRklJtpceBzkPZM/+Hpdr6Mww1IxYSTEJak6qo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=pzEqPwNv8+o8ZBBn9LM/0MKHbl+iPPfKYf2HmwTWYFsy+44hVDu1KIwagLiwsLMVc
	 Ot0D03IVzF6NnB9kJg6s8j5ojpUHU3gwMQwZ6xZU8+GyoMJh4/NYWg4CISsGbciAvr
	 SOp2TBhAQSe1oYekeJRcwx5wrbuVXdyaAA5ZtnV/mj6fiv9rEtimWSn1iHZVdWN814
	 u3xa4PNDUwtJYv74GXgYD89ouqZYMWtlI56GCQUvYUfBCexysvAK7OXQWbXnmfQPEs
	 LoAjJ0jMn2+3zcZ6BhGynaXM3h1eI6vOtEiuYc8vjTGw6SpCB4vQHydLSQTCZhasCE
	 ppA0dZsaq00fQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FD616077E;
	Mon,  9 Nov 2026 20:51:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C9B2335
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 20:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E3BD402E1
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 20:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ca5XcrbpRi_P for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 20:51:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0A637400CC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31;
 helo=sea.source.kernel.org; envelope-from=dinguyen@kernel.org;
 receiver=<UNKNOWN> 
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A637400CC
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 20:51:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C9B6445813;
 Mon,  9 Nov 2026 20:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40AEA1F0089F;
 Mon,  9 Nov 2026 20:51:12 +0000 (UTC)
To: ju.o@free.fr
Cc: dinguyen@kernel.org, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Date: Mon,  9 Nov 2026 14:51:03 -0600
Message-ID: <20261109205104.2140273-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCHv2 1/2] configs/socfpga_agilex5_altera: new
 defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Dinh Nguyen via buildroot <buildroot@buildroot.org>
Reply-To: Dinh Nguyen <dinguyen@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Build Linux, U-Boot, and TF-A for the Agilex 5 SoC Development Kit
from the QPDS 26.1.1 GSRD sources.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2:
    - update commit header to configs/socfpga_agilex5_altera: new
defconfig
    - rename the defconfig socfpga_agilex5_altera_defconfig
    - Update the readme.txt to include a link to the Agilex5 PDK's
information, add notes about the 'dd' command
    - Update socfpga_agilex5_altera_defconfig to match new defconfig
requirements
    - Add to myself as a contact in DEVELOPERS
---
 DEVELOPERS                               |  3 ++
 board/altera/agilex5/genimage.cfg        | 27 +++++++++++
 board/altera/agilex5/linux.fragment      |  4 ++
 board/altera/agilex5/readme.txt          | 61 ++++++++++++++++++++++++
 board/altera/agilex5/uboot.fragment      |  4 ++
 configs/socfpga_agilex5_altera_defconfig | 46 ++++++++++++++++++
 6 files changed, 145 insertions(+)
 create mode 100644 board/altera/agilex5/genimage.cfg
 create mode 100644 board/altera/agilex5/linux.fragment
 create mode 100644 board/altera/agilex5/readme.txt
 create mode 100644 board/altera/agilex5/uboot.fragment
 create mode 100644 configs/socfpga_agilex5_altera_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index febf03773c..c1b0a5b925 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -904,6 +904,9 @@ N:	Dimitrios Siganos <dimitris@siganos.org>
 F:	package/bvi/
 F:	package/wireless-regdb/
 
+N:	Dinh Nguyen <dinguyen@kernel.org>
+F:	board/altera/
+
 N:	Dmitry Chestnykh <dm.chestnykh@gmail.com>
 F:	board/qemu/sparc-ss10/
 F:	configs/qemu_sparc_ss10_defconfig
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
index 0000000000..68b754b293
--- /dev/null
+++ b/board/altera/agilex5/readme.txt
@@ -0,0 +1,61 @@
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
+The socfpga_agilex5_altera_defconfig supports the Agilex5 065B Premium
+development kit[1].
+
+[1] https://www.altera.com/products/devkit/po-3284/agilex-5-fpga-e-series-065b-premium-development-kit
+
+Build
+=====
+
+    make socfpga_agilex5_altera_defconfig
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
+Prepare the SD card with this command:
+
+    dd if=output/images/sdcard.img of=/dev/sdX
+
+Notes:
+  - replace 'sdX' with the actual device with your micro SDcard,
+  - you may need to be root to do that (use 'sudo')
+
+Program the HPS first-stage bootloader with Quartus, using
+output/images/u-boot-spl-dtb.hex as the HPS handoff file. Boot the HPS
+from the SD card. The serial console is ttyS0 at 115200 8n1.
+
+Copy a fabric configuration file named ghrd.core.rbf onto the FAT
+partition if the design needs the FPGA loaded before Linux starts. U-Boot
+skips that step when the file is absent.
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
diff --git a/configs/socfpga_agilex5_altera_defconfig b/configs/socfpga_agilex5_altera_defconfig
new file mode 100644
index 0000000000..a0888bdd25
--- /dev/null
+++ b/configs/socfpga_agilex5_altera_defconfig
@@ -0,0 +1,46 @@
+BR2_cortex_a55=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
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
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+# BR2_TARGET_ROOTFS_TAR is not set
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

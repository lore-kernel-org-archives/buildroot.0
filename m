Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476E0606A31C
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 18:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=II0kUG66
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E30C81E2A;
	Wed, 28 Oct 2026 18:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nHCTHWD6QeXh; Wed, 28 Oct 2026 18:43:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EA17681CE7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793212986;
	b=sMvlS7kFUzrL3tIFjtCXxUJotvzhJyIGIL5e5jJoGOO1VS0u3rP/+eaUV1mU3dRZQsE5
	 o4z/XEi5o50d6tcm31NSOXfXFSL2Kil76UFlJT2Hok+cZXOWXGOxwmIf4hKwf2aXIvs6l
	 EYOhiP9NoUEpo45UzHYSl2jAepdadsMY1xvAlBHQxmfA+CgvwhnRYrZVsYn9qfzg1bmR1
	 BeUP/u6hzZXTvYg/6lvxrvo55KeL42Cgmxjz3WIbUe3qVHoo0QkAaJ2qQrfHaDTEKZSSr
	 BxJDKirJHbSQ9mNGRb47lhpKaruqhN9QCQc94I+pHaQn697nMBvytPWDE/4v6xtv+jA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793212986;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rJvC9lh8iulUyvkZrprp5rs2qe05b535YY7Ppgy5ctw=;
	b=LfwcrYihS3bHdJcxA49F6muLkVimj8yhqL8TP5cdYlzPNiQ4sp7HqweNDcZLFK4vCM79
	 /o8esLY3ArKOqTIMtLXgBYKqr26nOQWPEH2l/E6uDedhzXOMzi50JlAxNew8hysunyyDO
	 2dM6TsaTARlEszvNJR6sn2ueD3P+dPh85+MFpDFscnIu6HpMbl4nbdwhNXVXD4of9tXTr
	 STzU7r8sbbT93YtiwyL/5vN0ear1Ice+Koikj3IJYKEyVYdj4rK3wQHMA3vjZ+i7F3Mwd
	 bFrB/Tnq2fPeRpoHiUyg0MxRXq01dxVcXW8bm3IWyVgjDLAv3QzkikKP404P7tQl54g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793212986;
	bh=rJvC9lh8iulUyvkZrprp5rs2qe05b535YY7Ppgy5ctw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=II0kUG6638hb0J8Exoaz5amaxG7EdNLprhQfdu8ukKc+CHGfNjmAPkiae0z925um1
	 bEg016dyAFX8/BSNsdyutrQW14R0G0shgv0ctJAhd1qpFS6e44cLBPUk/lsBfKYbIW
	 SBP/CtJz0V3fcF3yV80OpWFya43tp2mzkrOyf/SUTpX+gmU9q5uetuzPsEE2MG+Pc8
	 APk7ZGIkiZaRZWhlIhZ80K6GmuwMX3pgeBrKxViU3OxmbOitDw5Z+H7B6P3pITERIL
	 X17d63Q8gs/+6Td59klPXZheg1REafpNhwCuCpeWO7gG6O1C0xxVkBuSFqx5fSVjI8
	 qUbjBEE7A7O4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA17681CE7;
	Wed, 28 Oct 2026 18:43:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41422356
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 18:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2708F81E2A
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 18:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6fnJhbberEF for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 18:43:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1CF4A81A29
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793212984;
 b=LmHniTSBOfQ4EFwkm9f+EVM2epLZGjbY5xTZeYqwArPUzFyjFcGD/BHfQa6BOXErsZOP
 5q2zdsLsbHa/eZHbYHBTF2AwnTo+Y7ZdYQVXOjxp1mP+mSHXtQJGwbYBH/hwsKnhb3npy
 mZn4W7Cz5dVACKlTCyrXNDPMft6JMfBtS1v+jOUte+yJJkTJ2VA8YyqLQtGR6F30FMfe9
 v1v4gFrKjb0O3iXjHl19A/JjmUbZCiBxo37bZ3LNtf6XTfnG3L+KroJdSNXemIqcLxFAv
 novUff9d1uPNC3Or5MaLepOjdi74JsUla8xnEU94im1lYB2ys0nZifpc+LThE5egXwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793212984;
 h=Received-SPF:Received:Received:DKIM-Signature:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Ir7ZScSB4k6lrYkBWVZIdakK8awBa4fPivFdBG79YZk=;
 b=ip9QDcilnD7TupdWeApaIQNtN2h007P1w9vZRJUbnqOtJB+lOY8Gyu9avNtKueDRGMIk
 2lZFkEufGufQ3/xGmN5jeV/PYdOnJ0c3WHs0fRL1N0L1uVh8p+rY1xQUUOgWvln5/oENT
 V1/TrF04vZnjO3dpnkEP8DbhfDR/OloKAYZlqIPWHPNmcsLoNK8wC37mVAPltnQgyyK3k
 68D9hUMRoA6gUm+dtPkcqQ+ARyFL/UyGYgTdZvdbe0FFThnXaaBa/xs/vHuHPDqHV3jhW
 MHQZzhxTO6hlIIFJP37R80EPozXqDjJfNoxGIcUPpedyMH4n5Ng5oIffPeaQvHeRM+g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kernel.org;
 dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20260515 header.b=Gcr9eSmU; 
 arc=none smtp.remote-ip=172.234.252.31
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31;
 helo=sea.source.kernel.org; envelope-from=dinguyen@kernel.org;
 receiver=<UNKNOWN> 
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1CF4A81A29
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 18:43:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D4AD943FD7;
 Wed, 28 Oct 2026 18:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9FB1F031E0;
 Wed, 28 Oct 2026 18:43:02 +0000 (UTC)
To: buildroot@buildroot.org
Cc: dinguyen@kernel.org,
	thomas.petazzoni@bootlin.com
Date: Wed, 28 Oct 2026 13:42:57 -0500
Message-ID: <20261028184257.635621-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH RESEND] config: add socfpga_agilex5_defconfig
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

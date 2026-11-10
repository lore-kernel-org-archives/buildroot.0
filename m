Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470C1606A31C
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 12:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aQVFeB9j
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19EDF40556;
	Tue, 10 Nov 2026 12:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvvJDLu_4YKA; Tue, 10 Nov 2026 12:16:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E218340562
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794312989;
	b=SLU9dSvKXpzD0yL0fFyiY0QEG0gnmFwfqiG3D3p3rzgHbR6z8l65XuxZ21kFl2qZ65K3
	 ngvJaplmbtJGrt8tjAgw5XpsmXakuKCHqaqOBds8IvFvUWwqsNzmCNH51o/4Sq+SnPweD
	 hKFqgg9eaDqFoKxVlE7jyk3U3L0ffsOsJYjqg+yWEriJvI/ZW4YwT6eq/Jasm/8SFEpJi
	 5vtfFyNdpfTZIUey9QkdkH/P7QJdohVqUBD42Yd/WQX3gCp3A65z6ziOkJ4iSRuquhpR4
	 K0z33Qj/1z/dWfh9u9rOrRI/AiZtljZEu6+0nUe0FokpgNFXYq0ZAhPMh8OyYfepNqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794312989;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gqey3TlPwRVZcssp664b/8Sn9IzIufRzJOwBj/OWytQ=;
	b=TVl33/KKMQWbGuwWaZE0rDpCovciQBNirRrDGLntgn2NOnB5R3eijHTSq4H/wuck/Q88
	 n9kmf8T0WpJltwesmI7mTDbj28T0RS+ETF+UZZCQlqt+0+riOKO0vWF/3JGdVKL3HAyEs
	 IrSgqzn+IKRTnDhSlyI8hZzMycg9B8XhxiddhzMfS6kuLcmzQmRZKiDxnoubrFR1Yz8aG
	 08/X006RljWhTTBn1naw1xEIZsX7rF/MCMgqMoBHmRPH1w73cPrG4mWDsSPyitLwKQZfR
	 oKyLdKTxKtajYV9g7+CjqqYiHFJyptPVJeygNfoLSJgxshCPDF4Ro3wkjYbQDkFJaLQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794312989;
	bh=gqey3TlPwRVZcssp664b/8Sn9IzIufRzJOwBj/OWytQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aQVFeB9jIQ32c/6TeKQg0Spjqz2XLbmTOpjpT4jS8fl6pHiZrVYacadpDYvcwg4O+
	 7JZGPLWSw/TNXrFB5TwJ4Civa/UHAgsaBIkn46/e0B3iWWYA6qeC1r4i4v5JrFTqRz
	 Idbc/TAxPK7cj9CdKyu8dSsRRQV4xQFgW9tLSKk3K7Awe3iTcXqE+8Lhkvgf4rDT8x
	 h/D/wxoEOxxvTCGFj6NDI81psnkTTYWruM30u2tH4A/TaoEP0Ry0NZ1FvZMKzMpOZr
	 QOart0YBAnzA6xoStEoCUBKeoJRTI8phYfzcuRyNANw02Dewne7KdsHcy1SOYvLb4z
	 V5eQRG979Y2QQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E218340562;
	Tue, 10 Nov 2026 12:16:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 92041D7
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 12:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8396B4034A
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 12:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giitrJ3lPFhO for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 12:16:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 49CD440176
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49CD440176
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 12:16:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65F1F8D594; Tue, 10 Nov 2026 12:14:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Nov 2026 13:13:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2f93a8076b27880754d827f2b5801f19de801fc
X-Git-Newrev: 7c1fdc76b84a59f88a0b2b90c823bf7695f16b13
X-Patchwork-Hint: ignore
Message-Id: <20261110121452.65F1F8D594@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/socfpga_agilex5_vendor: new
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7c1fdc76b84a59f88a0b2b90c823bf7695f16b13
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Build Linux, U-Boot, and TF-A for the Agilex 5 SoC Development Kit
from the QPDS 26.1.1 GSRD sources.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
[Julien:
 - squash patch enabling hashes
 - rename defconfig to replace "altera" by "vendor"
   and update readme.txt
 - remove tag name in readme.txt for easier future maintenance
 - move link in readme.txt at the end
 - add DEVELOPERS entry for defconfig
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  4 ++
 board/altera/agilex5/genimage.cfg                  | 27 +++++++++
 board/altera/agilex5/linux.fragment                |  4 ++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +
 board/altera/agilex5/patches/linux/linux.hash      |  2 +
 board/altera/agilex5/patches/uboot/uboot.hash      |  2 +
 board/altera/agilex5/readme.txt                    | 64 ++++++++++++++++++++++
 board/altera/agilex5/uboot.fragment                |  4 ++
 configs/socfpga_agilex5_vendor_defconfig           | 48 ++++++++++++++++
 9 files changed, 157 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index febf03773c..88443062df 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -904,6 +904,10 @@ N:	Dimitrios Siganos <dimitris@siganos.org>
 F:	package/bvi/
 F:	package/wireless-regdb/
 
+N:	Dinh Nguyen <dinguyen@kernel.org>
+F:	board/altera/
+F:	configs/socfpga_agilex5_vendor_defconfig
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
diff --git a/board/altera/agilex5/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/altera/agilex5/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..5a935a0d16
--- /dev/null
+++ b/board/altera/agilex5/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  59bed1328131f1eb1ee10f16c94d8f0bbf5600d7573d42d0cf987b8edffe2f6a  arm-trusted-firmware-QPDS26.1.1_REL_GSRD_PR-git4.tar.gz
diff --git a/board/altera/agilex5/patches/linux/linux.hash b/board/altera/agilex5/patches/linux/linux.hash
new file mode 100644
index 0000000000..d322ac26c7
--- /dev/null
+++ b/board/altera/agilex5/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  d8328683db0a6b43a96c18d7149b98a11138909ea50f2fa411339f93eb492571  linux-QPDS26.1.1_REL_GSRD_PR-git4.tar.gz
diff --git a/board/altera/agilex5/patches/uboot/uboot.hash b/board/altera/agilex5/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..51906e1d73
--- /dev/null
+++ b/board/altera/agilex5/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  a78bf187fde344297bea7d986f05996dfba94ea11d2d4dc706a78bcae543e175  uboot-QPDS26.1.1_REL_GSRD_PR-git4.tar.gz
diff --git a/board/altera/agilex5/readme.txt b/board/altera/agilex5/readme.txt
new file mode 100644
index 0000000000..5a9fe35ec6
--- /dev/null
+++ b/board/altera/agilex5/readme.txt
@@ -0,0 +1,64 @@
+Altera SoCFPGA Agilex 5 SoC Development Kit
+
+
+Intro
+=====
+
+This configuration builds a Linux system for the Agilex 5 SoC
+Development Kit (socfpga_agilex5_socdk) from the QPDS Golden System
+Reference Design component versions:
+
+  https://github.com/altera-fpga/linux-socfpga
+  https://github.com/altera-fpga/u-boot-socfpga
+  https://github.com/altera-fpga/arm-trusted-firmware
+
+The HPS first-stage bootloader is packaged by Quartus into the FPGA
+configuration file. This defconfig builds the software that the HPS loads
+after that: U-Boot (u-boot.itb, with TF-A BL31), the kernel Image, the
+socfpga_agilex5_socdk device tree, and a root filesystem.
+
+The socfpga_agilex5_vendor_defconfig supports the Agilex5 065B Premium
+development kit [1].
+
+
+Build
+=====
+
+    make socfpga_agilex5_vendor_defconfig
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
+
+[1] https://www.altera.com/products/devkit/po-3284/agilex-5-fpga-e-series-065b-premium-development-kit
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
diff --git a/configs/socfpga_agilex5_vendor_defconfig b/configs/socfpga_agilex5_vendor_defconfig
new file mode 100644
index 0000000000..f989403c69
--- /dev/null
+++ b/configs/socfpga_agilex5_vendor_defconfig
@@ -0,0 +1,48 @@
+BR2_cortex_a55=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/altera/agilex5/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

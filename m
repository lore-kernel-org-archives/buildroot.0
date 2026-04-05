Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C65EE9D800
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 20:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BA32605E8;
	Sun,  5 Apr 2026 20:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cr0KhIg2Rziv; Sun,  5 Apr 2026 20:05:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04894606B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775419508;
	bh=3vjomX3cRkTC2MGkgVbKj0kYxDwER9O291zNOE6f7DA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RQCLkikRX2dkhnG9i5mGmAop91/Sd6Wnt/1khVfkQCU03xSgAplr0ybercxI17KuT
	 5k8axYikmvaYHg/dEQdjYWS8w/0ntqndZhp5l1Uqrmn8fz+0F4lk/1PjWRq2UG+FoA
	 egEV/zK9Rw134wBTOJ15Gsdc2U4q8AWERFzvZQVxpI07LiGc59VTwfP6dc6+/W1Xr6
	 e/E5LAA8gYKK2rkizkmkmKfa/6yLkHiMMuleFMRRCqFEumsfdFCQWn/kZXGuW2gTL9
	 /jszJEgquBCElcAdV/9zCBMVqHZWE21TZLfjTSCAnhMMckE5MuNwU9dQnL3KZ0Wmic
	 dePfH/0IWttag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04894606B6;
	Sun,  5 Apr 2026 20:05:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CAD481EB
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 20:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B05FB606B6
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 20:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmcjoEw447TN for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 20:05:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E667605E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E667605E8
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 20:05:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B88A80403; Sun,  5 Apr 2026 20:05:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Apr 2026 22:00:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd017ee7545ffc89cea8ec0c35b96ff94c533276
X-Git-Newrev: bfc1cde65b6574ffb6ed343ec525775bc577c354
X-Patchwork-Hint: ignore
Message-Id: <20260405200505.0B88A80403@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ti_tda4vm_sk: new defconfig
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bfc1cde65b6574ffb6ed343ec525775bc577c354
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add support to Texas Instruments j721e starter kit, also called
TDA4VM-SK.

https://www.ti.com/tool/SK-TDA4VM

Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
Tested-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
[Julien:
 - reword commit log title
 - regenerate defconfig with "make savedefconfig"
 - fix typo in readme.txt
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/ti/tda4vm-sk/extlinux.conf                   |  5 +++
 board/ti/tda4vm-sk/genimage.cfg                    | 33 ++++++++++++++
 board/ti/tda4vm-sk/patches/linux/linux.hash        |  2 +
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash   |  2 +
 board/ti/tda4vm-sk/patches/uboot/uboot.hash        |  2 +
 board/ti/tda4vm-sk/post-build.sh                   |  5 +++
 board/ti/tda4vm-sk/readme.txt                      | 36 ++++++++++++++++
 configs/ti_tda4vm_sk_defconfig                     | 50 ++++++++++++++++++++++
 8 files changed, 135 insertions(+)

diff --git a/board/ti/tda4vm-sk/extlinux.conf b/board/ti/tda4vm-sk/extlinux.conf
new file mode 100644
index 0000000000..582d510b5d
--- /dev/null
+++ b/board/ti/tda4vm-sk/extlinux.conf
@@ -0,0 +1,5 @@
+default buildroot
+label buildroot
+   kernel /Image
+   devicetreedir /
+append root=/dev/mmcblk1p2 rootwait rw console=ttyS2,115200n8
diff --git a/board/ti/tda4vm-sk/genimage.cfg b/board/ti/tda4vm-sk/genimage.cfg
new file mode 100644
index 0000000000..b5ba2d21db
--- /dev/null
+++ b/board/ti/tda4vm-sk/genimage.cfg
@@ -0,0 +1,33 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"sysfw.itb",
+			"tiboot3.bin",
+			"tispl.bin",
+			"u-boot.img",
+			"Image",
+			"ti",
+			"extlinux",
+		}
+
+		label = "boot"
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
diff --git a/board/ti/tda4vm-sk/patches/linux/linux.hash b/board/ti/tda4vm-sk/patches/linux/linux.hash
new file mode 100644
index 0000000000..eb4dcee958
--- /dev/null
+++ b/board/ti/tda4vm-sk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  4f21c01f4d04c1d1b3ed794153f8900802c92497be620b07c4869530f2d28ee3  linux-6.18.16.tar.xz
diff --git a/board/ti/tda4vm-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/tda4vm-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/ti/tda4vm-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/ti/tda4vm-sk/patches/uboot/uboot.hash b/board/ti/tda4vm-sk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/ti/tda4vm-sk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/ti/tda4vm-sk/post-build.sh b/board/ti/tda4vm-sk/post-build.sh
new file mode 100755
index 0000000000..8dae08a47c
--- /dev/null
+++ b/board/ti/tda4vm-sk/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$BINARIES_DIR"/extlinux/extlinux.conf
diff --git a/board/ti/tda4vm-sk/readme.txt b/board/ti/tda4vm-sk/readme.txt
new file mode 100644
index 0000000000..b3e789be80
--- /dev/null
+++ b/board/ti/tda4vm-sk/readme.txt
@@ -0,0 +1,36 @@
+Texas Instruments SK-TDA4VM Test and Development Board
+
+Description
+===========
+
+This configuration will build a complete image for the TI SK-TDA4VM
+board: https://www.ti.com/tool/SK-TDA4VM
+
+How to Build
+============
+
+Select the default configuration for the target:
+
+$ make ti_tda4vm_sk_defconfig
+
+Optional: modify the configuration:
+
+$ make menuconfig
+
+Build:
+
+$ make
+
+To copy the resultimg output image file to an SD card use dd:
+
+$ dd if=output/images/sdcard.img of=/dev/sdX bs=1M
+
+How to Run
+==========
+
+Insert the SD card into the SK-TDA4VM board, and power it up through the
+USB Type-C connector. The system should come up. You can use a
+micro-USB cable to connect to the connector labeled UART to
+communicate with the board.
+
+User's guide : https://www.ti.com/lit/ug/spruj21e/spruj21e.pdf
diff --git a/configs/ti_tda4vm_sk_defconfig b/configs/ti_tda4vm_sk_defconfig
new file mode 100644
index 0000000000..3da0fe77b2
--- /dev/null
+++ b/configs/ti_tda4vm_sk_defconfig
@@ -0,0 +1,50 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/ti/tda4vm-sk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/tda4vm-sk/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/tda4vm-sk/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.16"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-j721e-sk"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="generic"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_PLATFORM="k3-j721e"
+BR2_TARGET_TI_K3_R5_LOADER=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="j721e_evm_r5"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="j721e_evm_a72"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_RAW_BIN=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="tispl.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

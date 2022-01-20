Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F855C433EF
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 18:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E97044074E;
	Thu, 20 Jan 2022 18:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EovGte5I7iM9; Thu, 20 Jan 2022 18:50:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CEDF40477;
	Thu, 20 Jan 2022 18:50:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D307B1BF366
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 18:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD3AF41620
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 18:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8wk-A0-ViMvp for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 18:50:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F496415A7
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 18:50:52 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id o12so25088615lfu.12
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 10:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rhSSe1r/70/vc64miCqizon6jvx1SfXZq9BbHiA2wK0=;
 b=ASGU+ZW/Gp1M1N5FW9g1vc46Fyuo6o/+ayS4HZOV1xcL94JPncyU4uoqpwkX0GSjWS
 IZCYH79k47k2ZDCZNjUvVxojWtXnNzDDP+jb482ekSlYsLMY5V8VZTyRf/w0IkUohbfY
 SmEPLrf1hNdXoJaqFjtKoaqgfzo0NvMXXsue4clE6WlsDLFrkbda1LJ0BhqqVOlehm0y
 HM/eafzuHFSr/pMWJs1K2wkO7bhzS5Xfow9X1uPuJv2o65zbHna78W3/30dEk3WfCk9Q
 QdWfhtHY4Sc7kx7QQbVULCx9ucsw/RL23oZXzR2jxGGl1RxhBREMWGUPhy21KmffTuGh
 kDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rhSSe1r/70/vc64miCqizon6jvx1SfXZq9BbHiA2wK0=;
 b=jSwpAJyzpgWuT/Jgdm1Mcvblm2KDADeTfJCeEgvPJHOsBxAmGS59Ts7fcKfmr3qDOx
 S0pPsB2JZm+TzeVvVawvR0qWiHtCurat9ubBsatY6C/Z59eqnlO75X64ejKRxa82J3eM
 Qo5aeH7r9NTYqvrKgwz7ioO3M1FtC7jfr1MURzdVTHKT95daWHs3MMya9pB5QuZxcugy
 XHsINjjLvlEAD1yWjlimmgUl/YwPC2LUPBW/CAKY+jQ9xOqp8V5c9YqrhoXWDr2BhlrN
 0M8YFUkGmmyzi+ZREHC6pbCe6ZeR/OUnKUVuyMT6IZ6ZhbAC9ng6OwrLhZivu95Uka2k
 bmZA==
X-Gm-Message-State: AOAM533OtiImuT7GMJz82I7VYXMHKD6YTCkoMaOKH2nwIpIOJOBxt96U
 H0UaQZz957195p+tRo/qIR/XyyE7yyQ=
X-Google-Smtp-Source: ABdhPJxef7Bj94LKn6P2oSeIEDEFaZXgyIC9DTy5Ctayb2yYVHbDZTt1BCmj3xoTRjdRhlpgA2RRaQ==
X-Received: by 2002:ac2:4eca:: with SMTP id p10mr437102lfr.204.1642704650029; 
 Thu, 20 Jan 2022 10:50:50 -0800 (PST)
Received: from hellfire.local ([178.155.5.204])
 by smtp.gmail.com with ESMTPSA id q22sm340416ljj.130.2022.01.20.10.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 10:50:49 -0800 (PST)
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 20 Jan 2022 21:50:43 +0300
Message-Id: <20220120185043.7745-1-kuzminov.sergey81@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] board/orangepi/orangepi-zero: bump Linux and
 U-Boot versions
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v1:
- Linux: bump to version 5.12.19 (from 5.12.2).
- U-Boot: bump to version 2022.01 (from 2021.04).
- Added fast_commit for ext4. When creating a file system with this option, writing speeds up twice in some cases: https://lwn.net/Articles/834483/
- Refactoring configs/orangepi_zero_defconfig.
- Switched to extlinux.
- Createed common scenarios for multiple boards to create an SD image: board/orangepi/common.

v2:
- Linux: bump to version 5.16.1 (from 5.12.19) thanks to a patch from Giulio for xr819-xradio (link below).
- Added in genimage.cfg: partition rootfs {offset = 1M} to prevent possible alignment error.
- Added BR2_ARM_EABIHF=y to make it visible in the config file, previously added implicitly.
- Replaced BR2_ARM_FPU_VFPV4 with BR2_ARM_FPU_NEON_VFPV4 because processor supports it.
- Deleted BR2_GCC_ENABLE_LTO=y, added by mistake.

v3:
- Changed the name of the patch (from board/orangepi/orangepi-zero:extlinux, refactoring).
- Linux: bump to version 5.16.2 (from 5.16.1).
- Returned (# BR2_TARGET_ROOTFS_TAR is not set) instead of (BR2_TARGET_ROOTFS_TAR=n), added in v1.
- Renamed file uboot-extras.config -> uboot-extras.fragment.
- Renamed file linux-extras.config -> linux-extras.fragment.
- Deleted (#BR2_ARM_INSTRUCTIONS_THUMB2=y), added in v2.

Patch required to work:
https://patchwork.ozlabs.org/project/buildroot/patch/20220118063531.2039729-1-giulio.benetti@benettiengineering.com/

Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
---
 board/orangepi/common/extlinux.conf           |  5 ++
 board/orangepi/common/genimage.cfg            | 20 ++++++
 board/orangepi/common/post-build.sh           | 34 ++++++++++
 board/orangepi/common/uboot-extras.fragment   |  3 +
 board/orangepi/orangepi-zero/boot.cmd         |  9 ---
 board/orangepi/orangepi-zero/genimage.cfg     | 36 ----------
 ...ux-extras.config => linux-extras.fragment} |  0
 configs/orangepi_zero_defconfig               | 68 +++++++++++--------
 8 files changed, 103 insertions(+), 72 deletions(-)
 create mode 100644 board/orangepi/common/extlinux.conf
 create mode 100644 board/orangepi/common/genimage.cfg
 create mode 100755 board/orangepi/common/post-build.sh
 create mode 100644 board/orangepi/common/uboot-extras.fragment
 delete mode 100644 board/orangepi/orangepi-zero/boot.cmd
 delete mode 100644 board/orangepi/orangepi-zero/genimage.cfg
 rename board/orangepi/orangepi-zero/{linux-extras.config => linux-extras.fragment} (100%)

diff --git a/board/orangepi/common/extlinux.conf b/board/orangepi/common/extlinux.conf
new file mode 100644
index 0000000000..015f29270e
--- /dev/null
+++ b/board/orangepi/common/extlinux.conf
@@ -0,0 +1,5 @@
+LABEL default
+  kernel /boot/%LINUXIMAGE%
+  devicetreedir /boot
+  append root=PARTUUID=%PARTUUID% rootwait console=${console}
+# append root=PARTUUID=%PARTUUID% rootwait console=${console} rootfstype=ext4 quiet panic=10
diff --git a/board/orangepi/common/genimage.cfg b/board/orangepi/common/genimage.cfg
new file mode 100644
index 0000000000..8b80ffb138
--- /dev/null
+++ b/board/orangepi/common/genimage.cfg
@@ -0,0 +1,20 @@
+image sdcard.img {
+	hdimage {
+		partition-table-type = gpt
+		gpt-no-backup = true
+		gpt-location = 1008K # 1MB - 16KB
+	}
+
+	partition u-boot {
+		in-partition-table = false
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1000K # 1MB - 8KB - 16KB
+	}
+
+	partition rootfs {
+		offset = 1M
+		image = "rootfs.ext4"
+		partition-uuid = %PARTUUID%
+	}
+}
diff --git a/board/orangepi/common/post-build.sh b/board/orangepi/common/post-build.sh
new file mode 100755
index 0000000000..296f94b174
--- /dev/null
+++ b/board/orangepi/common/post-build.sh
@@ -0,0 +1,34 @@
+#!/bin/sh
+
+linux_image()
+{
+	if grep -Eq "^BR2_LINUX_KERNEL_UIMAGE=y$" ${BR2_CONFIG}; then
+		echo "uImage"
+	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGE=y$" ${BR2_CONFIG}; then
+		echo "Image"
+	elif grep -Eq "^BR2_LINUX_KERNEL_IMAGEGZ=y$" ${BR2_CONFIG}; then
+		echo "Image.gz"
+	else
+		echo "zImage"
+	fi
+}
+
+generic_getty()
+{
+	if grep -Eq "^BR2_TARGET_GENERIC_GETTY=y$" ${BR2_CONFIG}; then
+		echo ""
+	else
+		echo "s/\s*console=\S*//"
+	fi
+}
+
+PARTUUID="$($HOST_DIR/bin/uuidgen)"
+
+install -d "$TARGET_DIR/boot/extlinux/"
+
+sed -e "$(generic_getty)" \
+	-e "s/%LINUXIMAGE%/$(linux_image)/g" \
+	-e "s/%PARTUUID%/$PARTUUID/g" \
+	"board/orangepi/common/extlinux.conf" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
+
+sed "s/%PARTUUID%/$PARTUUID/g" "board/orangepi/common/genimage.cfg" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/orangepi/common/uboot-extras.fragment b/board/orangepi/common/uboot-extras.fragment
new file mode 100644
index 0000000000..5aa97523d9
--- /dev/null
+++ b/board/orangepi/common/uboot-extras.fragment
@@ -0,0 +1,3 @@
+CONFIG_BOOTDELAY=0
+CONFIG_USE_PREBOOT=y
+CONFIG_PREBOOT="setenv preboot;"
diff --git a/board/orangepi/orangepi-zero/boot.cmd b/board/orangepi/orangepi-zero/boot.cmd
deleted file mode 100644
index d094a64fe5..0000000000
--- a/board/orangepi/orangepi-zero/boot.cmd
+++ /dev/null
@@ -1,9 +0,0 @@
-setenv fdt_high ffffffff
-
-part uuid mmc 0:2 uuid
-setenv bootargs console=ttyS0,115200 root=PARTUUID=${uuid} rootwait
-
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun8i-h2-plus-orangepi-zero.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-zero/genimage.cfg b/board/orangepi/orangepi-zero/genimage.cfg
deleted file mode 100644
index 32f5454ae6..0000000000
--- a/board/orangepi/orangepi-zero/genimage.cfg
+++ /dev/null
@@ -1,36 +0,0 @@
-# Minimal SD card image for the OrangePi Zero
-#
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun8i-h2-plus-orangepi-zero.dtb",
-			"boot.scr"
-		}
-	}
-	size = 10M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8K
-		size = 1016K # 1MB - 8KB
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-		size = 512M
-	}
-}
diff --git a/board/orangepi/orangepi-zero/linux-extras.config b/board/orangepi/orangepi-zero/linux-extras.fragment
similarity index 100%
rename from board/orangepi/orangepi-zero/linux-extras.config
rename to board/orangepi/orangepi-zero/linux-extras.fragment
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index 1c107b10e6..430d38af3e 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -1,49 +1,63 @@
+# Architecture
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV4=y
+BR2_ARM_EABIHF=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# System
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
+BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
-BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
-BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
 BR2_SYSTEM_DHCP="eth0"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.2"
-BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.config"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-# BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero/boot.cmd"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/orangepi/common/uboot-extras.fragment"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.fragment"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="63M"
+BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O ^64bit,fast_commit"
+BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Image
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-zero/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_GENIMAGE=y
 
-# wireless driver and firmware
+# Wireless driver and firmware
 BR2_PACKAGE_XR819_XRADIO=y
 BR2_PACKAGE_ARMBIAN_FIRMWARE=y
 BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819=y
 
-# wireless support
+# Wireless support
 BR2_PACKAGE_IW=y
 BR2_PACKAGE_WIRELESS_TOOLS=y
 BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
@@ -51,5 +65,5 @@ BR2_PACKAGE_WPA_SUPPLICANT=y
 BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
 BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
 
-# spi flash support
+# Spi flash support
 BR2_PACKAGE_MTD=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

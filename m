Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD445C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 23:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6101A60AC6;
	Sat,  5 Feb 2022 23:29:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ik2Wp82YmdBP; Sat,  5 Feb 2022 23:29:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64A0760804;
	Sat,  5 Feb 2022 23:29:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD2BC1BF863
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 23:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AE4281497
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 23:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t0ZaUZww5S9r for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 23:29:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B52481495
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 23:29:40 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id t7so14094500ljc.10
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 15:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w1G1wEzMHXLl77yqibUPAoOoFjfXlYOnkVIkC46Iez8=;
 b=bNhfsPcGZNExQY82vIWDeOQfRZYScBmvkTeS1xjrPaS1O8HjWqiFS3figwg2vehOht
 vjFzoZl0/bOPnvdqG8zSP84nKqLzXe6krLHR36LeT001M8Ui74I0MBM0I+oCwV/BqhkH
 86hXMObeo/SnzsVAY7mpoBu62IhsBLoxU8QgRDdaE1WSysVHGPm4nkxyBx7vM0c75xSg
 2gI4GIxmVLv9gfkfsjWivJ2iitHQmbqQ8JWOoqhrDgT5wFUGV4RgF2Ahl71cdJLackaf
 jySfKCn0FHfSLqFPHWFB6CyDHKOCgjipfwGrFqs0awpF+0xc6heIjfChAmi7kkvg+yUT
 2UPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w1G1wEzMHXLl77yqibUPAoOoFjfXlYOnkVIkC46Iez8=;
 b=gFBjV+zaBth5Tf95Q339x71fYcbxnt97QxZLGYAqEM4z5bZsNkr60OctZDIjYdMJyk
 Wm5EAhL3YzKB0ibEQVrrlouVDI8BK0gkQNrhkh9UUw+7rBDXwJVvG1BiejL71EKz98ck
 4rbaU+GOzc/NQM8BgZVeCe4xssMS/709mvSzHZ/f2sYGju4ZwsE3BD88BMIVSl+X9I8G
 s2lveM01bw0HhKNQ/leny0+lV5jaog6daXKCqPrUsm3WgngGRQTPEj1voww6Iz9Xogee
 C0Ij6VhhuUPHFxnkJTOIdov77GZVYyyCoucPMldPJxAO35qy23OENh+x4vh7lPGtfnj0
 W3MQ==
X-Gm-Message-State: AOAM531IYMaJmb1FbJMw28EvYbYaHINDlVVdXPi4GbXNkBaBZ7ShAbDv
 JHWddDh9w3ZNEiiiz/AomwoeC+ZG76I=
X-Google-Smtp-Source: ABdhPJww3kFymu/PzMcHHFA3G2VSk5LXfoMx2honh532HZOmBPBLS3T4mCIFEEhkH6ogoRyKadO3iQ==
X-Received: by 2002:a2e:2416:: with SMTP id k22mr3997756ljk.377.1644103778251; 
 Sat, 05 Feb 2022 15:29:38 -0800 (PST)
Received: from hellfire.local ([178.155.5.31])
 by smtp.gmail.com with ESMTPSA id p16sm927678ljn.55.2022.02.05.15.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 15:29:37 -0800 (PST)
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 02:29:18 +0300
Message-Id: <20220205232918.27091-1-kuzminov.sergey81@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] configs/orangepi_zero_defconfig: switch to
 extlinux
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

Changes:
* Exclude FAT partition, it is no longer needed for U-Boot.
* Switch the rootfs partition from MBR to GPT for partition-uuid to work.
* Switch to extlinux, this is convenient for debugging.
* Create common scenarios for multiple boards to create an SD image: board/orangepi/common.
* Add BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y, remount root filesystem read-write during boot.
---
V1->V2:
* improved commit log
* removed commented line in extlinux.conf
* removed one boot option from extlinux.conf

V2->V3:
* improved commit log
* removed comment from board/orangepi/common/genimage.cfg

Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
---
 board/orangepi/common/extlinux.conf       |  4 +++
 board/orangepi/common/genimage.cfg        | 20 +++++++++++++
 board/orangepi/common/post-build.sh       | 34 +++++++++++++++++++++
 board/orangepi/orangepi-zero/boot.cmd     |  9 ------
 board/orangepi/orangepi-zero/genimage.cfg | 36 -----------------------
 configs/orangepi_zero_defconfig           | 11 ++++---
 6 files changed, 63 insertions(+), 51 deletions(-)
 create mode 100644 board/orangepi/common/extlinux.conf
 create mode 100644 board/orangepi/common/genimage.cfg
 create mode 100755 board/orangepi/common/post-build.sh
 delete mode 100644 board/orangepi/orangepi-zero/boot.cmd
 delete mode 100644 board/orangepi/orangepi-zero/genimage.cfg

diff --git a/board/orangepi/common/extlinux.conf b/board/orangepi/common/extlinux.conf
new file mode 100644
index 0000000000..12f496b1fa
--- /dev/null
+++ b/board/orangepi/common/extlinux.conf
@@ -0,0 +1,4 @@
+LABEL default
+  kernel /boot/%LINUXIMAGE%
+  devicetreedir /boot
+  append root=PARTUUID=%PARTUUID% rootwait console=${console} rootfstype=ext4 quiet panic=10
diff --git a/board/orangepi/common/genimage.cfg b/board/orangepi/common/genimage.cfg
new file mode 100644
index 0000000000..a61c4a039f
--- /dev/null
+++ b/board/orangepi/common/genimage.cfg
@@ -0,0 +1,20 @@
+image sdcard.img {
+	partition u-boot {
+		in-partition-table = false
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1000K # 1MB - 8KB(offset) - 16KB(GPT)
+	}
+
+	hdimage {
+		partition-table-type = gpt
+		gpt-location = 1008K # 1MB - 16KB(GPT)
+		gpt-no-backup = true
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
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index 5aaa1566c5..96f0c3f600 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -20,10 +20,13 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="63M"
+BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Bootloader
@@ -39,16 +42,12 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 
 # Required tools to create the SD image
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero/boot.cmd"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
 
 # Image
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-zero/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 
 # Wireless driver and firmware
 BR2_PACKAGE_XR819_XRADIO=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0D9C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 15:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 994354069B;
	Sun,  5 May 2024 15:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytbx61zocVF2; Sun,  5 May 2024 15:31:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1582840724
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1582840724;
	Sun,  5 May 2024 15:31:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B25D91BF82D
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 15:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC67C400B8
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 15:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0WHng1DOTiaY for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 15:31:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B2E4400A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B2E4400A6
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B2E4400A6
 for <buildroot@buildroot.org>; Sun,  5 May 2024 15:31:10 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2dcc8d10d39so12584021fa.3
 for <buildroot@buildroot.org>; Sun, 05 May 2024 08:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714923067; x=1715527867;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8GXrOveB6tgE/XfHZrHUAPWWLHzcs5bBwwlgfesR2yI=;
 b=J9WrQv/3BpEu3i4elfTtoOz5nKXR4kECJaJ/ffOxz+IEefE/NFae0ob/a2If9YYFyg
 s9e/GBrfKqWStZgTVPvUPqzrim2+XD+G2PQW7R3RG0mORDsSSMHnYNRO0tuGanTAyNBP
 BE/w1fsbpUHIhlG7HUPfR4ZeCV2qpZiknTtcWutyScqHBU65ySyFueOCC/IYPaFsrJUQ
 VhS+xfS5AFOZMckoJt6MqtCRwY5yX73HW0DG91+oa/xS05jIkidLh5+qvuLBFJGuCoSa
 eqVA3+QispoDAMzFYrzobzeckjoelxRKqSZnh2kJ5KKUnaenSbXZb+mRb6T9GgrC36uv
 MesQ==
X-Gm-Message-State: AOJu0YwrCJ70XkSyjuBDvl+zR3JU/4FvOWVw/nOceDKaGv+ZSoV9iEMS
 842ZoJIii7A99Sr1eorTx+nRrKEYWNvF3SNyROnhazVlVjxVCUyBcd9blg==
X-Google-Smtp-Source: AGHT+IG68Zaxf3+LwImBTtJ9uzMzamvB6KoFAICOxR4o/vB6nfbTg2nEgDaHk6H9Z6LYm7otvK0f6A==
X-Received: by 2002:a2e:9d8c:0:b0:2df:1f7c:b84 with SMTP id
 c12-20020a2e9d8c000000b002df1f7c0b84mr5147201ljj.6.1714923067098; 
 Sun, 05 May 2024 08:31:07 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 r8-20020a2e80c8000000b002da080a84cfsm1185766ljg.23.2024.05.05.08.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 08:31:06 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 May 2024 18:30:54 +0300
Message-ID: <20240505153103.2031941-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714923067; x=1715527867; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8GXrOveB6tgE/XfHZrHUAPWWLHzcs5bBwwlgfesR2yI=;
 b=e0lJlG7QQbzJ2UNd5WC2Rhh24+WLqtOOAijLZTEwmdOVaFchAsaz/mh+N7YKs9isAp
 ewdy2O6MORbiTeEhXO5UYtc2lPZljTcfl19b3ngPfgL8pqvBH/yi6BpKEdn2JxvCZb7d
 9X1YW1u+Ri1t98t9jfRaU+GQoAMt9h/gLJxg5wl9kB7AfaLxvdpZIKYNGkihD0GqgBov
 hzsT4F6fFMd14mZVe0vDHBrA0l9KzZZaVxAmiQbd1Q5vkF0rZAQhWoR2Aa+AeJcezrxW
 +Ty2Km1zoRDBLJCPOCCCYG5OvA2tnlt0e7VPBEMpEX0EYQvS37GV6qLHwDMi86OmU/X3
 jCEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=e0lJlG7Q
Subject: [Buildroot] [PATCH 1/1] configs/orangepi_zero2w: new board
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds basic support for the new OrangePi Zero2W board:
- http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Zero-2W.html

Brief summary of the board features:
- H618 Allwinner SoC
  - Quad-Core ARM Cortex-A53 Processor 1.5GHz
  - Mali G31 MP2 GPU
- LPDDR4: 1GB/2GB/4GB
- Wi-Fi5.0+BT 5.0
- 2x Type-C USB 2.0
- 1x Mini HDMI
- Wi-Fi 5.0 + BT 5.0
- 40-pin expansion interface (GPIO / UART / I2C / SPI / PWM)
- 24-pin expansion interface (2x USB 2.0 / ETH / IR / audio)

BSP includes the following components:
- mainline ATF v2.10
- mainline U-Boot v2024.04
- mainline Linux kernel v6.8

No custom scripts required: all is covered by common orangepi scripts.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 DEVELOPERS                                |  1 +
 board/orangepi/orangepi-zero2w/readme.txt | 32 +++++++++++++
 configs/orangepi_zero2w_defconfig         | 55 +++++++++++++++++++++++
 3 files changed, 88 insertions(+)
 create mode 100644 board/orangepi/orangepi-zero2w/readme.txt
 create mode 100644 configs/orangepi_zero2w_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index c2d3f52a59..b442b2172f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2805,6 +2805,7 @@ F:	configs/orangepi_one_defconfig
 F:	configs/orangepi_pc_plus_defconfig
 F:	configs/orangepi_zero_defconfig
 F:	configs/orangepi_zero_plus2_defconfig
+F:	configs/orangepi_zero2w_defconfig
 F:	package/armbian-firmware/
 F:	package/hostapd/
 F:	package/rtl8189fs/
diff --git a/board/orangepi/orangepi-zero2w/readme.txt b/board/orangepi/orangepi-zero2w/readme.txt
new file mode 100644
index 0000000000..84796579da
--- /dev/null
+++ b/board/orangepi/orangepi-zero2w/readme.txt
@@ -0,0 +1,32 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the OrangePi Zero2W. Current configuration will
+bring-up the board and allow access through the serial console.
+
+Orangepi Zero 2W links:
+- http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Zero-2W.html
+- https://linux-sunxi.org/Xunlong_Orange_Pi_Zero2W
+
+How to build
+============
+
+    $ make orangepi_zero2w_defconfig
+    $ make
+
+Note: you will need access to the internet to download the required sources.
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
+  $ sudo sync
+
+Insert the micro SDcard in your Orangepi Zero2W and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/orangepi_zero2w_defconfig b/configs/orangepi_zero2w_defconfig
new file mode 100644
index 0000000000..19a7fa7688
--- /dev/null
+++ b/configs/orangepi_zero2w_defconfig
@@ -0,0 +1,55 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_h616"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero2w"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h618-orangepi-zero2w"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero2W"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# host tools
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+
+# image scripts
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

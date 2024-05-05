Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56450C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 19:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55659400F1;
	Sun,  5 May 2024 19:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6J_I8KD1u1kw; Sun,  5 May 2024 19:54:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0613140151
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0613140151;
	Sun,  5 May 2024 19:54:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62A2F1BF3CE
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 19:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E892405BF
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 19:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5xqC5kQiXmN for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 19:54:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3EDD5405B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EDD5405B3
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3EDD5405B3
 for <buildroot@buildroot.org>; Sun,  5 May 2024 19:54:33 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2dac77cdf43so16960241fa.2
 for <buildroot@buildroot.org>; Sun, 05 May 2024 12:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714938871; x=1715543671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V00B5zS0hFTmIJubTA4oyf20sfOMbsrZ5SzboNwO4kY=;
 b=i3Ghu6bHkgznRPRZ7X0nV5QIvooi3hXVbTpPzsd5zAFaGVuv11IEAgWg36x+q69TgP
 1Y5eKX0CRUWhe3DQAQHPwUlDzmcL95nrK0Jqm9hCJzvsw5fFN/jEtxjZirDzNE9EyS23
 Py/awuFL6fk6cjg5SNh9jLiK8Lf88wM677c3uHjbs3cg5bAh0k62OdMl4pgCWfrVFZap
 Ukc2EVAm3E9CnwhEAuBNt3lQ1gzvoPOjB3nEmLyRZyS/NuPpGOqYOSVX6kOumnEItq3b
 4tqKAdZ58af12/BXXZ/lIggGFBT+ySKMnpd8JNToEDVL5fHJJlr5EAZkGCmpeIAUGxAf
 ECaQ==
X-Gm-Message-State: AOJu0Yzyl31KH5sqHPKCvkI3+Kc6d1OOa1/NWhm4V3pRypTsNYQd5mVL
 RrYWWcQuvJSqVVF2nbsJgaCfsVhPFVle5mXDadkV+9kJSxUw6Uo6jyxBtg==
X-Google-Smtp-Source: AGHT+IFJGeOqr1gOTzpybgwOaRB247HwkC7X0sbEfgQ2CEgq9vPKTUye53tzWHXONylLSiAYN161dA==
X-Received: by 2002:a2e:9f0b:0:b0:2e0:a39b:2b25 with SMTP id
 u11-20020a2e9f0b000000b002e0a39b2b25mr5374347ljk.48.1714938870851; 
 Sun, 05 May 2024 12:54:30 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 f21-20020a2ea0d5000000b002e123933dcbsm1316095ljm.120.2024.05.05.12.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 12:54:30 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 May 2024 22:54:19 +0300
Message-ID: <20240505195427.3622027-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714938871; x=1715543671; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V00B5zS0hFTmIJubTA4oyf20sfOMbsrZ5SzboNwO4kY=;
 b=hFkY5IfNeOQjtEtaYuJejFg+bqekXqe6t7fHb4Di9fi/BQNpLhihPt72u3sDzvE80O
 dstn+v1siBKqTUQWFfE+hNIk9CONIxV2VVghSHul+sGh5JpdexExGv6Pg1w9KcK9T2v7
 jX1uhHXLS7quVvyIn4opofhEKBcQHosN9TmIz+/+0GW3cECc+OtKhZU0ijcpJAW4QVLK
 Y2dcFi0pMcIgAqXKR+M0TZBVgL6+0jN2T4E0/65TLnPb6qNbQneAwwyqhydFB3v+W8F9
 Ttt9I4qDUKT4lhWRK/enStwt3TCsg5jS9pXraaEdEtojrCQUFWYBKqszev16NlExeBsh
 tPCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hFkY5IfN
Subject: [Buildroot] [PATCH v2 1/1] configs/orangepi_zero2w: new board
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Sergey Matyukevich <geomatsi@gmail.com>
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
However new option BR2_DOWNLOAD_FORCE_CHECK_HASHES requires checksums
for all the BSP components. They are added as board specific patches.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---

Changes v1 -> v2
 - added BR2_DOWNLOAD_FORCE_CHECK_HASHES
 - added custom hashes for BSP components as board specific patches

 DEVELOPERS                                    |  1 +
 .../arm-trusted-firmware.hash                 |  2 +
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../orangepi-zero2w/patches/linux/linux.hash  |  2 +
 .../orangepi-zero2w/patches/uboot/uboot.hash  |  2 +
 board/orangepi/orangepi-zero2w/readme.txt     | 32 ++++++++++
 configs/orangepi_zero2w_defconfig             | 58 +++++++++++++++++++
 7 files changed, 98 insertions(+)
 create mode 100644 board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/orangepi/orangepi-zero2w/patches/linux-headers/linux-headers.hash
 create mode 100644 board/orangepi/orangepi-zero2w/patches/linux/linux.hash
 create mode 100644 board/orangepi/orangepi-zero2w/patches/uboot/uboot.hash
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
diff --git a/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..c9d043c46f
--- /dev/null
+++ b/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
diff --git a/board/orangepi/orangepi-zero2w/patches/linux-headers/linux-headers.hash b/board/orangepi/orangepi-zero2w/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/orangepi/orangepi-zero2w/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/orangepi/orangepi-zero2w/patches/linux/linux.hash b/board/orangepi/orangepi-zero2w/patches/linux/linux.hash
new file mode 100644
index 0000000000..5a6f308c7b
--- /dev/null
+++ b/board/orangepi/orangepi-zero2w/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  9e723232d603ab45ebf043c34714c48f277ab195c29abcb8472f2a4c3a5a1995  linux-6.8.6.tar.xz
diff --git a/board/orangepi/orangepi-zero2w/patches/uboot/uboot.hash b/board/orangepi/orangepi-zero2w/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..97a2b4eaf9
--- /dev/null
+++ b/board/orangepi/orangepi-zero2w/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
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
index 0000000000..4d8f25f451
--- /dev/null
+++ b/configs/orangepi_zero2w_defconfig
@@ -0,0 +1,58 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero2w/patches"
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
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.6"
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

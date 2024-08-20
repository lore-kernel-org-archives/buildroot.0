Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF79FC5320E
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 19:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34FEA40B57;
	Tue, 20 Aug 2024 19:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtcnx_asyP4E; Tue, 20 Aug 2024 19:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B97D740B4C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B97D740B4C;
	Tue, 20 Aug 2024 19:19:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C86071BF378
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 19:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6CB7809E8
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 19:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RNFqhIGf0IzA for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 19:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CC78808A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CC78808A9
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CC78808A9
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 19:19:46 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-428e0d184b4so45432275e9.2
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 12:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724181584; x=1724786384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xVGV/B8PTUvixNicniFHDUa5NUQiML1+f4idEnddud0=;
 b=wWbDVF2xNGtleoy9rNlBVFQ5pFjZFbOZ/+soVyNySrCf5xHKJvXCRJuU8XeqLIFzEV
 ybYCWvccDOe3BS7lhU6dnyxgnX1CUVrwQV0A4WiFQge2eREybfnD70zr+zsfqfxRYuEZ
 2h2nwG7xUgauGrvfrZpHvTdR6Y2BoMsxESH704pqCCidE04U5EXIrmJ0yoFK1/f9/BZV
 B07Sug30zWHlffE1/hFW6PC6WaRUxGr2CsRMCIGVNdqOS5yeJx8LMQ3vGtnEuNEMd15q
 NItcqMPDCD+xyRn9MHCa+qOIKvprZIUPEu0tpp6gr5fbfAmgZ0HtMZw7QVd/TUA7BVtV
 9jjg==
X-Gm-Message-State: AOJu0Yz1g9PvCuooVbsmTupCo2BPnlGuLXGp44UZtWYcIYFcDW4r8SW4
 e7EyhttgsHMvWlKVpTLaA2nae9kpddNqDd878Y80/FFHTlgCmXIlnpvgjiKVFrj9SQF58aLTlE6
 FlnA=
X-Google-Smtp-Source: AGHT+IFa+AikZvbLRnnR4lP0PTj2fVeRNTnozYGPy+OK37QUDgU2E33sfpUAqcy6nZrfzHSIcZC/lg==
X-Received: by 2002:a05:600c:19c6:b0:427:9dad:17df with SMTP id
 5b1f17b1804b1-42abd11ccefmr2329885e9.12.1724181583803; 
 Tue, 20 Aug 2024 12:19:43 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.87])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3718983a184sm13763209f8f.14.2024.08.20.12.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 12:19:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 21:19:26 +0200
Message-ID: <20240820191927.2126281-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820191927.2126281-1-dario.binacchi@amarulasolutions.com>
References: <20240820191927.2126281-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724181584; x=1724786384;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xVGV/B8PTUvixNicniFHDUa5NUQiML1+f4idEnddud0=;
 b=DEdDIzRAkvGpPgZBlwqMhP7jT9AF5vt7y+f79E2F5aHt2r0tn9xpRjhjCGHndkpN9P
 yztfx/6Pt3fxLNbZTGq5Y3SUOOfH8S8DJe5pxX879leAZS4ASbAtjtiwSPJQyvna3lgm
 qWfY7OsFDLuIa+Ic9hQLyG8An2HOjhMZYpAJU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=DEdDIzRA
Subject: [Buildroot] [PATCH v2 2/3] configs/stm32f746_disco_sd: new defconfig
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
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit adds support for STM32F746G-DISCO board. The discovery kit is
a complete demonstration and development platform for STMicroelectronics
Arm Cortex-M7-core-based STM32F746NG.

Board support package includes the following components:
- mainline Linux kernel 5.15.165
- mainline U-Boot 2024.07
- default packages from buildroot

Link: https://www.st.com/en/evaluation-tools/32f746gdiscovery.html
Co-Developed-by: Waldemar Brodkorb <wbx@openadk.org>
Tested-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
 - Move Linux kernel from version 5.15.163 to 5.15.165.
 - Drop busybox-tiny.config and use package/busybox/busybox-minimal.config.
 - Remove the logo management.
 - Add the Tested-by tag.
 - Update the commit message

 DEVELOPERS                                    |  2 ++
 .../stm32f746-disco/extlinux.conf             |  4 +++
 .../stm32f746-disco/flash_sd.sh               | 22 +++++++++++++
 .../stm32f746-disco/genimage.cfg              | 27 ++++++++++++++++
 .../stm32f746-disco/linux.fragment            | 13 ++++++++
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../stm32f746-disco/patches/linux/linux.hash  |  2 ++
 .../stm32f746-disco/patches/uboot/uboot.hash  |  2 ++
 .../stm32f746-disco/post-build.sh             |  9 ++++++
 .../stm32f746-disco/readme.txt                | 31 +++++++++++++++++++
 configs/stm32f746_disco_sd_defconfig          | 31 +++++++++++++++++++
 11 files changed, 144 insertions(+)
 create mode 100644 board/stmicroelectronics/stm32f746-disco/extlinux.conf
 create mode 100755 board/stmicroelectronics/stm32f746-disco/flash_sd.sh
 create mode 100644 board/stmicroelectronics/stm32f746-disco/genimage.cfg
 create mode 100644 board/stmicroelectronics/stm32f746-disco/linux.fragment
 create mode 120000 board/stmicroelectronics/stm32f746-disco/patches/linux-headers/linux-headers.hash
 create mode 100644 board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
 create mode 100644 board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
 create mode 100755 board/stmicroelectronics/stm32f746-disco/post-build.sh
 create mode 100644 board/stmicroelectronics/stm32f746-disco/readme.txt
 create mode 100644 configs/stm32f746_disco_sd_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 45cc1cc48996..e8dc27f7ad47 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -785,10 +785,12 @@ F:	package/xinetd/
 
 N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
 F:	board/bsh/
+F:	board/stmicroelectronics/stm32f746-disco/
 F:	board/stmicroelectronics/stm32f769-disco/
 F:	configs/imx6ulz_bsh_smm_m2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
+F:	configs/stm32f746_disco_sd_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
 F:	package/sscep/
 F:	package/tinyinit/
diff --git a/board/stmicroelectronics/stm32f746-disco/extlinux.conf b/board/stmicroelectronics/stm32f746-disco/extlinux.conf
new file mode 100644
index 000000000000..bb79c0b412a2
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32f746-disco-buildroot
+  kernel /zImage
+  devicetree /stm32f746-disco.dtb
+  append console=ttySTM0,115200 root=/dev/mmcblk0p2 rw rootwait consoleblank=0 ignore_loglevel
diff --git a/board/stmicroelectronics/stm32f746-disco/flash_sd.sh b/board/stmicroelectronics/stm32f746-disco/flash_sd.sh
new file mode 100755
index 000000000000..4fe85448f984
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/flash_sd.sh
@@ -0,0 +1,22 @@
+#!/bin/bash
+
+if [ $# -eq 0 ]; then
+    OUTPUT_DIR=output
+else
+    OUTPUT_DIR=$1
+fi
+
+if ! test -d "${OUTPUT_DIR}" ; then
+    echo "ERROR: no output directory specified."
+    echo "Usage: $0 OUTPUT_DIR"
+    exit 1
+fi
+
+"${OUTPUT_DIR}"/host/bin/openocd -f board/stm32f746g-disco.cfg \
+  -c "init" \
+  -c "reset init" \
+  -c "flash probe 0" \
+  -c "flash info 0" \
+  -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin 0x08000000" \
+  -c "reset run" \
+  -c "shutdown"
diff --git a/board/stmicroelectronics/stm32f746-disco/genimage.cfg b/board/stmicroelectronics/stm32f746-disco/genimage.cfg
new file mode 100644
index 000000000000..6743d41972c0
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/genimage.cfg
@@ -0,0 +1,27 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"stm32f746-disco.dtb",
+			"extlinux"
+		}
+	}
+
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		partition-type = 0xC
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 32M
+	}
+}
diff --git a/board/stmicroelectronics/stm32f746-disco/linux.fragment b/board/stmicroelectronics/stm32f746-disco/linux.fragment
new file mode 100644
index 000000000000..625fdced9e8d
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/linux.fragment
@@ -0,0 +1,13 @@
+# CONFIG_PREEMPT is not set
+# CONFIG_MULTIUSER is not set
+# CONFIG_TIMERFD is not set
+CONFIG_SET_MEM_PARAM=y
+CONFIG_DRAM_BASE=0xC0000000
+CONFIG_DRAM_SIZE=0x01000000
+# CONFIG_GCC_PLUGINS is not set
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_BLK_DEV is not set
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_PROC_SYSCTL is not set
+# CONFIG_CRYPTO is not set
+CONFIG_RCU_TRACE=y
\ No newline at end of file
diff --git a/board/stmicroelectronics/stm32f746-disco/patches/linux-headers/linux-headers.hash b/board/stmicroelectronics/stm32f746-disco/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
new file mode 100644
index 000000000000..7f78b950f35c
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  a36dd3e82ceb634afded31f2656568f57c4d9c4b399859f298b18116df11c6fe  linux-5.15.165.tar.xz
diff --git a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..fe9b4f53dc63
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/board/stmicroelectronics/stm32f746-disco/post-build.sh b/board/stmicroelectronics/stm32f746-disco/post-build.sh
new file mode 100755
index 000000000000..2894ad851c66
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/post-build.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${BINARIES_DIR}"/extlinux/extlinux.conf
+
+# finalize the init script
+INIT_PATH="${TARGET_DIR}/sbin/init"
+sed -i "/^# Clear memory to reduce page fragmentation/d" "${INIT_PATH}"
+sed -i "/^echo 3 > \/proc\/sys\/vm\/drop_caches/d" "${INIT_PATH}"
diff --git a/board/stmicroelectronics/stm32f746-disco/readme.txt b/board/stmicroelectronics/stm32f746-disco/readme.txt
new file mode 100644
index 000000000000..4ac16da33132
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/readme.txt
@@ -0,0 +1,31 @@
+STM32F746-DISCO
+===================
+
+This tutorial describes how to use the predefined Buildroot
+configuration for the STM32F746-DISCO evaluation platform.
+
+Building
+--------
+
+  make stm32f746_disco_sd_defconfig
+  make
+
+Flashing
+--------
+
+  ./board/stmicroelectronics/stm32f746-disco/flash_sd.sh output/
+
+It will flash the U-boot bootloader.
+
+Creating SD card
+----------------
+
+Buildroot prepares an "sdcard.img" image in the output/images/ directory,
+ready to be dumped on a SD card. Launch the following command as root:
+
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout and its content, see the
+definition in board/stmicroelectronics/stm32f746-disco/genimage.cfg.
diff --git a/configs/stm32f746_disco_sd_defconfig b/configs/stm32f746_disco_sd_defconfig
new file mode 100644
index 000000000000..870dde318324
--- /dev/null
+++ b/configs/stm32f746_disco_sd_defconfig
@@ -0,0 +1,31 @@
+BR2_arm=y
+BR2_cortex_m7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f746-disco/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_INIT_TINYINIT=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32f746-disco/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f746-disco/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.165"
+BR2_LINUX_KERNEL_DEFCONFIG="stm32"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f746-disco/linux.fragment"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f746-disco"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f746-disco"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_OPENOCD=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

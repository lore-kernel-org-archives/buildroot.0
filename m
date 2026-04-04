Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E41E63FE5
	for <buildroot@archiver.kernel.org>; Sat,  4 Apr 2026 17:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB20B40B1A;
	Sat,  4 Apr 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uhof7AFrRZvi; Sat,  4 Apr 2026 17:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F08240B1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775324806;
	bh=gFokSrGyOrvbJY9o0enwa7Cw69xw76+zPv6TRk97mbA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=i5V+X8kt3mNFm7jFKlLn4trNatbdcc0PfcLqiJ0yiYhksitQSR/4yaWVI4ZD4FWWq
	 r0q0c6piW4pwHCiaEp2gqd6sNGttlvouQTBzTGVs7bByOkoEbHcvEXQqG8hR5Ytill
	 yMlNsUjdq40wYZg6M27/rvozTxE/zAKg0tiSecMCc69lZXIe+Ez39nj04EGdY65gtR
	 JJiCorULowS9+Und2sAxrS3JkqNcy4k+M4oRuB229JrS6hMqlmnWYekFsxkMAVP4Eu
	 ymlgZNDTeeoCf61KAwY2RojQkjJRSBtZx0xwC33mcqXp4FV0aXkQQGq+cj98FEbvJ2
	 LUFlhTcckkwMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F08240B1B;
	Sat,  4 Apr 2026 17:46:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B76DBF2
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 17:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D5C740B1A
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 17:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jv0kGiutCgOo for <buildroot@buildroot.org>;
 Sat,  4 Apr 2026 17:46:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=sofiane.hamam@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6420C40B15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6420C40B15
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6420C40B15
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 17:46:42 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488a29e6110so7354545e9.3
 for <buildroot@buildroot.org>; Sat, 04 Apr 2026 10:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775324801; x=1775929601;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zkeVpiXU0CS2JM0HlxIPGp58i/in2q6HR0uzX7EAGs0=;
 b=Re4odCGu4AuosGcDmSWHTzAmo9OXYI3bPAyaIelu4nEuef40JoZPAJurLG7MwWRLb8
 gSzwyGYZudC18T38X/3lbXRX3Upse2S2JQDVEbFKyN7HzCY9jD3kkmuQmuYT7DUg3W7w
 LSLphdFjXBOw6JkCuHTtxxxfu7/ZV0wVRjJjy3lbnLxQYVYfWLF77TSvFNuV5nKln+9k
 krnpOE0zhUdne0Z2rby/MBw18DHi8YH0m4KP9TtpTNqh/cCHGwthFWSxc/mMRibd8xRA
 H4IcKS7e+Ic9HA26fX8f75gzDnzonWeDrhxrGTmTzjg6baQXZJapvdy+3Y97e8KQnt2l
 tO9Q==
X-Gm-Message-State: AOJu0YzlpbgX4dMQFdkPek8l8dxHiHVEJvvYTAps5/rHR1j+2WDe7OdE
 VNP7Dmc6Kc/Ugw3bknIEI1GdaMEJFaQnCzSWQz3QQxJcwM2v+g5NakRJiVoXh+uVkmP4HA/+4kU
 oXUfnzbqm5g==
X-Gm-Gg: AeBDietnAucQTGritMLl/NnA6xq5AgPX4P5svSIeCH/lmgoOn03DkJ4Xi5fZciohmkO
 StkCZmrnQ/5dbx4Us4rxhz/9AaUnRDoNosErqtwPHI+6lYVq9Mhto1Pbg66XcCs2t9bxB6Vxu0Q
 WTK59vEdyc1F2G/IJTlqkr/bddqIfKJ43S+0gpMdPkmkeALMAjA5sJVUxbqR7R5SC6oL0v4DLY1
 ZYpiavUF3nLOFAC4lXqppTUuzvZ8m6rmkpXCGzJgjqMBQbZb0mp62L03rqC/b39oSFPQwVaWfHg
 HKvkvDdecMClUiy4EaEzQgh07/4AquotQ0spQ1/S82fd1aN4pDitRt/J9uEJumDugaNxZaw2q6t
 mi5gcWhWI/0axE4vDkWmOVi2phPvUvsfFMPsfONE0MmrwUsFH73mpz4LI7QcblSAUxrY5TvK85f
 p6ORf6tbXkIJceeb11W3b7bwBpx3eKT4Mwcirk4NIBKnHwbw==
X-Received: by 2002:a05:600c:3549:b0:483:64b4:79da with SMTP id
 5b1f17b1804b1-488997d5e84mr99577065e9.26.1775324800605; 
 Sat, 04 Apr 2026 10:46:40 -0700 (PDT)
Received: from FRSMI25-BPYTOP.. ([2a01:e0a:e88:c5f0:aff3:a553:225c:81be])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48899c00098sm70383605e9.3.2026.04.04.10.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Apr 2026 10:46:40 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bryan Brattlof <bb@ti.com>, Sofiane HAMAM <sofiane.hamam@smile.fr>,
 Romain NAOUR <romain.naour@smile.fr>
Date: Sat,  4 Apr 2026 19:46:24 +0200
Message-ID: <20260404174624.2027159-1-sofiane.hamam@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1775324801; x=1775929601; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zkeVpiXU0CS2JM0HlxIPGp58i/in2q6HR0uzX7EAGs0=;
 b=VpiuWUqnsv4H5i2X4mEEU/tWArDnRIrpw5axo4f612R6aEzYqihVNuLBRhGoxH1F0p
 jXLXqlFjVZNDioCB6oDHcwm9LVrlkwERGHyvJI0NEIOXB15v32ztTyCCGYWBBQteZDmO
 HD3DyT8SzrpSD2PMxpvIcHw6amrKak8P7zp2I=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=VpiuWUqn
Subject: [Buildroot] [PATCH 1/1] board/ti/tda4vm-sk : Add support for TI's
 tda4vm Starter-Kit board
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
From: Sofiane HAMAM via buildroot <buildroot@buildroot.org>
Reply-To: Sofiane HAMAM <sofiane.hamam@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support to Texas Instruments j721e starter kit, also called TDA4VM-SK.

https://www.ti.com/tool/SK-TDA4VM

Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
Tested-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
Reviewed-by: Romain NAOUR <romain.naour@smile.fr>
---
 board/ti/tda4vm-sk/extlinux.conf              |  5 ++
 board/ti/tda4vm-sk/genimage.cfg               | 33 ++++++++++++
 board/ti/tda4vm-sk/patches/linux/linux.hash   |  2 +
 .../ti-k3-r5-loader/ti-k3-r5-loader.hash      |  2 +
 board/ti/tda4vm-sk/patches/uboot/uboot.hash   |  2 +
 board/ti/tda4vm-sk/post-build.sh              |  5 ++
 board/ti/tda4vm-sk/readme.txt                 | 36 +++++++++++++
 configs/ti_tda4vm_sk_defconfig                | 50 +++++++++++++++++++
 8 files changed, 135 insertions(+)
 create mode 100644 board/ti/tda4vm-sk/extlinux.conf
 create mode 100644 board/ti/tda4vm-sk/genimage.cfg
 create mode 100644 board/ti/tda4vm-sk/patches/linux/linux.hash
 create mode 100644 board/ti/tda4vm-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
 create mode 100644 board/ti/tda4vm-sk/patches/uboot/uboot.hash
 create mode 100755 board/ti/tda4vm-sk/post-build.sh
 create mode 100644 board/ti/tda4vm-sk/readme.txt
 create mode 100644 configs/ti_tda4vm_sk_defconfig

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
index 0000000000..340456923f
--- /dev/null
+++ b/board/ti/tda4vm-sk/readme.txt
@@ -0,0 +1,36 @@
+Texas Instuments SK-TDA4VM Test and Development Board
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
index 0000000000..a8984de31f
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
+BR2_TARGET_UBOOT_USE_BINMAN=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_RAW_BIN=y
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

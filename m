Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3F0CD1296
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 10:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B997C4192B;
	Sun,  7 Apr 2024 10:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HW6y6qu2-_i5; Sun,  7 Apr 2024 10:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F44C41844
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F44C41844;
	Sun,  7 Apr 2024 10:35:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6EB21BF575
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A34D3608ED
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uy9go2R0ULRC for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 10:35:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 756CD608E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 756CD608E9
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 756CD608E9
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 10:35:21 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4165d03308fso2455835e9.2
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 03:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712486119; x=1713090919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DI8Q/eDHnJpHmmd1kFAUDFuU5sTGlCMn5rsk0KIclZU=;
 b=X/l4qmW0rNpJKgMDDqtNMoSPix2shEXVywJFwzb4rmOEVJVevi6PJyyFIbEqyOfeB4
 01pjjx3jjWZRH7J4NfyAUGGaXoeupxH6bxTdvtFxMIOYQqKX1P655dOGVmu7GGtJqjla
 gk0R8TAqKyzQ5YeA6sVED8ZJVHVHxCF87RePouElvKfu09PTw4YzlKHtJpJKhbZDRqdD
 jTvlf4v3f7YwA4OlH0A7VldnMBvxZ36s+zIa1v+JlmyG+5nGzzos8X3zwkoTuJbvEo1M
 PsOggQirRxtHgz+zDQQz1jPXiNBLO+zEaUA/VwYkSOhaEaSUARjCBuWeHqJM7p1mUHib
 tGiw==
X-Gm-Message-State: AOJu0Yy1MHGRtcU+kVV5DVCNAP/Oj6AIiVxIfluCVxu7Ih2JFMshFM9N
 mxW92D7CIyWrg3pwJabBLN3Ytx8d5yxFIWNe5jUoQGBSMq0IojbgeGFYz/edFR6YlO7fLegsMeL
 K
X-Google-Smtp-Source: AGHT+IHu3y1JI8FH8fRyaHdcBvUbzyFeeugVD2ltYRlefUDm3L+NciJexpWjRy8IKlzc4VEJ//ZjhA==
X-Received: by 2002:a05:600c:3146:b0:416:4a4a:8cc9 with SMTP id
 h6-20020a05600c314600b004164a4a8cc9mr2067641wmo.27.1712486119354; 
 Sun, 07 Apr 2024 03:35:19 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b004149536479esm9486542wmb.12.2024.04.07.03.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 03:35:19 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 12:35:00 +0200
Message-ID: <20240407103512.1112712-8-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240407103512.1112712-1-romain.naour@smile.fr>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712486119; x=1713090919;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DI8Q/eDHnJpHmmd1kFAUDFuU5sTGlCMn5rsk0KIclZU=;
 b=uZjVtEsgo5Oje4b54zzVpZ8ZkBuhM/PpU68C8V5BpzDSfnJ6HOuusRdaHyTKfQzdug
 O3Z87hTqsoDxjzXNSoXKLYZ2lHpIPHv/ZhCxeM9REbN0h9xKg3jcto8mE+Cvcu+5IExM
 E3ok3boCz7eWHUeJdHDlKi/HewDLLB4dD6ZHib3JnEGl4UGqOCOiU5VIG67neeRhPSq7
 SKUFqCvRUTLZ1YFAOAyUAmLmO1jn0b2xB3r+BdnYVNC0uJ2J3+4wP+pW5LNAeYSBb7nz
 Ov3giRct+T+h+4/4GdYK6SCRlbTpGGwG2USox86yEXHfZPA7EurQURodX2OmvpWd/ud1
 fkFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=uZjVtEsg
Subject: [Buildroot] [PATCH v12 07/16] configs/ti_am62x_sk_defconfig: bump
 U-Boot version to 2024.01
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

The 2024.01 version of U-Boot for the am62x-sk board has introduced two
major changes:
- The device tree k3-am625-sk.dtb is no longer searched in /boot, but in
  /boot/dtb/ti. Hence, the disabling of BR2_LINUX_KERNEL_INSTALL_TARGET
  and the use of extlinux.conf for the proper loading of the device tree.
  Furthermore, the parameter BR2_ROOTFS_POST_SCRIPT_ARGS was used to
  auto-generate the extlinux.conf file so that developers can change the
  kernel loading options by modifying the .config.
- U-Boot is capable of building tiboot3.bin using Binman. So it's no longer
  necessary to use custom tools like ti-k3-image-gen.
- Use a custom tiboot3.bin since the default is "hs-fs",
  but the ti_am62x_sk_defconfig expect the "gp" one

Tested on SK-AM62B-P1.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Changes in v12:
- Use a custom tiboot3.bin since the default is "hs-fs",
  but the ti_am62x_sk_defconfig expect the "gp" one.

Changes in v11:
- remove BR2_TARGET_UBOOT_NEEDS_TI_K3_DM option
- add BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option
- Use new BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS and
  BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS options to ease
  post build/image script.

Changes in v7:
- Add devicetree k3-am625-sk.dtb to extlinux.conf
- Improve error messages in post-build.sh script

Changes in v6:
- Enable BR2_TARGET_UBOOT_USE_BINMAN option

Changes in v5:
- Update commit message.

Changes in v4:
- bump to 204.01 instead of 2023.10
- Update the commit message
- Replace 'PARTUUID=00000000-02' with '/dev/mmcblk1p2' where to get rootfs
  in the BR2_ROOTFS_POST_SCRIPT_ARGS insided the ti_am62x_sk_defconfig.

Changes in v2:
- Update the commit message
- Drop Python options required by binman.
- Enable BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN. This option automatically
  selects the Python modules required by binman.
---
 board/ti/am62x-sk/genimage.cfg                |  7 ++-
 .../ti-k3-r5-loader/ti-k3-r5-loader.hash      |  2 +-
 board/ti/am62x-sk/post-build.sh               | 54 +++++++++++++++++++
 configs/ti_am62x_sk_defconfig                 | 14 ++---
 4 files changed, 69 insertions(+), 8 deletions(-)
 create mode 100755 board/ti/am62x-sk/post-build.sh

diff --git a/board/ti/am62x-sk/genimage.cfg b/board/ti/am62x-sk/genimage.cfg
index 26304fe98f..398209f4d8 100644
--- a/board/ti/am62x-sk/genimage.cfg
+++ b/board/ti/am62x-sk/genimage.cfg
@@ -4,10 +4,15 @@ image boot.vfat {
 			"tiboot3.bin",
 			"tispl.bin",
 			"u-boot.img",
+			"k3-am625-sk.dtb",
+			"Image"
+		}
+		file extlinux/extlinux.conf {
+			image = extlinux.conf
 		}
 	}
 
-	size = 16M
+	size = 64M
 }
 
 image sdcard.img {
diff --git a/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
index 2a5c99c459..0e171c56f5 100644
--- a/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
+sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
diff --git a/board/ti/am62x-sk/post-build.sh b/board/ti/am62x-sk/post-build.sh
new file mode 100755
index 0000000000..4f19f4d6cf
--- /dev/null
+++ b/board/ti/am62x-sk/post-build.sh
@@ -0,0 +1,54 @@
+#!/bin/sh -x
+
+# genimage will need to find the extlinux.conf
+# in the binaries directory
+
+die() {
+  cat <<EOF >&2
+Error: $@
+
+Usage: ${0} -c <console> -r <root> [-x <extra-args>]
+EOF
+  exit 1
+}
+
+o='c:d:r:x:'
+O='console:,devicetree:,root:,extra-args:'
+opts="$(getopt -n "${0##*/}" -o "${o}" -l "${O}" -- "${@}")"
+eval set -- "${opts}"
+while [ ${#} -gt 0 ]; do
+    case "${1}" in
+    (-c|--console)
+        CONSOLE="${2}"; shift 2
+        ;;
+    (-d|--devicetree)
+        DEVICETREE="${2}"; shift 2
+        ;;
+    (-r|--root)
+        ROOT="${2}"; shift 2
+        ;;
+    (-x|--extra-args)
+        EXTRA_ARGS="${2}"; shift 2
+        ;;
+    (--)
+        shift 1; break
+        ;;
+    esac
+done
+
+[ -n "${CONSOLE}" ] || die "Missing \`console' argument"
+[ -n "${DEVICETREE}" ] || die "Missing \`devicetree' argument"
+[ -n "${ROOT}" ] || die "Missing \`root' argument"
+append="console=${CONSOLE} root=${ROOT} rw rootfstype=ext4 rootwait"
+if [ -n "${EXTRA_ARGS}" ]; then
+    append="${append} ${EXTRA_ARGS}"
+fi
+
+mkdir -p "${BINARIES_DIR}"
+cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
+	label am62x-sk-buildroot
+	  kernel /Image
+	  fdtdir /
+	  devicetree /${DEVICETREE}
+	  append ${append}
+	__HEADER_EOF
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index b2814526bb..7a411ed423 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,15 +1,16 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am62x-sk/patches"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am62x-sk/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
+BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
 BR2_TARGET_ROOTFS_EXT2=y
@@ -23,21 +24,22 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
-BR2_TARGET_TI_K3_IMAGE_GEN=y
-BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
+BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am62x-gp-evm.bin"
+BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

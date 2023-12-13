Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB97C4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 16:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39EE6615F8;
	Wed, 13 Dec 2023 16:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39EE6615F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qYsiJ1s-AKGz; Wed, 13 Dec 2023 16:45:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52905615BA;
	Wed, 13 Dec 2023 16:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52905615BA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D18DC1BF285
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB08B60783
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB08B60783
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FCkTvphFgXoa for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 16:43:27 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9ACC60596
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 16:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9ACC60596
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a22fb5f71d9so163015266b.0
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 08:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702485804; x=1703090604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OEoWcFLUD9QvBUTDZzEtZYF1rSHsvevjMGlTu7G1kGU=;
 b=DVM6ShNSYlCHvw99ImehqWMWuMoJ+nMQ90yEVq/k+9li0ey1avI8jdbVLrC7LD93to
 UKc3qCTCpco6Guh8bMQZ6CoNkyXYVZAaflyTQnsHidmn+WWKxc2dBosqUGWzCsebGSZu
 El3fD/lLNk8QiboAWKuqh7WnZwMMOnlGtnoN3fvIFvdO6peKfZGSuUMQC/JkaROIuo8/
 m1Di2JILHoMmzRr9vAcWIXt+1cgqdVijnec/3x4U/mG4aZ9KkbjaaHgAxsFIss6pnqI7
 bqfwHWrYsWt5uw55BoP1/ZxUCrJfd6Q2KhGMr0F+96WgTg0Y7Wculi2V162O7ATp4JSa
 m6EA==
X-Gm-Message-State: AOJu0YxcBlEx1bu/bn+B1QOdQiMYIivAwnmczucYGEd9Fje+BtzHv20/
 ys+RhalcZKzXf7BQTzx/p6IYcxQ59kAtsUdzYsI+gw==
X-Google-Smtp-Source: AGHT+IHPoZ+z6iO4CbM4nHyOAjsn1/z+Teq5cv3rIjxlqga+gn47e91b+pPLec4LjRlVQqtBsblkMQ==
X-Received: by 2002:a17:906:3e92:b0:a1d:1be7:59f with SMTP id
 a18-20020a1709063e9200b00a1d1be7059fmr7784669ejj.74.1702485804691; 
 Wed, 13 Dec 2023 08:43:24 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.pool80182.interbusiness.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 rl19-20020a1709076c1300b00a1f8bae93d3sm6017326ejc.215.2023.12.13.08.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 08:43:24 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 13 Dec 2023 17:43:10 +0100
Message-ID: <20231213164311.4180059-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
References: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702485804; x=1703090604;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OEoWcFLUD9QvBUTDZzEtZYF1rSHsvevjMGlTu7G1kGU=;
 b=l//E5F0nO+fUUKJmDpedMytRpqekshAuxiu02ctaam9piIJ+/UdlKynPdAlsfYcvns
 4Z18DLSERI8YHhQiZ5+vW0Pm3Sw7Ou4k+syi4BoFBk1/8gBXS2MOBUGAqjhCIM6mYz9G
 0h2OCNMAy6AQU8eDumsNRe+y6C12aC6GHfZBg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=l//E5F0n
Subject: [Buildroot] [PATCH v2 10/11] configs/ti_am62x_sk_defconfig: bump
 U-Boot version to 2023.10
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 2023.10 version of U-Boot for the am62x-sk board has introduced two
major changes:
- The device tree k3-am625-sk.dtb is no longer searched in /boot, but in
  /boot/dtb/ti. Hence, the disabling of BR2_LINUX_KERNEL_INSTALL_TARGET
  and the use of extlinux.conf for the proper loading of the device tree.
  Furthermore, the parameter BR2_ROOTFS_POST_SCRIPT_ARGS was used to
  auto-generate the extlinux.conf file so that developers can change the
  kernel loading options by modifying the .config.
- The use of binman for building images.

Tested on SK-AM62B-P1.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Update the commit message
- Drop Python options required by binman.
- Enable BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN. This option automatically
  selects the Python modules required by binman.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/ti/am62x-sk/genimage.cfg  |  7 ++++-
 board/ti/am62x-sk/post-build.sh | 49 +++++++++++++++++++++++++++++++++
 board/ti/am62x-sk/post-image.sh |  5 ++++
 configs/ti_am62x_sk_defconfig   | 11 +++++---
 4 files changed, 67 insertions(+), 5 deletions(-)
 create mode 100755 board/ti/am62x-sk/post-build.sh
 create mode 100755 board/ti/am62x-sk/post-image.sh

diff --git a/board/ti/am62x-sk/genimage.cfg b/board/ti/am62x-sk/genimage.cfg
index 26304fe98f99..398209f4d831 100644
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
diff --git a/board/ti/am62x-sk/post-build.sh b/board/ti/am62x-sk/post-build.sh
new file mode 100755
index 000000000000..0f1f98ef217a
--- /dev/null
+++ b/board/ti/am62x-sk/post-build.sh
@@ -0,0 +1,49 @@
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
+o='c:r:x:'
+O='console:,root:,extra-args:'
+opts="$(getopt -n "${0##*/}" -o "${o}" -l "${O}" -- "${@}")"
+eval set -- "${opts}"
+while [ ${#} -gt 0 ]; do
+    case "${1}" in
+    (-c|--console)
+        CONSOLE="${2}"; shift 2
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
+[ -n "${CONSOLE}" ] || die "Missing argument"
+[ -n "${ROOT}" ] || die "Missing argument"
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
+	  append ${append}
+	__HEADER_EOF
diff --git a/board/ti/am62x-sk/post-image.sh b/board/ti/am62x-sk/post-image.sh
new file mode 100755
index 000000000000..34f732c091ad
--- /dev/null
+++ b/board/ti/am62x-sk/post-image.sh
@@ -0,0 +1,5 @@
+#!/bin/sh -x
+
+BOARD_DIR="$(dirname "$0")"
+
+support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index b98a68ff153f..0fb9a2f0246c 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,11 +1,11 @@
 BR2_aarch64=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am62x-sk/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/am62x-sk/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c ttyS2,115200n8 -r PARTUUID=00000000-02 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
 BR2_TARGET_ROOTFS_EXT2=y
@@ -23,11 +23,14 @@ BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP=y
 BR2_TARGET_TI_K3_R5_LOADER=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2023.10"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
+BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

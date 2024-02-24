Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98659C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 20:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C8A140A28;
	Sat, 24 Feb 2024 20:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zr9JWrC7N4eZ; Sat, 24 Feb 2024 20:58:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68395409F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68395409F8;
	Sat, 24 Feb 2024 20:58:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 156BD1BF852
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03D6381F65
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QaPtpZvmnPvC for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 20:57:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A2DF81F58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A2DF81F58
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A2DF81F58
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 20:57:49 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a3122b70439so202951766b.3
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 12:57:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708808268; x=1709413068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y8pwbHc/oG66F4NlEGdI/D/FxNEjFANE0iYyt177lRU=;
 b=iaihjTuxpbTRYx+tQUqQbpQeXnRO1TPW5EGBc5VPDup8b2pgGlrQu/y55roMPg6kvE
 drxCRk7KyULFkpWMOtJJhkUZUsiiDX2uRuI8hj1h5+wdxiLi3uJw5c2znQZ4yA0S/rR9
 nd0Zu6aUJt9Sj7IZqs870M2eQ0fVrnARfqWCsbjYyIg6tnRODGh813lV7zXoC47L2f6z
 CDKDMP/x2+LrS7zr1SwxKVW/46aKATUuunCFsExjp+LWMmOz0kwKfGVUzXHKefitTYv6
 QhcfFc1RcDsTkvZ32suawytgANL6MDOYw996u1VDnHROBiRGskeVPd8KzYygLoZ/b4s4
 Hxeg==
X-Gm-Message-State: AOJu0YwKybxben0s6xV+omrLvf1k7ml0rHMRcsnb+Xk+3c0y4Y080R8p
 8LJLiaAoMNdkTwFQ15A/Xx7bdSkPEVOvTel7Ke2nq7TWuIegk2b2u2nxAi28Yq/G+AwLfcDu0AW
 ySO4=
X-Google-Smtp-Source: AGHT+IHbtBcNNXDQgOepsxo3s4eLIl+XTDqA1Mf8aufDa7LrmR3oKKmJv5LpJHfZeP5L1vMnAuxC8A==
X-Received: by 2002:a17:906:26ca:b0:a3f:c345:f295 with SMTP id
 u10-20020a17090626ca00b00a3fc345f295mr2190838ejc.23.1708808267834; 
 Sat, 24 Feb 2024 12:57:47 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 tk6-20020a170907c28600b00a4306ac4c77sm425506ejc.197.2024.02.24.12.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 12:57:47 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 21:56:52 +0100
Message-ID: <20240224205654.1546744-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
References: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708808268; x=1709413068;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y8pwbHc/oG66F4NlEGdI/D/FxNEjFANE0iYyt177lRU=;
 b=o2u1bTMCV6qXYHCY4jb8vaQO/3GFvTzHR3gxa8Mrv/e5iuDRSzAffJtIQVXoQGiT+J
 3eJK8AANPZFMAuYbgSNmx5aSOEKbQNfMQXRA++vaFcefVWHaPs8UUC5OFGEuMO1go5+O
 /4sbi98x4tdjstM6OHFOrFQX17JVzU1IOyL+s=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=o2u1bTMC
Subject: [Buildroot] [PATCH v6 15/16] configs/ti_am62x_sk_defconfig: bump
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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

Tested on SK-AM62B-P1.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

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

 board/ti/am62x-sk/genimage.cfg  |  7 ++++-
 board/ti/am62x-sk/post-build.sh | 49 +++++++++++++++++++++++++++++++++
 board/ti/am62x-sk/post-image.sh |  5 ++++
 configs/ti_am62x_sk_defconfig   | 13 +++++----
 4 files changed, 67 insertions(+), 7 deletions(-)
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
index 2835404a57df..484f9feb8c61 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,14 +1,14 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am62x-sk/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/am62x-sk/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c ttyS2,115200n8 -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
 BR2_PACKAGE_TI_K3=y
@@ -24,20 +24,21 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
-BR2_TARGET_TI_K3_IMAGE_GEN=y
+BR2_TARGET_TI_K3_BOOT_FIRMWARE=y
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_TI_K3_DM=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87FCEA8546
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 21:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CECF40C6B;
	Sun,  8 Mar 2026 21:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1079bYZ0d42i; Sun,  8 Mar 2026 21:34:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AABD40B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773005641;
	bh=A/MGHLsiHHb5WRLT2twGWWBa6HKBnokxm131BEmaxLw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DtD9TteR+acNMbOdpTs3IDwMpNmbL0JP0jNrhcTtLpJt9SxHSHNFhuiZHHTIMieCb
	 Lq4oWHYhowu9sQKoSxJzk/sWffeF6eA803Sj3va2NuFKujfDfE1irEcnltI7n4UW7Z
	 iHrR69cdpX9JtvT9AZcJkxOnUkuS/H0mjkGpttGwREUVbWQYRQqiVmGsr7fxGH6H/P
	 SEuIllIVeF4kTwxDIdJUtJBY2XC4fbFThyFCQhjjSs1EXqFmbcGB0RMujunsl6ryrm
	 PIWZEXtvwQjAjEGL/iLCrCuOIVGtcN2BAh7hqGkiq/FtM78+x/XbcrGEFlJE96XUmB
	 llWV6KBbsVIsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AABD40B2D;
	Sun,  8 Mar 2026 21:34:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 351BA358
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB91440B2E
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXW4483vOsaS for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 21:33:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C559140AE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C559140AE8
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C559140AE8
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:33:55 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48534e9076fso4190555e9.0
 for <buildroot@buildroot.org>; Sun, 08 Mar 2026 14:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773005634; x=1773610434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wUAP7lj00/gMwKXCuHeh6ZJGpkT4A0unJxtWaTPLoHs=;
 b=tGOiZgRPPSsV8/Konfq0989PH9VCxwQpB/6JfBxa3iBo8XvTBTRlFqBVia49Pp36uB
 3pcH8yUWdbusfkQ49tv6CtdQ3vhTNw3G/t9nl3ku6m7OJ5AMxyABwDFddlM0gu58Umnq
 ofe5oPO/TDFyLXMAk1GBvtvVH7LW7BY7hlVEk5h64CseKF5tBbcESif+isYsp86GlnRF
 5UYYRkIiWz7rrjFnAlQ9sRjSmEpX7kHtRoWA9Twt6bNTupkww9F2q8VX3jB+kmYy4o2E
 4pjOS+Dd0xr+LDJ9vLSv/kzQcNgnkKmngbIPASkR2wiecaCFkjvt+pKgFBwOhOoLjKqN
 cDnw==
X-Gm-Message-State: AOJu0YyLdimVosdcij1aukT9cCNo0Wz5rSGygQnQ9dXz/FXtmCsbiAt7
 FiUu2j9DRGlEavl5dVJnxSuvNBJjnUJ6gTYZ8z+gUi52TGRCFVfm+s9Kxmwl0yDGiP6+zpA2Oue
 Z39ci
X-Gm-Gg: ATEYQzxcSSD2kiQU2pVhB9iqgmdDnOmEdbIVFt2WFPnFg9oR4MskW1AyeO/G/+t2yOv
 80p/O2/deaMU4rfrP7cCUG06r2F7SNPP7xaHXrtPstnSZw9x+L3LJhqGLlwpKT7B7vKCjYHy89r
 SysBfG8WnNeyT+/FyKqpErMkYwiXjFYaevHQTUeM8YMaA1veroN0LovsGQ5BuR6rTjnG3zFGCNL
 2bsHTluTQV7b0KY7S6wqSqG2kFs4sN0Eo+rJQjIhqEv32+HqBjWE16iaNTGE5KTNc2buq7ZGhqZ
 Bv/Yy5n8qHJxiWeWRqrB9mOEem9ZDocOi9tQrqYx1i7m2kJZdzAcy4QU0TNuf34hggEyO/kocGH
 OLfB9JbYNKiRhpoRh1+KxHAJcl9p4czvg6xDvc6f2REtAYaUNubI2zBmPvkLGM8VQw5InlJH2uD
 8pw0n8zyw7KygD5o88aOaWQF+eoZ6DWa2arIbykRKpl+xqOFBpt1TrY4SQF4sxsrJZiWBHhwnFH
 HAEOeDLKe6gdZQpBPAoj3uBzQ==
X-Received: by 2002:a05:600c:c16d:b0:480:39ad:3b7c with SMTP id
 5b1f17b1804b1-485269582fbmr171458715e9.16.1773005633703; 
 Sun, 08 Mar 2026 14:33:53 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb3668csm458929445e9.13.2026.03.08.14.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 14:33:53 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun,  8 Mar 2026 22:33:48 +0100
Message-ID: <20260308213348.708846-5-romain.naour@smile.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260308213348.708846-1-romain.naour@smile.fr>
References: <20260308213348.708846-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773005634; x=1773610434; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wUAP7lj00/gMwKXCuHeh6ZJGpkT4A0unJxtWaTPLoHs=;
 b=QF2V/bRhw6XIGkeyGMouHoKrK80jTJn0jQ5AnKnTi0oNNqZrWmajP8PlBWJ37AqcC8
 VynyliRadXYo2/5Kecv7T4dREYeDlibE4uW6AiiU1j119x52WeqHdzCb39I87I82Xs6c
 STf6Ad65E7tk3rmLvSJVgjsDainXGI6NC8CkU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=QF2V/bRh
Subject: [Buildroot] [PATCH 4/4] configs/beagleplay_defconfig: bump linux to
 6.18.16 and u-boot to 2026.01
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit:
    - updates the Kernel from 6.10 to 6.18.16
    - updates U-Boot from 2024.07 to 2026.01
    - updates arm-trusted-firmware from v2.11 to v2.12 LTS
    - switches to Bootlin external glibc stable toolchain

Replace OP-TEE TEE binary file tee-pager_v2.bin by tee-raw.bin using
the new option BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_RAW_BIN.

Remove unsued linux-headers.hash since we now use a prebuilt toolchain.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../arm-trusted-firmware.hash                    |  2 --
 .../patches/linux-headers/linux-headers.hash     |  1 -
 .../beagleplay/patches/linux/linux.hash          |  4 ++--
 .../beagleplay/patches/uboot/uboot.hash          |  2 +-
 configs/beagleplay_defconfig                     | 16 +++++++++-------
 5 files changed, 12 insertions(+), 13 deletions(-)
 delete mode 100644 board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 delete mode 120000 board/beagleboard/beagleplay/patches/linux-headers/linux-headers.hash

diff --git a/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
deleted file mode 100644
index 8b77e1f165..0000000000
--- a/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
diff --git a/board/beagleboard/beagleplay/patches/linux-headers/linux-headers.hash b/board/beagleboard/beagleplay/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/beagleboard/beagleplay/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/beagleboard/beagleplay/patches/linux/linux.hash b/board/beagleboard/beagleplay/patches/linux/linux.hash
index 53eb143894..eb4dcee958 100644
--- a/board/beagleboard/beagleplay/patches/linux/linux.hash
+++ b/board/beagleboard/beagleplay/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  774698422ee54c5f1e704456f37c65c06b51b4e9a8b0866f34580d86fef8e226  linux-6.10.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  4f21c01f4d04c1d1b3ed794153f8900802c92497be620b07c4869530f2d28ee3  linux-6.18.16.tar.xz
diff --git a/board/beagleboard/beagleplay/patches/uboot/uboot.hash b/board/beagleboard/beagleplay/patches/uboot/uboot.hash
index fe9b4f53dc..b6a925ea4e 100644
--- a/board/beagleboard/beagleplay/patches/uboot/uboot.hash
+++ b/board/beagleboard/beagleplay/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/beagleplay_defconfig b/configs/beagleplay_defconfig
index 42aa2fbd6e..90212bda44 100644
--- a/configs/beagleplay_defconfig
+++ b/configs/beagleplay_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/beagleboard/beagleplay/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beagleplay/post-build.sh"
@@ -7,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/beagleboard/beagleplay/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.16"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-beagleplay"
@@ -22,8 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
@@ -31,17 +32,19 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_beagleplay_r5"
 BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am62x-gp-evm.bin"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_beagleplay_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_RAW_BIN=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
@@ -49,7 +52,6 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.img_unsigned"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="tispl.bin_unsigned"
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

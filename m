Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B41AC54E60
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 12:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BE5940703;
	Tue, 19 Mar 2024 12:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UkAGizoiQYp6; Tue, 19 Mar 2024 12:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3427E40748
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3427E40748;
	Tue, 19 Mar 2024 12:24:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D8C21BF406
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38E3A60AC3
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:24:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yNdmexVQHg_F for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 12:24:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=javad.rahimipetroudi@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E09E260AA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E09E260AA8
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E09E260AA8
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 12:24:03 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-568aa282ccdso5420585a12.3
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 05:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710851042; x=1711455842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jRaeje31RNqZO5D8JOD8TCoAwyPDOHyZ9Uwpe6us7Mw=;
 b=Y+ReHQWtddQOkOm4+FmaPxcc1MleTVe4lkGNe1YFo+8hqzQ88zJM6OpMuBI+IPtNle
 7sGwje/VycKE+iCjVaplJpDGiI1z1E6p0m9gbjQBFVUMlXKI3VBJ3kwrpCDJYxl+u5Hr
 KYpZeWmhyucKPqo9Roy6JcBiiV0WQ3IHpkzDO4DbtaSjzyfdZOgAzuSse9JI70Xcio0h
 GCwNO/+lUsrd2kjrEpXRMF0lDvZ81ivcu+VlMczLjPOyXMdp2x12+LoIWlW7qGZ9IOxb
 ypbHLe4ex6POudrzjFz1+3j/3LUs7NyjYaMIizkg0CQggqcn+boUihkzsM+T60jZMAJ9
 oNaA==
X-Gm-Message-State: AOJu0YxJ7M0+HO/WV+S1sri+6qwKWzhaqiNm+I04hIk+TISd+uZYT2v0
 nVLKWMn2v64xXOAfAcD43Kp9YZWBNUeGAZ68o1tPZncD2ISI1uJYbWEbIaItxifoOkU+YnTPWrP
 9O/0=
X-Google-Smtp-Source: AGHT+IGKfD03zrQkW1WNhdhTXotTphj4mR2kaqAM/davWbcwuGNfOwVfM7bjWkyrnhtwUllTa6P+Sw==
X-Received: by 2002:a05:6402:5510:b0:568:9abe:5843 with SMTP id
 fi16-20020a056402551000b005689abe5843mr8592304edb.42.1710851041611; 
 Tue, 19 Mar 2024 05:24:01 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:8b20:c100:2e31:96e9:7843:4bd2])
 by smtp.gmail.com with ESMTPSA id
 cs4-20020a0564020c4400b00568a1ce4562sm5551524edb.25.2024.03.19.05.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 05:24:01 -0700 (PDT)
X-Google-Original-From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 13:23:44 +0100
Message-ID: <20240319122344.3107639-3-javad.rahimipetroudi@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319122344.3107639-1-javad.rahimipetroudi@mind.be>
References: <20240319122344.3107639-1-javad.rahimipetroudi@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1710851042; x=1711455842; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jRaeje31RNqZO5D8JOD8TCoAwyPDOHyZ9Uwpe6us7Mw=;
 b=PtJaOd/WUMI11Z2l2QccfVJn78x+TwDMU/pRlW/vQu7hdIQrIynPOCeTLgmv8bYC4S
 gr4MbLOBZU+5UMLCrZiR1qhMwGhd/35Jm7XexfxJV6Hb24NqBmi4/Io7tj3ewzOcitpJ
 HwHjgKayofN5oTfhvYECxWM+tvXBJ6d79mb8A5yb9JSbC5mTZVYTXNi5FWK7KCQtnLTk
 STp7AyU5Th9xpz/fV6aLUQqB0XisLj3qH+UOuZnKasRXZFWLRuyDSP5WzvgsNm6x4zZ4
 mHdTts96sA/L/ngh5jfouXkNlHPFzI6eDjMHfAjPn/GfnvSN5Hsv08FnbHnKMDpvnHPi
 dauA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=PtJaOd/W
Subject: [Buildroot] [PATCH v4 3/3] configs/avenger96_defconfig: bump ATF
 version to lts-v2.8.16
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
From: Javad Rahimipetroudi via buildroot <buildroot@buildroot.org>
Reply-To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
Cc: Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch upgrades the ATF version to lts-v2.8.16. Please note that
due to DTS chages from commit 51e223058fe70b311542178f1865514745fa7874
("feat(stm32mp15-fdts): add Avenger96 board with STM32MP157A DHCOR SoM")
The ATF additional build variable also modified to use the new DTS file.

Furthermore, 'E=0' flag also removed from ATF additional build
variable. As it was added by
commit deb8d71c9285eb60bc3d28e8abcf7208f78980a7 to avoid TFA build
fail because of '-Werror' flag. However, from version v2.6 or later,
it is not required anymore.

The ATF patch
"board/arrow/avenger96/patches/arm-trusted-firmware/
0001-stm32mp157a-avenger96.dts-enable-hash-device-to-unbr.patch" also
has been removed. As it was not required due to using Dhcore DTS
file for the ATF build.

Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
---
Changes v1 -> v2:
  - Upgrade ATF version to lts-2.8.16 (suggested by Arnout)
  - Remove ATF patch (suggested by Peter)
  - Improve commit document
  - Modify commit title

---
 ...ger96.dts-enable-hash-device-to-unbr.patch | 51 -------------------
 configs/avenger96_defconfig                   |  5 +-
 2 files changed, 2 insertions(+), 54 deletions(-)
 delete mode 100644 board/arrow/avenger96/patches/arm-trusted-firmware/0001-stm32mp157a-avenger96.dts-enable-hash-device-to-unbr.patch

diff --git a/board/arrow/avenger96/patches/arm-trusted-firmware/0001-stm32mp157a-avenger96.dts-enable-hash-device-to-unbr.patch b/board/arrow/avenger96/patches/arm-trusted-firmware/0001-stm32mp157a-avenger96.dts-enable-hash-device-to-unbr.patch
deleted file mode 100644
index 8cec0af3b1..0000000000
--- a/board/arrow/avenger96/patches/arm-trusted-firmware/0001-stm32mp157a-avenger96.dts-enable-hash-device-to-unbr.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 336dc301e02d64507447f82020ce7a349797bef3 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Sun, 5 Nov 2023 14:59:16 +0100
-Subject: [PATCH] stm32mp157a-avenger96.dts: enable hash device to unbreak boot
- issue
-
-The avenger96 board was forgotten when authentication support was added with
-commit 4bdb1a7a6a1325343 (stm32mp1: add authentication support for
-stm32image), causing a panic when stm32mp_init_auth() is called, so fix it
-similar to how it was done for the STM32MP157C-ED1 board with:
-
-commit b37b52ef8bc05bfd8dcca992d4ba84cd7c5d23bb
-Author: Yann Gautier <yann.gautier@st.com>
-Date:   Tue Oct 13 18:05:06 2020 +0200
-
-    fdts: add missing hash node in STM32MP157C-ED1 board DT
-
-    Without this node, the board fails to boot and panics in the function
-    stm32mp_init_auth().
-
-    Change-Id: Ia54924410dac2a8c94dd6e45d7e93977fe7d87e2
-    Signed-off-by: Yann Gautier <yann.gautier@st.com>
-
-Upstream: N/A - Upstream reworked authentication to skip it for MP157A
- variant since v2.7, see "feat(st): disable authentication based on
- part_number"
- (https://github.com/ARM-software/arm-trusted-firmware/commit/49abdfd8cececb91a4bc7e7b29a30c09dce461c7)
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- fdts/stm32mp157a-avenger96.dts | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/fdts/stm32mp157a-avenger96.dts b/fdts/stm32mp157a-avenger96.dts
-index b967736e4..76edecb83 100644
---- a/fdts/stm32mp157a-avenger96.dts
-+++ b/fdts/stm32mp157a-avenger96.dts
-@@ -271,6 +271,10 @@
- 	};
- };
- 
-+&hash1 {
-+	status = "okay";
-+};
-+
- &rng1 {
- 	status = "okay";
- };
--- 
-2.39.2
-
diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index 218955fc02..f73b654dc8 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -6,7 +6,6 @@ BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System configuration
-BR2_GLOBAL_PATCH_DIR="board/arrow/avenger96/patches"
 BR2_ROOTFS_OVERLAY="board/arrow/avenger96/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
 
@@ -29,13 +28,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # Bootloaders
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="lts-v2.8.16"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-nodtb.bin"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-avenger96.dtb E=0 BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-dhcor-avenger96.dtb BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

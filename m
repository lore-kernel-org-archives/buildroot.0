Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F950E99052
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 08:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EDFE60B00;
	Fri, 10 Apr 2026 08:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xsG96Nu1tJ8A; Fri, 10 Apr 2026 08:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43CFF608B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775808495;
	bh=PUpZ58oWFMYKrwGrv3WhYaK1PqmtCVFfwHl/TSyZ574=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dJyuBBaB8yRUp55MFbkIHQI7D+rU3ZMMWOs4dHY6GoB7Tt/uyKNMUy60q+4lCpCtI
	 nL1nY3QD6RlFcfWfAcyIfY8DzJF2zsQ9b8IBGTrVzlOwyEGZvpMlsaBhVW5XEAgDN+
	 U3R4V2MJVljpr7i0wOmNTayR0QvkKor2PBd0P6h2B0jYVtJEAF2Moid0zty4yF4foW
	 lIJwfVOLfLg0y7VfOXmCBCTVjZZH3JQLvMgpU/V/qor8jLDCM4UWn8qYLLl5EEmXAp
	 xPMuU4bnJytsarN+g5uQhoi8JNdm1BzLMY84tbaOnuEsCVdijW/TpqStNpM33RtiJc
	 wGzDDugotT2yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43CFF608B6;
	Fri, 10 Apr 2026 08:08:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 705FB194
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 08:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 539D340CEE
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 08:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zakzr4SyTbI2 for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 08:08:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=bisson.gary@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 26A8940BA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26A8940BA1
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26A8940BA1
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 08:08:11 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4888375f735so16994485e9.3
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 01:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775808490; x=1776413290;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vP422MPItGmh9SRpLsnwJQbeAGBgWPhMkI6KvKl/oLg=;
 b=Gdjap1GNNb+lhr2ENlIMDDP6/bnV3VFqGNh519w9uVK3SroGA5FwjMa4wYcuznmHQE
 wwNNNQwqn+1RcUOCZm29bPo8l+sAQh/fzuMo9Z6A/2vJeGOOa2pPpxrv7EQiAAiDTPqD
 7pm6uGLn1S2quG1Jo9lJFVuNogJlWoW0iePgOKVcBljIGAk2HJ3koI2C+xFv278MH/vG
 ncV/OFW4IcULUkyi8bXqPFgzBYGfQFRZt2Y1cwB06Ripbd4JZFI9Zw0yhVzENuJgErjC
 DHyJShUse9pyvxDrMQ4USAFhA8dA7c0kKnklRXRND+Kf3W0hRqpkRijturyg+2+vvaaO
 2ddw==
X-Gm-Message-State: AOJu0Yy9zZqz3VLGYUlHY8arONig7/4UHQntVelxH+ZaxlkEkojVjadP
 OrV4q927wr70yYPTmBUR9neF3xnevbWvbl2Ll2UPfhrbIDjN9i9ucyUMHRY4LA==
X-Gm-Gg: AeBDieuKzzX1CzusE3KrExYhGXpshZW8mS1WlICjAn+dDdnpbPHAh3v6EBQAL6LtXD+
 sv9v2ZG+R/a0v2JlvmWGrTSeOUcftdRtYCXymmcf6azsElfgmaCE/bCsuxogfcJU1kDIxiFZvsT
 izwzt5vyx6ogR+8L7elspuOGQOShYQH7+7WZBrTMIdgq0oclydHpMJ8M/oORvXWNo112vLNdvhy
 IZcgr6hKpTeM+PgoumOyZnfQMUnOMTzemQBnOwisq1mCzgMS/BEISAbcwh7d/Z2f0n84KXaxI7V
 lW2eqWidxqL/Z0wq04S56khAQssoLk77nx5gNLb75w+Px8GRQoO9Jz2+UiNy/sZJCTb7jr8tsxj
 9UY3FjBtHVB5ypWfpGqML2uQIT5IFLHIWHVzlV30546iB6Zeq3nbi2uA8h0ESig0Lv/7YR66IDF
 J9rD0YkewVm1jmGRIOBKI/u6QsP7wB97wPcJkGwvw=
X-Received: by 2002:a05:600c:5487:b0:488:ae26:435e with SMTP id
 5b1f17b1804b1-488d683d4f0mr23744885e9.16.1775808489752; 
 Fri, 10 Apr 2026 01:08:09 -0700 (PDT)
Received: from [127.0.1.1] ([2001:861:3201:3d10:c6a2:4659:6438:8651])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5396293sm49288785e9.15.2026.04.10.01.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 01:08:09 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Fri, 10 Apr 2026 10:08:04 +0200
MIME-Version: 1.0
Message-Id: <20260410-nitrogentoolchain-v1-1-deeeb6d014d5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOOv2GkC/x2MSQqAMAwAvyI5W+jign5FPIiNGpBE2iKC9O8Wj
 wMz80LEQBhhrF4IeFMk4QKmrmA9Ft5RkS8MVttON0YrphRkR04iZzGIVe8cWtP6YfMeSncF3Oj
 5n9Oc8wdKtn9nYwAAAA==
X-Change-ID: 20260410-nitrogentoolchain-733e215d9fdd
To: buildroot@buildroot.org
Cc: Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775808489; l=5121;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=XyxOUBTyEEGKZ6tSSw+IxuE+8RT36GFI2Y3QSN7n9PA=;
 b=SPu88FGQ5mdZD4eUDqcXA7j0UYA/HyTeTKhiNgvg7ltRGy+p4NDDOyTMxc3KjfA/nyvdiEaln
 sJiamBFIcipBkbP7+3RlxSVdpobpWP+TFR37x0RV37idKoaHjRT8gSg
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775808490; x=1776413290; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vP422MPItGmh9SRpLsnwJQbeAGBgWPhMkI6KvKl/oLg=;
 b=O50Ev+KqdeCn2+gh2OtV3167ah6JhY4cSqUPL07QX6Au27QT2PG6SS5bgWB6tWwm/S
 xgeHbSi0KCF5SvcOQpndeLMGpAdsOjj7XpTxfbhc4M2J+s2vC0lU6cUKYfL2ZCw3ngWr
 pgk+X4tME1k71PEFjpIQc1664VLq4u+yznnCMfXseBlWELOLXe0lxh0pIqBrZCKgfB32
 NijM1nE7GreMgIQA7lC+i4nmbJVQJwL0rgAgRTvd9k/2iYTVRhWlSw1Q23x0XccqznZD
 ttCjhYA+xzCNDcnCgXOosKNmcbk1DT3jdKGDMxAfXKPbzOtv/Me9mOA6+Grfkjgl+2u1
 Tmxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=O50Ev+Kq
Subject: [Buildroot] [PATCH] configs/nitrogen*: switch to bootlin toolchain
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As recommended by Julien[1].

[1] https://lists.buildroot.org/pipermail/buildroot/2026-April/800059.html

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 configs/nitrogen6sx_defconfig | 4 +++-
 configs/nitrogen6x_defconfig  | 4 +++-
 configs/nitrogen7_defconfig   | 4 +++-
 configs/nitrogen8m_defconfig  | 4 +++-
 configs/nitrogen8mm_defconfig | 4 +++-
 configs/nitrogen8mn_defconfig | 4 +++-
 configs/nitrogen8mp_defconfig | 4 +++-
 7 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index 03103567e9..1c68810aa9 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -3,7 +3,9 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 4d5408a474..50f769ac23 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -3,7 +3,9 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index 65aff36860..7e5f8dd4f6 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -1,7 +1,9 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 9a90cdae54..48ecf4b201 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/boundarydevices/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index db4af070a8..b984acd604 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/boundarydevices/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index dc54d24008..4c63fdf9d3 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/boundarydevices/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index 72884d97fd..b6c1264e77 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/boundarydevices/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"

---
base-commit: 52ee2f5644da5389634b2465f1dc31deb5a4807c
change-id: 20260410-nitrogentoolchain-733e215d9fdd

Best regards,
-- 
Gary Bisson <bisson.gary@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

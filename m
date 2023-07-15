Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6665EC0015E
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 19:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B7C78198D;
	Sat, 15 Jul 2023 19:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B7C78198D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCBlY7c3JQcI; Sat, 15 Jul 2023 19:48:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C050819BE;
	Sat, 15 Jul 2023 19:47:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C050819BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 044141BF2E5
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 19:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D16BF40517
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 19:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D16BF40517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UsoJ1QlO-tfL for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 19:47:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F142F404FE
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F142F404FE
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 19:47:44 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 40B12A03E8;
 Sat, 15 Jul 2023 21:47:43 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix02.mail.de (Postfix) with ESMTP id 22DC1A03C3;
 Sat, 15 Jul 2023 21:47:43 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id B8EAE100135;
 Sat, 15 Jul 2023 21:47:42 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 21:47:34 +0200
Message-Id: <20230715194735.15286-3-kilian.zinnecker@mail.de>
In-Reply-To: <20230715194735.15286-1-kilian.zinnecker@mail.de>
References: <20230715194735.15286-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2469
X-purgate-ID: 154282::1689450462-3D7FE7B6-7D70E246/2/53637512152
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1689450463;
 bh=tUIRwo1njlaKoywNnva5SQC9GaNVW+YOuNSlQqRZQFY=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=WLDWswXXDqxkEE7CpaG8Fr6h4KCVOaz2goQasQuLJADclLxTys0UB9abD9lrfM8so
 N0e/V5/kt7LEY6PFZOJ5E0qkeDdodCuZm06JFW3fjIAeKqe3ONWChCzIpIiRU1mNVV
 4h1E7PXrIsQHIY6tDOG8r2SiszS3rFSfJ2X5Xa4lTCvMo+aV756f6CbD54v5gs2FOb
 Jpd+wnhc6GOWaudnDV56hzfvpAg5wvMm3J0BO1Nx+mNs/CDaYNz2402AcMN4HYBXiJ
 VblEBU/ivQQGyZyAljVJvkfSbEbhoiPDb38ql42z8dPhP5nXwsFuZmZWsNsK2fya4g
 6gZDU4buhkeEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=WLDWswXX
Subject: [Buildroot] [PATCH v7 2/3] boot/uboot: Add support for Rockchip
 binary blobs
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Andreas Ziegler <br015@umbiko.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently for some Rockchip SoCs binary blobs are needed, e.g., for
the RK3588 bl31 and tpl. These blobs are provided by Rockchip. This
patch adds U-Boot package options to use theses binaries, provided
by the rockchip-rkbin package, which is also introduced in this
patch series. The U-Boot package is modified so that it takes the
chosen binaries and automatically uses them during build.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 boot/uboot/Config.in |  9 +++++++++
 boot/uboot/uboot.mk  | 17 +++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 085397d03d..7733f8501f 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -262,6 +262,15 @@ config BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE
 	  This option makes sure that the i.MX firmwares are copied into
 	  the U-Boot source directory.
 
+config BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN
+	bool "U-Boot needs rockchip-rkbin"
+	depends on BR2_PACKAGE_ROCKCHIP_RKBIN
+	help
+	  For some Rockchip SoCs U-Boot needs binary blobs from
+	  Rockchip.
+	  This option makes sure that the needed binary blobs are copied
+	  into the U-Boot source directory.
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 4eae8e95c3..dd9acd1649 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -207,6 +207,23 @@ endef
 UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_FW_FILES
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN),y)
+UBOOT_DEPENDENCIES += rockchip-rkbin
+define UBOOT_INSTALL_UBOOT_ROCKCHIP_BIN
+	$(INSTALL) -D -m 0644 $(@D)/u-boot-rockchip.bin $(BINARIES_DIR)/u-boot-rockchip.bin
+endef
+UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_UBOOT_ROCKCHIP_BIN
+ifneq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME),"")
+UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/${notdir $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME))}
+endif
+ifneq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME),"")
+UBOOT_MAKE_OPTS += ROCKCHIP_TPL=$(BINARIES_DIR)/${notdir $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME))}
+endif
+ifneq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME),"")
+UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/${notdir $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME))}
+endif
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

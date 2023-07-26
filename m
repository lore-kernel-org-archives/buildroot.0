Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E029C001DF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 18:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 330C540A50;
	Wed, 26 Jul 2023 18:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 330C540A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oig_m-SYDbXS; Wed, 26 Jul 2023 18:15:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5510340A56;
	Wed, 26 Jul 2023 18:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5510340A56
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77A1F1BF421
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 18:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C62960EFF
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 18:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C62960EFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ckmoRHstPx6H for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 18:14:35 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A22D560EF9
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 18:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A22D560EF9
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id B3252A0334;
 Wed, 26 Jul 2023 20:04:51 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix03.mail.de (Postfix) with ESMTP id 8DD0280171;
 Wed, 26 Jul 2023 20:04:51 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id 2523AC003C;
 Wed, 26 Jul 2023 20:04:51 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 20:04:32 +0200
Message-Id: <20230726180433.7561-3-kilian.zinnecker@mail.de>
In-Reply-To: <20230726180433.7561-1-kilian.zinnecker@mail.de>
References: <20230726180433.7561-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2506
X-purgate-ID: 154282::1690394691-D8FFDC09-A4A336C2/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1690394691;
 bh=AZZSpYyivUl9NmwTFEAaxo8836YQwp/z65+eCRRTu7o=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=tbWXoawN5iS26bJVrpGGc9vXa03AMWgGdMfiNiY/GK0VpfbSeMnnicT8m/YaVNsfe
 4g5x1dciK1yiFc6MucVv1oHst7tSpZw6K8/eARv0008xVcLjM6jbgPi9kgMaLP3ieY
 j3l0O7NDu/GTWetTHan6ZMJlTAP/SoLtpTJ5nZZeF/Msw1cRRXsT6Z+pafOqCP3AXI
 Nr8wyVk+0rSDfXOV+iKuc6wFRd9jwEIJTbPISjtEoPaATqF55Qw04I1XeYavxG0yKL
 M12OwTBMwGxxjZtDrO60dvt0jdOdvH90ujGMfI9mlUiopJL3QyKoEbtgxmxnx3WR9O
 9SRLrxPy9zoEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=tbWXoawN
Subject: [Buildroot] [PATCH v8 2/3] boot/uboot: Add support for Rockchip
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
index 1a6e70a792..b6e270f633 100644
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
 UBOOT_MAKE_OPTS += DTC=$(HOST_DIR)/bin/dtc
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

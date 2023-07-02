Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8A2EB64D9
	for <buildroot@archiver.kernel.org>; Sun,  2 Jul 2023 20:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA4A360BD7;
	Sun,  2 Jul 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA4A360BD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pag2pmQm-9q1; Sun,  2 Jul 2023 20:53:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0B7B60B4E;
	Sun,  2 Jul 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0B7B60B4E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 81FA91BF263
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 20:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 599B840B12
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 20:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 599B840B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9L_OfOaDmWXL for <buildroot@lists.busybox.net>;
 Sun,  2 Jul 2023 20:52:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1389040018
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1389040018
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 20:52:56 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 18199A0E8D;
 Sun,  2 Jul 2023 22:52:55 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix01.mail.de (Postfix) with ESMTP id F079880154;
 Sun,  2 Jul 2023 22:52:54 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id 5F558C002F;
 Sun,  2 Jul 2023 22:52:54 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun,  2 Jul 2023 22:52:22 +0200
Message-Id: <20230702205224.50568-1-kilian.zinnecker@mail.de>
In-Reply-To: <b0bc0426b400fa2f5402bdf85703a132@umbiko.net>
References: <b0bc0426b400fa2f5402bdf85703a132@umbiko.net>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 4040
X-purgate-ID: 154282::1688331174-1E7FEC09-FD39C65A/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688331175;
 bh=hNlFjvrucl5ci+fN+aQf8JCGEPQWIzjhOVfeVF3pETI=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=jx03ihMf0qpMN26t91OnP6jMmjkZcE5TuLx6vFuvMzphOGvaPpPei1+tXizSK4M6Q
 Vxng3AAXtUAwE1go7AR7RS9nl6U3aBOFOjalNCtSvTFZzbV83M/pEIS68StBNynwb+
 EVMbzcIoVGXHdtMNyYv/7h9HOHkRAp0Ntf3KOY8Mq3Coh3aeHTLF3lV8jCO/3xpbct
 WZDOZTvF/FF0U19gH8u7W0ZwUADwwgcGgxdiEx1RJBpI1/3OPfmEN88+spVBcorTCa
 dR7T2MzTsjDjegNobL0klfkCdkxTo0wkmJFXcOZ7xYdzJxdy6OcxN/hqs4DE3nMy09
 BPmzeL1XK0jYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=jx03ihMf
Subject: [Buildroot] [PATCH v2 1/3] package: add rockchip-rkbin package
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds the package for the Rockchip ATF binary blobs.
These binaries are currently needed if U-Boot is built for the
Rockchip RK3588 SoC. In addition the uboot package is modified
such, that it can depend on the rockchip-rkbin package and in that
case automatically obtain the needed binary blobs.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 boot/uboot/Config.in                     |  9 +++++++++
 boot/uboot/uboot.mk                      | 10 ++++++++++
 package/Config.in                        |  1 +
 package/rockchip-rkbin/Config.in         |  6 ++++++
 package/rockchip-rkbin/rockchip-rkbin.mk | 23 +++++++++++++++++++++++
 5 files changed, 49 insertions(+)
 create mode 100644 package/rockchip-rkbin/Config.in
 create mode 100644 package/rockchip-rkbin/rockchip-rkbin.mk

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 085397d03d..8ec095a735 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -262,6 +262,15 @@ config BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE
 	  This option makes sure that the i.MX firmwares are copied into
 	  the U-Boot source directory.
 
+config BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN
+	bool "U-Boot needs rockchip-rkbin"
+	depends on BR2_PACKAGE_ROCKCHIP_RKBIN
+	help
+	  U-Boot currently needs binary blobs during build for the
+	  Rockchip RK3588 SoC.
+	  This option makes sure that the needed binary blobs are copied
+	  into the U-Boot source directory.
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 4eae8e95c3..4ef0a7bc2a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -207,6 +207,16 @@ endef
 UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_FW_FILES
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN),y)
+UBOOT_DEPENDENCIES += rockchip-rkbin
+
+define UBOOT_COPY_RKBIN_FW_FILES
+	cp $(BINARIES_DIR)/bl31.bin $(@D)
+	cp $(BINARIES_DIR)/ddr.bin $(@D)
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_RKBIN_FW_FILES
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
 endif
diff --git a/package/Config.in b/package/Config.in
index bff090a661..80221d0406 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -581,6 +581,7 @@ endmenu
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rockchip-mali/Config.in"
+	source "package/rockchip-rkbin/Config.in"
 	source "package/rpi-userland/Config.in"
 	source "package/rs485conf/Config.in"
 	source "package/rtc-tools/Config.in"
diff --git a/package/rockchip-rkbin/Config.in b/package/rockchip-rkbin/Config.in
new file mode 100644
index 0000000000..d8072002ca
--- /dev/null
+++ b/package/rockchip-rkbin/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ROCKCHIP_RKBIN
+	bool "Rockchip RKBIN binary blobs"
+	depends on BR2_arm || BR2_aarch64
+	help
+	  This package provides binary blobs, currently needed by
+	  u-boot for the Rockchip RK3588 SoC.
diff --git a/package/rockchip-rkbin/rockchip-rkbin.mk b/package/rockchip-rkbin/rockchip-rkbin.mk
new file mode 100644
index 0000000000..ac50c8931d
--- /dev/null
+++ b/package/rockchip-rkbin/rockchip-rkbin.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# rockchip-rkbin
+#
+################################################################################
+
+
+ROCKCHIP_RKBIN_VERSION = d6ccfe401ca84a98ca3b85c12b9554a1a43a166c
+ROCKCHIP_RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
+ROCKCHIP_RKBIN_SITE_METHOD = git
+
+ROCKCHIP_RKBIN_INSTALL_STAGING = YES
+ROCKCHIP_RKBIN_INSTALL_TARGET = NO
+
+RK3588_DDRFW = rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin
+RK3588_BL3FW = rk3588_bl31_v1.38.elf
+
+define ROCKCHIP_RKBIN_INSTALL_STAGING_CMDS
+	cp $(@D)/bin/rk35/$(RK3588_BL3FW) $(BINARIES_DIR)/bl31.bin
+	cp $(@D)/bin/rk35/$(RK3588_DDRFW) $(BINARIES_DIR)/ddr.bin
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

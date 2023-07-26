Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57D1C001DC
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 18:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 308FB40534;
	Wed, 26 Jul 2023 18:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 308FB40534
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cF0hsPbc5gBC; Wed, 26 Jul 2023 18:14:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F40C540A48;
	Wed, 26 Jul 2023 18:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F40C540A48
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F1EE1BF983
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 18:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F88641D93
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 18:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F88641D93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zwa_IOoI7Zyc for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 18:14:33 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9842041D88
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 18:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9842041D88
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id 37303A0360;
 Wed, 26 Jul 2023 20:04:51 +0200 (CEST)
Received: from smtp04.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id 16D49A03C5;
 Wed, 26 Jul 2023 20:04:51 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp04.mail.de (Postfix) with ESMTPSA id 9C19FC002F;
 Wed, 26 Jul 2023 20:04:50 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 20:04:31 +0200
Message-Id: <20230726180433.7561-2-kilian.zinnecker@mail.de>
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
X-purgate-size: 6065
X-purgate-ID: 154282::1690394690-D8FFDC09-BECE08AA/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1690394691;
 bh=hFpWYipCc82n6X40nbWiEbnd6POgN181ZNLes7eZNVc=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=yUmc3seBwZWV+eG89jy4moigpUkLkaGPcshaq7KEDkzsKoEYhhkvGgnDMaLczZUmS
 SpCgGMzv0o6FqVvrJdu0eEKWzP/eL6tp7+qCAp0vxOgCARiLZ0t0JLXYbabe5OTxaI
 v3wR9y+Ka/cAil2BWKSeI1thRHdeJGxKKp3jyoEVFOK39xQ7kVHTZ/2Q60jDUzxaPH
 Lovyb4sCgSXrDqiX1KNeFboo/PwwIAM/S6dbRS/b/fBaVUqR4bq4xPBzuEEJI0MpDD
 osXkvFbePJVpmxUApwrF36O5sNgzazEjsgXF2pp/OEy4m1Xc75CDKT6pCWCFKiTNv9
 eIwjaDcejlqtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=yUmc3seB
Subject: [Buildroot] [PATCH v8 1/3] package/rockchip-rkbin: new package
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

This patch adds a package for the Rockchip ATF binary blobs. These
binaries are needed to build U-Boot for some Rockchip SoCs (e.g.,
RK3588). One can config a custom version and manually define which
blobs (for bl31, tpl and optee) to use from the repository.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 DEVELOPERS                                 |  3 ++
 package/Config.in                          |  1 +
 package/rockchip-rkbin/Config.in           | 47 ++++++++++++++++++++++
 package/rockchip-rkbin/rockchip-rkbin.hash |  2 +
 package/rockchip-rkbin/rockchip-rkbin.mk   | 46 +++++++++++++++++++++
 5 files changed, 99 insertions(+)
 create mode 100644 package/rockchip-rkbin/Config.in
 create mode 100644 package/rockchip-rkbin/rockchip-rkbin.hash
 create mode 100644 package/rockchip-rkbin/rockchip-rkbin.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6d8b43c31e..464d1db552 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1803,6 +1803,9 @@ F:	package/ramsmp/
 N:	Kieran Bingham <kieran.bingham@ideasonboard.com>
 F:	package/libcamera/
 
+N:	Kilian Zinnecker <kilian.zinnecker@mail.de>
+F:	package/rockchip-rkbin/
+
 N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
 F:	package/wqy-zenhei/
 
diff --git a/package/Config.in b/package/Config.in
index 1e551d17c4..1237281701 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -580,6 +580,7 @@ endmenu
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rockchip-mali/Config.in"
+	source "package/rockchip-rkbin/Config.in"
 	source "package/rpi-userland/Config.in"
 	source "package/rs485conf/Config.in"
 	source "package/rtc-tools/Config.in"
diff --git a/package/rockchip-rkbin/Config.in b/package/rockchip-rkbin/Config.in
new file mode 100644
index 0000000000..85c30c3745
--- /dev/null
+++ b/package/rockchip-rkbin/Config.in
@@ -0,0 +1,47 @@
+config BR2_PACKAGE_ROCKCHIP_RKBIN
+	bool "rockchip-rkbin"
+	depends on BR2_arm || BR2_aarch64
+	help
+	  This package provides Rockchip SoC binary blobs for U-Boot.
+
+if BR2_PACKAGE_ROCKCHIP_RKBIN
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
+	bool "Use a custom version"
+	help
+	  This option allows to use a specific version.
+if BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE
+	string "Rockchip rkbin version"
+	depends on BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
+
+endif # BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_VERSION
+	string
+	default "b4558da0860ca48bf1a571dd33ccba580b9abe23" \
+		if !BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
+	default BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE \
+		if BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME
+	string "Rockchip rkbin tpl file path"
+	help
+	  Full path to the tpl file inside the rkbin repository. The
+	  specified file will be copied and used by U-Boot as tpl.
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME
+	string "Rockchip rkbin bl31 file path"
+	help
+	  Full path to the bl31 file inside the rkbin repository. The
+	  specified file will be copied and used by U-Boot as bl31.
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME
+	string "Rockchip rkbin tee file path"
+	help
+	  Full path to the TEE file inside the rkbin repository.
+	  The specified file will be copied and used by U-Boot as
+	  TEE.
+
+endif # BR2_PACKAGE_ROCKCHIP_RKBIN
diff --git a/package/rockchip-rkbin/rockchip-rkbin.hash b/package/rockchip-rkbin/rockchip-rkbin.hash
new file mode 100644
index 0000000000..cb71226556
--- /dev/null
+++ b/package/rockchip-rkbin/rockchip-rkbin.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  bd8d19ace202ff26d1c0b4d7744cd467cd0093801dc674dde57290159eedee2b  rockchip-rkbin-b4558da0860ca48bf1a571dd33ccba580b9abe23-br1.tar.gz
diff --git a/package/rockchip-rkbin/rockchip-rkbin.mk b/package/rockchip-rkbin/rockchip-rkbin.mk
new file mode 100644
index 0000000000..74787585e8
--- /dev/null
+++ b/package/rockchip-rkbin/rockchip-rkbin.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# rockchip-rkbin
+#
+################################################################################
+
+ROCKCHIP_RKBIN_VERSION = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_VERSION))
+ROCKCHIP_RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
+ROCKCHIP_RKBIN_SITE_METHOD = git
+ROCKCHIP_RKBIN_LICENSE = PROPRIETARY
+ROCKCHIP_RKBIN_LICENSE_FILES = LICENSE
+
+ROCKCHIP_RKBIN_INSTALL_IMAGES = YES
+ROCKCHIP_RKBIN_INSTALL_TARGET = NO
+
+ifneq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME),"")
+ROCKCHIP_RKBIN_BL31_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME))
+endif
+
+ifneq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME),"")
+ROCKCHIP_RKBIN_TPL_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME))
+endif
+
+ifneq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME),"")
+ROCKCHIP_RKBIN_TEE_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME))
+endif
+
+define ROCKCHIP_RKBIN_INSTALL_IMAGES_CMDS
+	$(if $(ROCKCHIP_RKBIN_BL31_FILENAME), \
+		cp $(@D)/$(ROCKCHIP_RKBIN_BL31_FILENAME) $(BINARIES_DIR)/${ROCKCHIP_RKBIN_BL31_FILENAME##*/})
+	$(if $(ROCKCHIP_RKBIN_TPL_FILENAME), \
+		cp $(@D)/$(ROCKCHIP_RKBIN_TPL_FILENAME) $(BINARIES_DIR)/${ROCKCHIP_RKBIN_TPL_FILENAME##*/})
+	$(if $(ROCKCHIP_RKBIN_TEE_FILENAME), \
+		cp $(@D)/$(ROCKCHIP_RKBIN_TEE_FILENAME) $(BINARIES_DIR)/${ROCKCHIP_RKBIN_TEE_FILENAME##*/})
+endef
+
+ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE)),)
+$(error No custom rockchip-rkbin version specified. Check your BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE setting)
+endif
+ifeq ($(BR_BUILDING),y)
+BR_NO_CHECK_HASH_FOR += rockchip-rkbin-$(ROCKCHIP_RKBIN_VERSION)-br1.tar.gz
+endif
+endif
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

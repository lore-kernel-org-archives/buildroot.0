Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C92EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 06:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 178EB83CCE;
	Fri, 14 Jul 2023 06:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 178EB83CCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wMLUYQ0BvVQU; Fri, 14 Jul 2023 06:44:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBAB383F46;
	Fri, 14 Jul 2023 06:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBAB383F46
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 30D931BF419
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 06:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A28F60AF4
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 06:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A28F60AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3xp9Phy6byL4 for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 06:44:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA51360BC1
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA51360BC1
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 06:44:29 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id BA54DA0669;
 Fri, 14 Jul 2023 08:44:27 +0200 (CEST)
Received: from smtp03.mail.de (smtp03.bt.mail.de [10.0.121.213])
 by postfix01.mail.de (Postfix) with ESMTP id 9D9C080172;
 Fri, 14 Jul 2023 08:44:27 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp03.mail.de (Postfix) with ESMTPSA id 40E7FA03C2;
 Fri, 14 Jul 2023 08:44:27 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 08:44:11 +0200
Message-Id: <20230714064413.11433-2-kilian.zinnecker@mail.de>
In-Reply-To: <20230714064413.11433-1-kilian.zinnecker@mail.de>
References: <20230714064413.11433-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 8833
X-purgate-ID: 154282::1689317067-4D7F8647-2ED0445E/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1689317067;
 bh=EadsqpaVnKrLLT59tbCkhDPPVYK9Mu/79iOJbqanTtw=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=kOBYOTl0lNnvVgNFERHnNEGeaK/Jiv9ZO2NqmB1kWYP/f4tma73x5H31IDULe/qgp
 H/+gEOt4GCLHp5s4FxU/6vm4Aghq/aPaHO604D6L41Owxn2bQzTKiuEwjXsOy7TLze
 XqIevnllQe/dC67tJE8l3TtRTopHc6+BQTjjZttyvpm0T4OIo7e1n5d+e0pnkMOMTG
 56YIPI0RFvr/UgrdeKQHyzSRwIXTbdH+D0EpR4HkS3v6MKU7i/4fc3QxInc46nSYnA
 EuyCgL0gaEHdMutyeQ209G6Cf6Ld5SC2pVgeiGrx6wVE/zCewibb4NEym4GebBUJo9
 g9WNBM5h1sqIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=kOBYOTl0
Subject: [Buildroot] [PATCH v6 1/3] package: add rockchip-rkbin package
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
blobs (for bl31, tpl and tee) to use from the repository. The
U-Boot package is modified so that it takes the chosen binaries and
uses them during build.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 DEVELOPERS                                 |  3 +
 boot/uboot/Config.in                       |  9 +++
 boot/uboot/uboot.mk                        | 17 ++++++
 package/Config.in                          |  1 +
 package/rockchip-rkbin/Config.in           | 70 ++++++++++++++++++++++
 package/rockchip-rkbin/rockchip-rkbin.hash |  3 +
 package/rockchip-rkbin/rockchip-rkbin.mk   | 49 +++++++++++++++
 7 files changed, 152 insertions(+)
 create mode 100644 package/rockchip-rkbin/Config.in
 create mode 100644 package/rockchip-rkbin/rockchip-rkbin.hash
 create mode 100644 package/rockchip-rkbin/rockchip-rkbin.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index abea0bbb86..f6f474967a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1790,6 +1790,9 @@ F:	package/ramsmp/
 N:	Kieran Bingham <kieran.bingham@ideasonboard.com>
 F:	package/libcamera/
 
+N:	Kilian Zinnecker <kilian.zinnecker@mail.de>
+F:	package/rockchip-rkbin/
+
 N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
 F:	package/wqy-zenhei/
 
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
index 4eae8e95c3..f9f50539e5 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -207,6 +207,23 @@ endef
 UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_FW_FILES
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN),y)
+UBOOT_DEPENDENCIES += rockchip-rkbin
+define UBOOT_INSTALL_UBOOT_ROCKCHIP_BIN
+	$(INSTALL) -D -m 0644 $(@D)/u-boot-rockchip.bin $(BINARIES_DIR)/
+endef
+UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_UBOOT_ROCKCHIP_BIN
+ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE),y)
+UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31${suffix $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME))}
+endif
+ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE),y)
+UBOOT_MAKE_OPTS += ROCKCHIP_TPL=$(BINARIES_DIR)/ddr${suffix $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME))}
+endif
+ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE),y)
+$BOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee${suffix $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME))}
+endif
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
 endif
diff --git a/package/Config.in b/package/Config.in
index 3a7466d575..1aa7d299a9 100644
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
index 0000000000..0f2126654e
--- /dev/null
+++ b/package/rockchip-rkbin/Config.in
@@ -0,0 +1,70 @@
+config BR2_PACKAGE_ROCKCHIP_RKBIN
+	bool "Rockchip rkbin binary blobs"
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
+	default "d6ccfe401ca84a98ca3b85c12b9554a1a43a166c" \
+		if !BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
+	default BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE \
+		if BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE
+	bool "Rockchip rkbin tpl file"
+	default n
+
+if BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME
+	string "ddr.bin file path"
+	help
+	  Full path to the tpl file inside the rkbin repository. The
+	  specified file will be copied and used by U-Boot as tpl.
+
+endif # BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE
+	bool "Rockchip rkbin bl31 file"
+	default n
+
+if BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME
+	string "bl31.elf file path"
+	help
+	  Full path to the bl31 file inside the rkbin repository. The
+	  specified file will be copied and used by U-Boot as bl31.
+
+endif # BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE
+	bool "Rockchip rkbin optee file"
+	default n
+
+if BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME
+	string "tee.elf file path"
+	help
+	  Full path to the TEE file inside the rkbin repository.
+	  The specified file will be copied and used by U-Boot as
+	  TEE.
+endif # BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE
+
+endif # BR2_PACKAGE_ROCKCHIP_RKBIN
diff --git a/package/rockchip-rkbin/rockchip-rkbin.hash b/package/rockchip-rkbin/rockchip-rkbin.hash
new file mode 100644
index 0000000000..5659ecf719
--- /dev/null
+++ b/package/rockchip-rkbin/rockchip-rkbin.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  6f7b58fe35108101031ebfd3cc6eb7a186f258a1cdbd93c4256888997ab52c8f  rockchip-rkbin-d6ccfe401ca84a98ca3b85c12b9554a1a43a166c-br1.tar.gz
+
diff --git a/package/rockchip-rkbin/rockchip-rkbin.mk b/package/rockchip-rkbin/rockchip-rkbin.mk
new file mode 100644
index 0000000000..7b2f17f7e2
--- /dev/null
+++ b/package/rockchip-rkbin/rockchip-rkbin.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# rockchip-rkbin
+#
+################################################################################
+
+
+ROCKCHIP_RKBIN_VERSION = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_VERSION))
+ROCKCHIP_RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
+ROCKCHIP_RKBIN_SITE_METHOD = git
+ROCKCHIP_RKBIN_LICENSE = PROPRIETARY
+ROCKCHIP_RKBIN_REDISTRIBUTE = NO
+
+ROCKCHIP_RKBIN_INSTALL_IMAGES = YES
+ROCKCHIP_RKBIN_INSTALL_TARGET = NO
+
+ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE),y)
+ROCKCHIP_RKBIN_BL31_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME))
+BL31_EXTENSION=${suffix $(ROCKCHIP_RKBIN_BL31_FILENAME)}
+endif
+
+ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE),y)
+ROCKCHIP_RKBIN_TPL_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME))
+TPL_EXTENSION=${suffix $(ROCKCHIP_RKBIN_TPL_FILENAME)}
+endif
+
+ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE),y)
+ROCKCHIP_RKBIN_TEE_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME))
+TEE_EXTENSION=${suffix $(ROCKCHIP_RKBIN_TEE_FILENAME)}
+endif
+
+define ROCKCHIP_RKBIN_INSTALL_IMAGES_CMDS
+	$(if $(filter y, $(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE)), \
+		cp $(@D)/$(ROCKCHIP_RKBIN_BL31_FILENAME) $(BINARIES_DIR)/bl31$(BL31_EXTENSION))
+	$(if $(filter y, $(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE)), \
+		cp $(@D)/$(ROCKCHIP_RKBIN_TPL_FILENAME) $(BINARIES_DIR)/ddr$(TPL_EXTENSION))
+	$(if $(filter y, $(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE)), \
+		cp $(@D)/$(ROCKCHIP_RKBIN_TEE_FILENAME) $(BINARIES_DIR)/tee$(TEE_EXTENSION))
+endef
+
+ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE)),)
+$(error No custom rockchip-rkbin version specified. Check your BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE setting)
+endif
+ROCKCHIP_SOURCE = rockchip-rkbin-$(ROCKCHIP_RKBIN_VERSION)-br1.tar.gz
+BR_NO_CHECK_HASH_FOR += $(ROCKCHIP_SOURCE)
+endif
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

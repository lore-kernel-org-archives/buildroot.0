Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3EEEB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 12:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 128E681AF3;
	Sun,  9 Jul 2023 12:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 128E681AF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rwSJoajjVkQI; Sun,  9 Jul 2023 12:34:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E530181429;
	Sun,  9 Jul 2023 12:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E530181429
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5571B1BF57C
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 12:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DB2940570
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 12:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DB2940570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eXmD2x_hatYY for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 12:34:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82A3B410B0
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82A3B410B0
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 12:34:06 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id 83570A0811;
 Sun,  9 Jul 2023 14:34:04 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix01.mail.de (Postfix) with ESMTP id 60BFF80290;
 Sun,  9 Jul 2023 14:34:04 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id D211A1001A8;
 Sun,  9 Jul 2023 14:34:03 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun,  9 Jul 2023 14:33:53 +0200
Message-Id: <20230709123355.17002-2-kilian.zinnecker@mail.de>
In-Reply-To: <20230709123355.17002-1-kilian.zinnecker@mail.de>
References: <20230709123355.17002-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 8293
X-purgate-ID: 154282::1688906044-5CFFF7B6-8EFD0221/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688906044;
 bh=xBXupQlB84rtcGsd8ALZk9NON1kujuNJdfyfxr02Q44=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=yth+/zajpvDxbcABH9C9U2hkoxsmOaMt7jW6Fb3ebAyEdWYa3VxUKit78BsRjy5jh
 FBxf9wvZs7o/2mYbLzMy1CSIvAxEf5u78OOD6/simjE7ZTrbwsC0E7XkUeOZ5QDehK
 qTGsqICHUQAzxxnS/zBPdof8rRbDii8wvi4JFmdjwNI+Ht+YKFAmEGxNJOyvFeDFUn
 0thTZEocdcMLoehQzTQB4bfX7x9H/0/7SZZv47oWYbKFthG8EO6LDaTIg7zXp0XmRp
 H2c290D6jMCPG63NorHWpp2NzGCHjKtjp0Dj+Z/CGMpjgoDnK7vTlf8QQAGTni/l8a
 cMOCIHf5U9PzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=yth+/zaj
Subject: [Buildroot] [PATCH v5 1/3] package: add rockchip-rkbin package
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
blobs (for bl31, tpl and optee) to use from the repository. The
U-Boot package is modified so that it takes the chosen binaries and
uses them during build.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 DEVELOPERS                                 |  3 ++
 boot/uboot/Config.in                       |  9 ++++
 boot/uboot/uboot.mk                        | 14 +++++
 package/Config.in                          |  1 +
 package/rockchip-rkbin/Config.in           | 62 ++++++++++++++++++++++
 package/rockchip-rkbin/rockchip-rkbin.hash |  3 ++
 package/rockchip-rkbin/rockchip-rkbin.mk   | 46 ++++++++++++++++
 7 files changed, 138 insertions(+)
 create mode 100644 package/rockchip-rkbin/Config.in
 create mode 100644 package/rockchip-rkbin/rockchip-rkbin.hash
 create mode 100644 package/rockchip-rkbin/rockchip-rkbin.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 188c579010..8e603ff3f8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1776,6 +1776,9 @@ F:	package/ramsmp/
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
index 4eae8e95c3..143432d55b 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -207,6 +207,20 @@ endef
 UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_FW_FILES
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN),y)
+UBOOT_DEPENDENCIES += rockchip-rkbin
+ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE),y)
+UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.elf
+endif
+ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE),y)
+UBOOT_MAKE_OPTS += ROCKCHIP_TPL=$(BINARIES_DIR)/ddr.bin
+endif
+ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILE),y)
+UBOOT_DEPENDENCIES += optee-os
+UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
+endif
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
index 0000000000..5cc9bd0ab5
--- /dev/null
+++ b/package/rockchip-rkbin/Config.in
@@ -0,0 +1,62 @@
+config BR2_PACKAGE_ROCKCHIP_RKBIN
+	bool "Rockchip rkbin binary blobs"
+	depends on BR2_arm || BR2_aarch64
+	help
+	  This package provides Rockchip SoC binary blobs for U-Boot.
+
+if BR2_PACKAGE_ROCKCHIP_RKBIN
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_LATEST_VERSION
+	bool "d6ccfe401ca84a98ca3b85c12b9554a1a43a166c"
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
+	bool "Custom version"
+	help
+	  This option allows to use a specific version.
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE
+	string "Rockchip rkbin version"
+	depends on BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_VERSION
+	string
+	default "d6ccfe401ca84a98ca3b85c12b9554a1a43a166c" \
+		if BR2_PACKAGE_ROCKCHIP_RKBIN_LATEST_VERSION
+	default BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE \
+		if BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE
+	bool "Rockchip rkbin tpl file"
+	default n
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME
+	string "ddr.bin file path"
+	depends on BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE
+	help
+	  Full path to the tpl file inside the rkbin repository. The
+	  specified file will be copied and used by U-Boot as tpl.
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE
+	bool "Rockchip rkbin bl31 file"
+	default n
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME
+	string "bl31.elf file path"
+	depends on BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE
+	help
+	  Full path to the bl31 file inside the rkbin repository. The
+	  specified file will be copied and used by U-Boot as bl31.
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILE
+	bool "Rockchip rkbin optee file"
+	default n
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILENAME
+	string "optee.elf file path"
+	depends on BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILE
+	help
+	  Full path to the optee file inside the rkbin repository.
+          The specified file will be copied and used by U-Boot as
+          optee.
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
index 0000000000..ea1afd56d3
--- /dev/null
+++ b/package/rockchip-rkbin/rockchip-rkbin.mk
@@ -0,0 +1,46 @@
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
+ROCKCHIP_RKBIN_INSTALL_STAGING = YES
+ROCKCHIP_RKBIN_INSTALL_TARGET = NO
+
+ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE),y)
+ROCKCHIP_RKBIN_BL31_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME))
+endif
+
+ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE),y)
+ROCKCHIP_RKBIN_TPL_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME))
+endif
+
+ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILE),y)
+ROCKCHIP_RKBIN_OPTEE_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILENAME))
+endif
+
+define ROCKCHIP_RKBIN_INSTALL_STAGING_CMDS
+	$(if $(filter y, $(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE)), \
+		cp $(@D)/$(ROCKCHIP_RKBIN_BL31_FILENAME) $(BINARIES_DIR)/bl31.elf)
+	$(if $(filter y, $(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE)), \
+		cp $(@D)/$(ROCKCHIP_RKBIN_TPL_FILENAME) $(BINARIES_DIR)/ddr.bin)
+	$(if $(filter y, $(BR2_PACKAGE_ROCKCHIP_RKBIN_OPTEE_FILE)), \
+		cp $(@D)/$(ROCKCHIP_RKBIN_OPTEE_FILENAME) $(BINARIES_DIR)/tee.elf)
+endef
+
+ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE)),)
+$(error No custom rockchip-rkbin version specified. Check your BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE setting)
+endif # qstrip BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE
+ROCKCHIP_SOURCE = rockchip-rkbin-$(ROCKCHIP_RKBIN_VERSION)-br1.tar.gz
+BR_NO_CHECK_HASH_FOR += $(ROCKCHIP_SOURCE)
+endif # BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

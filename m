Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E3EC19F29
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 16:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 875C983F60;
	Thu, 28 Jul 2022 16:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 875C983F60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ly0o2OGhY6lT; Thu, 28 Jul 2022 16:40:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C4DC83EDE;
	Thu, 28 Jul 2022 16:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C4DC83EDE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 828A41BF20B
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 16:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BF324192B
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 16:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BF324192B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gPXueCeMyadx for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 16:40:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07A6F4192D
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07A6F4192D
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 16:40:12 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26SGe7PK002321;
 Thu, 28 Jul 2022 11:40:07 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26SGe7q4039474
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 28 Jul 2022 11:40:07 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Jul 2022 11:40:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Jul 2022 11:40:06 -0500
Received: from uda0500531.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26SGe66O038992;
 Thu, 28 Jul 2022 11:40:06 -0500
To: <buildroot@buildroot.org>
Date: Thu, 28 Jul 2022 11:40:04 -0500
Message-ID: <20220728164006.16652-3-x-shi@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220728164006.16652-1-x-shi@ti.com>
References: <20220728164006.16652-1-x-shi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1659026407;
 bh=YdDjlleud4nlLwqG19o97nqDcxjBk/8d8XrdJT+0qnc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=FeWskBclXvXOWlPkUKmZHJs7z+eqUA0tYQuOTVKL7Waj9PSsYYCbQWDVv1GUUdQFD
 WVuoj583+9uEn9q3YkZMI+L4OD6dRcaq1JHQ6BE2GsLe2xts6Zg6FJ/+n+ebfsjNFF
 wRoh1+xdDE/EXpd5OqqoMMVU0MYYKcs4/FRQFgek=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=FeWskBcl
Subject: [Buildroot] [PATCH v2 2/4] boot/ti-k3-r5-loader: add new package
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
From: Xuanhao Shi via buildroot <buildroot@buildroot.org>
Reply-To: Xuanhao Shi <x-shi@ti.com>
Cc: Anand Gadiyar <gadiyar@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a separate U-Boot package that would build
the intermediate spl binary for the R5 core on TI's k3 boards.
Usually, the resulting spl will be used for k3-image-gen
to build the full R5 boot binary tiboot3.bin.

Signed-off-by: Xuanhao Shi <x-shi@ti.com>
---
 boot/Config.in                            |  1 +
 boot/ti-k3-r5-loader/Config.in            | 13 +++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash |  2 ++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk   | 42 +++++++++++++++++++++++
 4 files changed, 58 insertions(+)
 create mode 100644 boot/ti-k3-r5-loader/Config.in
 create mode 100644 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
 create mode 100644 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk

diff --git a/boot/Config.in b/boot/Config.in
index 40472ae07d..ce17b2df6b 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -22,6 +22,7 @@ source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/sun20i-d1-spl/Config.in"
 source "boot/syslinux/Config.in"
+source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
 
diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
new file mode 100644
index 0000000000..7f5fa0b4c8
--- /dev/null
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -0,0 +1,13 @@
+config BR2_TARGET_TI_K3_R5_LOADER
+	bool "ti-k3-r5-loader"
+	help
+	  Separate U-Boot build for R5 cores on TI's k3 boards.
+	  Usually used to build tiboot3.bin with k3-image-gen.
+
+config BR2_TARGET_TI_K3_R5_LOADER_BOARD
+	string "Board to configure for"
+	depends on BR2_TARGET_TI_K3_R5_LOADER
+	help
+	  Specify the board to configure the bootloader for.
+	  This should be the name of a board under board/ti
+	  For example, "am64x_evm".
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 100644
index 0000000000..fb6ce7c2a6
--- /dev/null
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  6d69d5e4635cb3fa7852bf15f88ca342ef7740196e71961d3572deb58ba44bea  u-boot-2022.10-rc1.tar.bz2
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
new file mode 100644
index 0000000000..ee88053392
--- /dev/null
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# ti-k3-r5-loader.mk
+#
+################################################################################
+
+TI_K3_R5_LOADER_VERSION = 2022.10-rc1
+TI_K3_R5_LOADER_SITE = https://ftp.denx.de/pub/u-boot
+TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.bz2
+TI_K3_R5_LOADER_LICENSE = GPL-2.0+
+TI_K3_R5_LOADER_LICENSE_FILES = Licenses/gpl-2.0.txt
+TI_K3_R5_LOADER_CPE_ID_VENDOR = denx
+TI_K3_R5_LOADER_CPE_ID_PRODUCT = u-boot
+TI_K3_R5_LOADER_INSTALL_IMAGES = YES
+TI_K3_R5_LOADER_DEPENDENCIES = \
+	host-pkgconf \
+	$(BR2_MAKE_HOST_DEPENDENCY) \
+	host-arm-gnu-toolchain
+
+TI_K3_R5_LOADER_MAKE = $(BR2_MAKE)
+TI_K3_R5_LOADER_MAKE_ENV = $(TARGET_MAKE_ENV)
+TI_K3_R5_LOADER_KCONFIG_DEPENDENCIES = \
+	toolchain \
+	$(BR2_MAKE_HOST_DEPENDENCY) \
+	$(BR2_BISON_HOST_DEPENDENCY) \
+	$(BR2_FLEX_HOST_DEPENDENCY)
+
+TI_K3_R5_LOADER_BOARD = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_BOARD))
+TI_K3_R5_LOADER_KCONFIG_DEFCONFIG = $(TI_K3_R5_LOADER_BOARD)_r5_defconfig
+TI_K3_R5_LOADER_MAKE_OPTS += \
+	CROSS_COMPILE=$(HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR)/bin/arm-none-eabi- \
+	ARCH=arm
+
+define TI_K3_R5_LOADER_BUILD_CMDS
+	$(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
+endef
+
+define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
+	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
+endef
+
+$(eval $(kconfig-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

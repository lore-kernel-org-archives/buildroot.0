Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D69DC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 16:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B288942508;
	Tue, 26 Jul 2022 16:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B288942508
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4iOkjQBJDA0s; Tue, 26 Jul 2022 16:51:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B85AE422EF;
	Tue, 26 Jul 2022 16:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B85AE422EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D2DA1BF3D9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 329AA60E44
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 329AA60E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JmAuwhyUaJCC for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 16:50:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C973860E37
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C973860E37
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 16:50:47 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QGogtq022280;
 Tue, 26 Jul 2022 11:50:42 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QGogH8012208
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 26 Jul 2022 11:50:42 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 11:50:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 11:50:41 -0500
Received: from uda0500531.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QGofBo095306;
 Tue, 26 Jul 2022 11:50:41 -0500
To: <buildroot@buildroot.org>
Date: Tue, 26 Jul 2022 11:50:39 -0500
Message-ID: <20220726165041.17584-3-x-shi@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220726165041.17584-1-x-shi@ti.com>
References: <20220726165041.17584-1-x-shi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1658854242;
 bh=+4yZP6Lr4I2TysGP9Zb8/iYfu2aeM1cAuc5VELQ2UKQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=wfqUs84DAWE9wMV4HDO/SVyiAkhBP/K5/NjN2bXP1WXaPgHvRwz4nyZYCiD3S8IWH
 iV/DVXwFJ77gxSQNLQV5KCQRBZkJ9h4YOuncNZWNO2rUcxGXcS1j9KYifvnhrl8Utg
 s/XUE9c4L535beDm8Oc5bGcM1zZsUOkoU4bcdsD4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=wfqUs84D
Subject: [Buildroot] [PATCH 2/4] package/k3-image-gen: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

k3-image-gen is a package that helps support TI's k3 SoCs
by building a separate boot binary, tiboot3.bin, on the R core.

https://git.ti.com/cgit/k3-image-gen/k3-image-gen/about/
Signed-off-by: Xuanhao Shi <x-shi@ti.com>
---
 package/Config.in                      |  1 +
 package/k3-image-gen/Config.in         | 37 ++++++++++++++++++++++
 package/k3-image-gen/k3-image-gen.hash |  2 ++
 package/k3-image-gen/k3-image-gen.mk   | 43 ++++++++++++++++++++++++++
 4 files changed, 83 insertions(+)
 create mode 100644 package/k3-image-gen/Config.in
 create mode 100644 package/k3-image-gen/k3-image-gen.hash
 create mode 100644 package/k3-image-gen/k3-image-gen.mk

diff --git a/package/Config.in b/package/Config.in
index d264449b30..c8a3967f55 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -509,6 +509,7 @@ endmenu
 	source "package/ipmiutil/Config.in"
 	source "package/irda-utils/Config.in"
 	source "package/iucode-tool/Config.in"
+	source "package/k3-image-gen/Config.in"
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
 	source "package/libiec61850/Config.in"
diff --git a/package/k3-image-gen/Config.in b/package/k3-image-gen/Config.in
new file mode 100644
index 0000000000..3522382677
--- /dev/null
+++ b/package/k3-image-gen/Config.in
@@ -0,0 +1,37 @@
+config BR2_PACKAGE_K3_IMAGE_GEN
+	bool "k3-image-gen"
+	help
+	  Using TI's k3-image-gen to build a separate bare metal
+	  boot binary from a separate spl. Currently supports
+	  version 08.04.00.004 as default.
+
+	  https://git.ti.com/cgit/k3-image-gen/k3-image-gen/
+
+menu "U-Boot SPL Build Options"
+	depends on BR2_PACKAGE_K3_IMAGE_GEN
+
+config BR2_PACKAGE_K3_IMAGE_GEN_UBOOT_SPL_DEFCONFIG
+	string "U-Boot SPL defconfig for image gen"
+	help
+	  This is the defconfig without the suffix for the separate SPL.
+	  For example, "am64x_evm_r5" for AM64X boards.
+
+endmenu
+
+menu "k3-image-gen Build Options"
+	depends on BR2_PACKAGE_K3_IMAGE_GEN
+
+config BR2_PACKAGE_K3_IMAGE_GEN_SOC
+	string "SOC type for image gen"
+	help
+	  The target board option for image gen.
+	  For example, "am64x" for AM64X boards.
+
+config BR2_PACKAGE_K3_IMAGE_GEN_CONFIG
+	string "CONFIG type for image gen"
+	help
+	  The board config option for image gen.
+	  Usually "sk" or "evm".
+
+endmenu
+
diff --git a/package/k3-image-gen/k3-image-gen.hash b/package/k3-image-gen/k3-image-gen.hash
new file mode 100644
index 0000000000..393c7726cd
--- /dev/null
+++ b/package/k3-image-gen/k3-image-gen.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 8446d4f169b894304593f0c325028f25e401d0b793d6fd3aa9efa3da937222d2  k3-image-gen-08.04.00.004.tar.gz
diff --git a/package/k3-image-gen/k3-image-gen.mk b/package/k3-image-gen/k3-image-gen.mk
new file mode 100644
index 0000000000..5449a2d0a5
--- /dev/null
+++ b/package/k3-image-gen/k3-image-gen.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+#k3-image-gen
+#
+################################################################################
+
+K3_IMAGE_GEN_VERSION = 08.04.00.004
+K3_IMAGE_GEN_SITE = https://git.ti.com/cgit/k3-image-gen/k3-image-gen/snapshot
+K3_IMAGE_GEN_SOURCE = k3-image-gen-$(K3_IMAGE_GEN_VERSION).tar.gz
+K3_IMAGE_GEN_LICENSE = GPL-2.0+
+
+K3_IMAGE_GEN_MAKE = $(BR2_MAKE)
+
+K3_IMAGE_GEN_UBOOT_SPL_ARCH = arm
+K3_IMAGE_GEN_UBOOT_SPL_CROSS = \
+$(HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR)/bin/arm-none-eabi-
+K3_IMAGE_GEN_UBOOT_SPL_DEFCONFIG = \
+$(call qstrip, $(BR2_PACKAGE_K3_IMAGE_GEN_UBOOT_SPL_DEFCONFIG))_defconfig
+
+K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_PACKAGE_K3_IMAGE_GEN_SOC))
+K3_IMAGE_GEN_CONFIG = $(call qstrip,$(BR2_PACKAGE_K3_IMAGE_GEN_CONFIG))
+
+K3_IMAGE_GEN_DEPENDENCIES += host-arm-gnu-toolchain uboot
+
+K3_IMAGE_GEN_MAKE_OPTS += \
+	SOC=$(K3_IMAGE_GEN_SOC) \
+	CONFIG=$(K3_IMAGE_GEN_CONFIG) \
+	CROSS_COMPILE=$(K3_IMAGE_GEN_UBOOT_SPL_CROSS) \
+	SBL=$(BINARIES_DIR)/u-boot-spl.bin \
+	O=$(BINARIES_DIR) \
+	BIN_DIR=$(BINARIES_DIR) 
+
+define K3_IMAGE_GEN_BUILD_CMDS
+	$(UBOOT_MAKE) -C $(BUILD_DIR)/uboot* ARCH=$(K3_IMAGE_GEN_UBOOT_SPL_ARCH) \
+	CROSS_COMPILE=$(K3_IMAGE_GEN_UBOOT_SPL_CROSS) $(K3_IMAGE_GEN_UBOOT_SPL_DEFCONFIG)
+	$(UBOOT_MAKE) -C $(BUILD_DIR)/uboot* ARCH=$(K3_IMAGE_GEN_UBOOT_SPL_ARCH) \
+	CROSS_COMPILE=$(K3_IMAGE_GEN_UBOOT_SPL_CROSS)
+	cp $(BUILD_DIR)/uboot*/spl/u-boot-spl.bin $(BINARIES_DIR)
+	$(K3_IMAGE_GEN_MAKE) -C $(@D) $(K3_IMAGE_GEN_MAKE_OPTS)
+	cp $(@D)/tiboot3.bin $(BINARIES_DIR)
+endef
+
+$(eval $(generic-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

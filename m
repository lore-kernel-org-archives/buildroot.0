Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A6BC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 16:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF34983EE4;
	Thu, 28 Jul 2022 16:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF34983EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mq0LL56CUc2M; Thu, 28 Jul 2022 16:40:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6AD883E81;
	Thu, 28 Jul 2022 16:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6AD883E81
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C6D41C1190
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 16:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1407060AE0
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 16:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1407060AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eNw3w7JZis2V for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 16:40:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 562B1607C9
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 562B1607C9
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 16:40:11 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26SGe7mb088414;
 Thu, 28 Jul 2022 11:40:07 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26SGe7vG044702
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 28 Jul 2022 11:40:07 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Jul 2022 11:40:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Jul 2022 11:40:06 -0500
Received: from uda0500531.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26SGe66P038992;
 Thu, 28 Jul 2022 11:40:06 -0500
To: <buildroot@buildroot.org>
Date: Thu, 28 Jul 2022 11:40:05 -0500
Message-ID: <20220728164006.16652-4-x-shi@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220728164006.16652-1-x-shi@ti.com>
References: <20220728164006.16652-1-x-shi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1659026407;
 bh=WbUX2lEfK3pl+YvQnGACuCaVMdUfkS2gNABoBHjRgwg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=rQNEjx65qk5gMpp6GY8s4hmA93UFTSEvNsD56uz14puWTdHu0hkA9/3qvi9L5WA4l
 8HrsbpwFAKeF5BRGB+l0MWTA676MCvEzybsua48Vbz9tv1P/97M6CQvuNrkVYZaT9E
 5NH3Cpl7+sptDJMdUwC2hEBid3qMWftb2dhV/sN4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=rQNEjx65
Subject: [Buildroot] [PATCH v2 3/4] boot/ti-k3-image-gen: add new package
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

This is the image generator that builds the full boot binary,
tiboot3.bin, for the R5 core on TI's k3 devices.
This requires the R5 spl output from the ti-k3-r5-loader package.

https://git.ti.com/cgit/k3-image-gen/k3-image-gen
Signed-off-by: Xuanhao Shi <x-shi@ti.com>
---
 boot/Config.in                            |  1 +
 boot/ti-k3-image-gen/Config.in            | 24 +++++++++++++++++
 boot/ti-k3-image-gen/ti-k3-image-gen.hash |  2 ++
 boot/ti-k3-image-gen/ti-k3-image-gen.mk   | 33 +++++++++++++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100644 boot/ti-k3-image-gen/Config.in
 create mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.hash
 create mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.mk

diff --git a/boot/Config.in b/boot/Config.in
index ce17b2df6b..1b25bacfee 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -22,6 +22,7 @@ source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/sun20i-d1-spl/Config.in"
 source "boot/syslinux/Config.in"
+source "boot/ti-k3-image-gen/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3-image-gen/Config.in
new file mode 100644
index 0000000000..0b66e1c8a5
--- /dev/null
+++ b/boot/ti-k3-image-gen/Config.in
@@ -0,0 +1,24 @@
+config BR2_TARGET_TI_K3_IMAGE_GEN
+	bool "ti-k3-image-gen"
+	select BR2_TARGET_TI_K3_R5_LOADER
+	help
+	  Using TI's k3-image-gen to build a separate bare metal
+	  boot binary from a separate spl. Currently supports
+	  version 08.04.00.005 as default.
+
+	  https://git.ti.com/cgit/k3-image-gen/k3-image-gen/
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_SOC
+	string "SOC type for image gen"
+	depends on BR2_TARGET_TI_K3_IMAGE_GEN
+	help
+	  The target SoC option for image gen.
+	  For example, "am64x" for AM64X boards.
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG
+	string "CONFIG type for image gen"
+	depends on BR2_TARGET_TI_K3_IMAGE_GEN
+	help
+	  The board config option for image gen.
+	  Usually "sk" or "evm".
+
diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.hash b/boot/ti-k3-image-gen/ti-k3-image-gen.hash
new file mode 100644
index 0000000000..e307a02a67
--- /dev/null
+++ b/boot/ti-k3-image-gen/ti-k3-image-gen.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  e585dc868ada21ef3389159541d669b88bc406b453470e92da85d9222d271c96  k3-image-gen-08.04.00.005.tar.gz
diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.mk b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
new file mode 100644
index 0000000000..4892016fe1
--- /dev/null
+++ b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# ti-k3-image-gen
+#
+################################################################################
+
+TI_K3_IMAGE_GEN_VERSION = 08.04.00.005
+TI_K3_IMAGE_GEN_SITE = https://git.ti.com/cgit/k3-image-gen/k3-image-gen/snapshot
+TI_K3_IMAGE_GEN_SOURCE = k3-image-gen-$(TI_K3_IMAGE_GEN_VERSION).tar.gz
+TI_K3_IMAGE_GEN_LICENSE = BSD-3-Clause
+TI_K3_IMAGE_GEN_LICENSE_FILES = system-firmware-image-gen-1.0-manifest.html
+TI_K3_IMAGE_GEN_INSTALL_IMAGES = YES
+TI_K3_IMAGE_GEN_DEPENDENCIES = host-arm-gnu-toolchain ti-k3-r5-loader
+TI_K3_IMAGE_GEN_MAKE = $(BR2_MAKE)
+TI_K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC))
+TI_K3_IMAGE_GEN_CONFIG = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG))
+TI_K3_IMAGE_GEN_MAKE_OPTS = \
+	SOC=$(TI_K3_IMAGE_GEN_SOC) \
+	CONFIG=$(TI_K3_IMAGE_GEN_CONFIG) \
+	CROSS_COMPILE=$(HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR)/bin/arm-none-eabi- \
+	SBL=$(BINARIES_DIR)/r5-u-boot-spl.bin \
+	O=$(BINARIES_DIR) \
+	BIN_DIR=$(BINARIES_DIR) 
+
+define TI_K3_IMAGE_GEN_BUILD_CMDS
+	$(TI_K3_IMAGE_GEN_MAKE) -C $(@D) $(TI_K3_IMAGE_GEN_MAKE_OPTS)
+endef
+
+define TI_K3_IMAGE_GEN_INSTALL_IMAGES_CMDS
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

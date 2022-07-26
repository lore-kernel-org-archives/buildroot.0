Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1A9C04A68
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 16:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABCC442300;
	Tue, 26 Jul 2022 16:50:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABCC442300
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2XDWy-Ltl__o; Tue, 26 Jul 2022 16:50:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51DCC422F0;
	Tue, 26 Jul 2022 16:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51DCC422F0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 25C591BF3D9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F244B422EF
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F244B422EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id orylfts-YefR for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 16:50:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73D6A41655
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73D6A41655
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 16:50:46 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QGogkR094312;
 Tue, 26 Jul 2022 11:50:42 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QGogY6032248
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 26 Jul 2022 11:50:42 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 11:50:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 11:50:42 -0500
Received: from uda0500531.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QGofBn095306;
 Tue, 26 Jul 2022 11:50:41 -0500
To: <buildroot@buildroot.org>
Date: Tue, 26 Jul 2022 11:50:38 -0500
Message-ID: <20220726165041.17584-2-x-shi@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220726165041.17584-1-x-shi@ti.com>
References: <20220726165041.17584-1-x-shi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1658854242;
 bh=QQr1Lb1QKSpFgEoOs1kl3aJmzXpoY6ZfE0h2g4jPdTA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=eRl6Fgf8Hs9vNhgzdRqutBV/jPSvVVD4eFgJYXMvToyM3N0CAuubNLauFedktfLsA
 6un1d5JYf0deEzF/Uaad/215RaPeExfZoNcJs61IHmGzKcewvOcg/iBN+mUdSNNSKU
 4xgtRh/u36LzRDICRgMtXSVCD/7rGF247tayheZA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=eRl6Fgf8
Subject: [Buildroot] [PATCH 1/4] package/arm-gnu-toolchain: add version
 selection
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

Adds a way to select a custom toolchain link and
source instead of always using verion 11.2 due
to bugs in the newest version.

Signed-off-by: Xuanhao Shi <x-shi@ti.com>
---
 package/Config.in.host                        |  1 +
 package/arm-gnu-toolchain/Config.in.host      | 38 +++++++++++++++++++
 .../arm-gnu-toolchain/arm-gnu-toolchain.mk    |  7 ++++
 3 files changed, 46 insertions(+)
 create mode 100644 package/arm-gnu-toolchain/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 8078a8304d..ef04cba755 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -3,6 +3,7 @@ menu "Host utilities"
 	source "package/abootimg/Config.in.host"
 	source "package/aespipe/Config.in.host"
 	source "package/android-tools/Config.in.host"
+	source "package/arm-gnu-toolchain/Config.in.host"
 	source "package/asn1c/Config.in.host"
 	source "package/babeltrace2/Config.in.host"
 	source "package/bmap-tools/Config.in.host"
diff --git a/package/arm-gnu-toolchain/Config.in.host b/package/arm-gnu-toolchain/Config.in.host
new file mode 100644
index 0000000000..25d0af1d04
--- /dev/null
+++ b/package/arm-gnu-toolchain/Config.in.host
@@ -0,0 +1,38 @@
+config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN
+	bool "host arm-gnu-toolchain"
+	help
+	  Separate ARM32 cross-compilation toolchain 
+	  for some AArch64 platforms.
+
+menu "host arm-gnu-toolchain version"
+	depends on BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN
+
+choice
+	bool "host arm-gnu-toolchain version"
+
+config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_DEFAULT
+	bool "Version 11.2-2022.02"
+	help
+	  Use version 11.2.
+
+config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM
+	bool "Custom archived sources"
+	help
+	  Specify custom archive for the toolchain.
+
+endchoice
+
+if BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM
+
+config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM_SITE
+	string "Site of the toolchain"
+
+config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM_SOURCE
+	string "Source of the toolchain"
+
+config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM_LICENSE
+	string "License of the toolchain"
+
+endif
+
+endmenu
diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.mk b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
index 3bfd516751..d9454f70cc 100644
--- a/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
+++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
@@ -4,10 +4,17 @@
 #
 ################################################################################
 
+ifeq ($(BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM),y)
+ARM_GNU_TOOLCHAIN_SITE = $(call qstrip,$(BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM_SITE))
+ARM_GNU_TOOLCHAIN_SOURCE = $(call qstrip,$(BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM_SOURCE))
+ARM_GNU_TOOLCHAIN_LICENSE = $(call qstrip,$(BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM_LICENSE))
+BR_NO_CHECK_HASH_FOR += $(ARM_GNU_TOOLCHAIN_SOURCE)
+else
 ARM_GNU_TOOLCHAIN_VERSION = 11.2-2022.02
 ARM_GNU_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(ARM_GNU_TOOLCHAIN_VERSION)/binrel/
 ARM_GNU_TOOLCHAIN_SOURCE = gcc-arm-$(ARM_GNU_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
 ARM_GNU_TOOLCHAIN_LICENSE = GPL-3.0+
+endif
 
 HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/gcc-arm-none-eabi
 
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

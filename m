Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1166EEB64D9
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 00:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94C1641F25;
	Fri, 16 Jun 2023 00:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94C1641F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ftX-dYsuOUH3; Fri, 16 Jun 2023 00:37:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BE4241F47;
	Fri, 16 Jun 2023 00:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BE4241F47
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 352881BF286
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 00:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E4F760D52
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 00:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E4F760D52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AjfaCql3RONJ for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 00:37:41 +0000 (UTC)
X-Greylist: delayed 00:13:26 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F289460BAE
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F289460BAE
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 00:37:40 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35G0ODeH098604
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 19:24:13 -0500
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35G0ODCZ106997
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 19:24:13 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Jun 2023 19:24:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Jun 2023 19:24:13 -0500
Received: from dasso.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35G0OCSH015831;
 Thu, 15 Jun 2023 19:24:13 -0500
To: <buildroot@buildroot.org>
Date: Thu, 15 Jun 2023 19:23:57 -0500
Message-ID: <20230616002359.4139814-9-dannenberg@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616002359.4139814-1-dannenberg@ti.com>
References: <20230616002359.4139814-1-dannenberg@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1686875053;
 bh=cMAIRTgVfJskxae8wEoCJaOQKE1934Nwu0Ev1eww74c=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Nui0OOM4s6yezPxxxQE3f8Ak5yb/+FSDy28GmUX9qM3EWNhf0tfOqBhqqVyzOu4Ul
 3ZUGQaxqmSBg80vwlC3wSH66mYQv68rFZaGjVpIgq5JPhKLX0tbzsHb6qGyS/6826i
 SUH/KdYK8OpgYzG1mD0M7SfdwB9RmynLXFkJX364=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Nui0OOM4
Subject: [Buildroot] [PATCH v8 08/10] package/ti-rogue-km: new package
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package adds the kernel module for the Rogue graphics
accelerator of the following Texas Instuments SoCs: AM62,
J721E, J721S2, and J784S4.

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
---
 package/Config.in                    |  1 +
 package/ti-rogue-km/Config.in        | 28 +++++++++++++++++++++
 package/ti-rogue-km/ti-rogue-km.hash |  3 +++
 package/ti-rogue-km/ti-rogue-km.mk   | 37 ++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)
 create mode 100644 package/ti-rogue-km/Config.in
 create mode 100644 package/ti-rogue-km/ti-rogue-km.hash
 create mode 100644 package/ti-rogue-km/ti-rogue-km.mk

diff --git a/package/Config.in b/package/Config.in
index bff090a661..96ef0d72de 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -613,6 +613,7 @@ endmenu
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
+	source "package/ti-rogue-km/Config.in"
 	source "package/ti-sgx-demos/Config.in"
 	source "package/ti-sgx-km/Config.in"
 	source "package/ti-sgx-um/Config.in"
diff --git a/package/ti-rogue-km/Config.in b/package/ti-rogue-km/Config.in
new file mode 100644
index 0000000000..b1565929d5
--- /dev/null
+++ b/package/ti-rogue-km/Config.in
@@ -0,0 +1,28 @@
+comment "ti-rogue-km needs a Linux kernel to be built"
+	depends on BR2_aarch64
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_TI_ROGUE_KM
+	bool "ti-rogue-km"
+	depends on BR2_LINUX_KERNEL && BR2_aarch64
+	select BR2_LINUX_NEEDS_MODULES
+	help
+	  Kernel modules for TI SoCs with Rogue GPU.
+	  This package supports AM62, J721E, J721S2, and J784S4
+	  SoCs only.
+
+	  Note: it needs a TI specific kernel to build properly.
+
+	  https://git.ti.com/cgit/graphics/ti-img-rogue-driver
+
+if BR2_PACKAGE_TI_ROGUE_KM
+
+config BR2_TARGET_TI_ROGUE_KM_TARGET_PRODUCT
+	string "KM driver target product"
+	default "am62_linux"
+	help
+	  Select target product to be used for KM driver. This needs to
+	  match one of the SoC-specific folders within the build/linux
+	  folder of the ti-img-rogue-driver Git repository.
+
+endif
diff --git a/package/ti-rogue-km/ti-rogue-km.hash b/package/ti-rogue-km/ti-rogue-km.hash
new file mode 100644
index 0000000000..4a08efbb98
--- /dev/null
+++ b/package/ti-rogue-km/ti-rogue-km.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  ef50124b3e79fb1d28d3a2b4135032505abbb5c6b337b24a9bed7223d521dcc1  ti-rogue-km-1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2-br1.tar.gz
+sha256  c878f4e43e468329d3dcf4db09054e94472bfeee9f8ab2d69a122b978e9f773e  README
diff --git a/package/ti-rogue-km/ti-rogue-km.mk b/package/ti-rogue-km/ti-rogue-km.mk
new file mode 100644
index 0000000000..7b0a595c71
--- /dev/null
+++ b/package/ti-rogue-km/ti-rogue-km.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# ti-rogue-km
+#
+################################################################################
+
+# This corresponds to SDK 08.06.00
+TI_ROGUE_KM_VERSION = 1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2
+TI_ROGUE_KM_SITE = https://git.ti.com/git/graphics/ti-img-rogue-driver.git
+TI_ROGUE_KM_SITE_METHOD = git
+TI_ROGUE_KM_LICENSE = MIT or GPL-2.0
+TI_ROGUE_KM_LICENSE_FILES = README
+
+TI_ROGUE_KM_DEPENDENCIES = linux
+
+PVR_BUILD = "release"
+PVR_WS = "wayland"
+
+TI_ROGUE_KM_MAKE_OPTS = \
+	$(LINUX_MAKE_FLAGS) \
+	KERNELDIR=$(LINUX_DIR) \
+	BUILD=$(PVR_BUILD) \
+	PVR_BUILD_DIR=$(BR2_TARGET_TI_ROGUE_KM_TARGET_PRODUCT) \
+	WINDOW_SYSTEM=$(PVR_WS)
+
+define TI_ROGUE_KM_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TI_ROGUE_KM_MAKE_OPTS)
+endef
+
+define TI_ROGUE_KM_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR) \
+		M=$(@D)/binary_$(BR2_TARGET_TI_ROGUE_KM_TARGET_PRODUCT)_$(PVR_WS)_$(PVR_BUILD)/target_aarch64/kbuild \
+		INSTALL_MOD_PATH=$(TARGET_DIR) \
+		modules_install
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

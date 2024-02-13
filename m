Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54253C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C10E460805;
	Tue, 13 Feb 2024 17:01:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id faSs27mUdgfG; Tue, 13 Feb 2024 17:01:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEB4D60BF0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEB4D60BF0;
	Tue, 13 Feb 2024 17:01:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B06701BF28F
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABC3440467
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:01:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wrDh61EAZvYS for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:01:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=134.158.66.155;
 helo=cczrelay01.in2p3.fr; envelope-from=david.picard@clermont.in2p3.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 216E4400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 216E4400D8
Received: from cczrelay01.in2p3.fr (cczrelay05.in2p3.fr [134.158.66.155])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 216E4400D8
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:01:17 +0000 (UTC)
Received: from clrelecpo09.uca.fr (clrelecpo09w.in2p3.fr [134.158.124.135])
 by cczrelay01.in2p3.fr (8.14.4/8.14.4) with ESMTP id 41DGVnD3011309;
 Tue, 13 Feb 2024 17:31:49 +0100
From: David Picard <david.picard@clermont.in2p3.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 17:31:47 +0100
Message-Id: <20240213163147.493265-1-david.picard@clermont.in2p3.fr>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=clermont.in2p3.fr
Subject: [Buildroot] [PATCH 1/1] package/intel-socfpga-hwlib: add new package
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
Cc: David Picard <david.picard@clermont.in2p3.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a package for the Intel/Altera SoC FPGA hardware library. It is
used to let the HPS and the FPGA fabric communicate with each other.

Signed-off-by: David Picard <david.picard@clermont.in2p3.fr>
---
 package/Config.in                             |  1 +
 package/intel-socfpga-hwlib/Config.in         | 12 ++++++
 .../intel-socfpga-hwlib.hash                  |  2 +
 .../intel-socfpga-hwlib.mk                    | 39 +++++++++++++++++++
 4 files changed, 54 insertions(+)
 create mode 100644 package/intel-socfpga-hwlib/Config.in
 create mode 100644 package/intel-socfpga-hwlib/intel-socfpga-hwlib.hash
 create mode 100644 package/intel-socfpga-hwlib/intel-socfpga-hwlib.mk

diff --git a/package/Config.in b/package/Config.in
index bf0fe078b9..cd6c6bcaba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1736,6 +1736,7 @@ menu "Hardware handling"
 	source "package/gnu-efi/Config.in"
 	source "package/hackrf/Config.in"
 	source "package/hidapi/Config.in"
+	source "package/intel-socfpga-hwlib/Config.in"
 	source "package/jitterentropy-library/Config.in"
 	source "package/lcdapi/Config.in"
 	source "package/let-me-create/Config.in"
diff --git a/package/intel-socfpga-hwlib/Config.in b/package/intel-socfpga-hwlib/Config.in
new file mode 100644
index 0000000000..ced6483a59
--- /dev/null
+++ b/package/intel-socfpga-hwlib/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_INTEL_SOCFPGA_HWLIB
+	bool "intel-socfpga-hwlib"
+	depends on BR2_arm
+	help
+	  This package provides the Intel SoC FPGA HWLIB for
+	  Intel/Altera SoC FPGA chips.
+	  This library allows to communicate with the FPGA fabric from
+	  Linux, running on the HPS device.
+	  The source code is not compiled. Instead, a symlink is added
+	  to $(STAGING_DIR)/lib.
+
+	  https://github.com/altera-opensource/intel-socfpga-hwlib
diff --git a/package/intel-socfpga-hwlib/intel-socfpga-hwlib.hash b/package/intel-socfpga-hwlib/intel-socfpga-hwlib.hash
new file mode 100644
index 0000000000..60efe9013e
--- /dev/null
+++ b/package/intel-socfpga-hwlib/intel-socfpga-hwlib.hash
@@ -0,0 +1,2 @@
+sha256 bbf0767facfdf18ca3dbead66b1e98090c4e9731e2b87cf35c3bf13db0c315e4  intel-socfpga-hwlib-23.12.02.tar.gz
+sha256 2ed04f9cc773f88c8d52c05c04bb3d28f376c082bf99b6a3cb5590b1627ad484  License.txt
diff --git a/package/intel-socfpga-hwlib/intel-socfpga-hwlib.mk b/package/intel-socfpga-hwlib/intel-socfpga-hwlib.mk
new file mode 100644
index 0000000000..bf18c23560
--- /dev/null
+++ b/package/intel-socfpga-hwlib/intel-socfpga-hwlib.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# intel-socfpga-hwlib
+#
+################################################################################
+
+INTEL_SOCFPGA_HWLIB_VERSION = 23.12.02
+INTEL_SOCFPGA_HWLIB_SITE = $(call github,altera-opensource,intel-socfpga-hwlib,rel_master_$(INTEL_SOCFPGA_HWLIB_VERSION)_pr)
+INTEL_SOCFPGA_HWLIB_LICENSE = PROPRIETARY
+INTEL_SOCFPGA_HWLIB_LICENSE_FILES = License.txt
+INTEL_SOCFPGA_HWLIB_REDISTRIBUTE = YES
+INTEL_SOCFPGA_HWLIB_INSTALL_STAGING = YES
+
+define INTEL_SOCFPGA_HWLIB_INSTALL_STAGING_CMDS
+	ln -s $(BUILD_DIR)/intel-socfpga-hwlib-$(INTEL_SOCFPGA_HWLIB_VERSION) $(STAGING_DIR)/lib/intel-socfpga-hwlib
+endef
+
+# define INTEL_SOCFPGA_HWLIB_INSTALL_IMAGES_CMDS
+# 	mkdir -p $(BINARIES_DIR)/intel-ucode
+# 	$(INSTALL) -m 0644 -t $(BINARIES_DIR)/intel-ucode \
+# 		$(@D)/intel-ucode/*
+# endef
+#
+# ifeq ($(BR2_PACKAGE_INTEL_SOCFPGA_HWLIB_INSTALL_TARGET),y)
+# define INTEL_SOCFPGA_HWLIB_INSTALL_TARGET_CMDS
+# 	mkdir -p $(TARGET_DIR)/lib/firmware/intel-ucode
+# 	$(INSTALL) -m 0644 -t $(TARGET_DIR)/lib/firmware/intel-ucode \
+# 		$(@D)/intel-ucode/*
+# endef
+# else
+# INTEL_SOCFPGA_HWLIB_INSTALL_TARGET = NO
+# endif
+
+# define INTEL_SOCFPGA_HWLIB_LINUX_CONFIG_FIXUPS
+# 	$(call KCONFIG_ENABLE_OPT,CONFIG_MICROCODE)
+# 	$(call KCONFIG_ENABLE_OPT,CONFIG_MICROCODE_INTEL)
+# endef
+
+$(eval $(generic-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

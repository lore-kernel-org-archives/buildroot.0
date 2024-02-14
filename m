Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B01CC48BC4
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 09:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1BB440343;
	Wed, 14 Feb 2024 09:32:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1AtfEA2IzWkU; Wed, 14 Feb 2024 09:32:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2914404DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2914404DE;
	Wed, 14 Feb 2024 09:32:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2769A1BF398
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 09:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 146AA82368
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 09:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id orSiWZm8Evsq for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 09:32:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=134.158.66.156;
 helo=cczrelay02.in2p3.fr; envelope-from=david.picard@clermont.in2p3.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA6B582363
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA6B582363
Received: from cczrelay02.in2p3.fr (cczrelay06.in2p3.fr [134.158.66.156])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA6B582363
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 09:32:22 +0000 (UTC)
Received: from [134.158.124.135] (clrelecpo09w.in2p3.fr [134.158.124.135])
 (authenticated bits=0)
 by cczrelay02.in2p3.fr (8.14.4/8.14.4) with ESMTP id 41E9WK2v005847
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
 Wed, 14 Feb 2024 10:32:20 +0100
Message-ID: <abcd4153-41e2-45ce-a89a-e198e86ba337@clermont.in2p3.fr>
Date: Wed, 14 Feb 2024 10:32:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: David Picard <david.picard@clermont.in2p3.fr>
To: buildroot@buildroot.org
Content-Language: fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a package for the Intel/Altera SoC FPGA hardware library. It is
used to let the HPS and the FPGA fabric communicate with each other.

Signed-off-by: David Picard <david.picard@clermont.in2p3.fr>
---
package/Config.in | 1 +
package/intel-socfpga-hwlib/Config.in | 12 ++++++
.../intel-socfpga-hwlib.hash | 2 +
.../intel-socfpga-hwlib.mk | 39 +++++++++++++++++++
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
+ source "package/intel-socfpga-hwlib/Config.in"
source "package/jitterentropy-library/Config.in"
source "package/lcdapi/Config.in"
source "package/let-me-create/Config.in"
diff --git a/package/intel-socfpga-hwlib/Config.in 
b/package/intel-socfpga-hwlib/Config.in
new file mode 100644
index 0000000000..ced6483a59
--- /dev/null
+++ b/package/intel-socfpga-hwlib/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_INTEL_SOCFPGA_HWLIB
+ bool "intel-socfpga-hwlib"
+ depends on BR2_arm
+ help
+ This package provides the Intel SoC FPGA HWLIB for
+ Intel/Altera SoC FPGA chips.
+ This library allows to communicate with the FPGA fabric from
+ Linux, running on the HPS device.
+ The source code is not compiled. Instead, a symlink is added
+ to $(STAGING_DIR)/lib.
+
+ https://github.com/altera-opensource/intel-socfpga-hwlib
diff --git a/package/intel-socfpga-hwlib/intel-socfpga-hwlib.hash 
b/package/intel-socfpga-hwlib/intel-socfpga-hwlib.hash
new file mode 100644
index 0000000000..60efe9013e
--- /dev/null
+++ b/package/intel-socfpga-hwlib/intel-socfpga-hwlib.hash
@@ -0,0 +1,2 @@
+sha256 bbf0767facfdf18ca3dbead66b1e98090c4e9731e2b87cf35c3bf13db0c315e4 
intel-socfpga-hwlib-23.12.02.tar.gz
+sha256 2ed04f9cc773f88c8d52c05c04bb3d28f376c082bf99b6a3cb5590b1627ad484 
License.txt
diff --git a/package/intel-socfpga-hwlib/intel-socfpga-hwlib.mk 
b/package/intel-socfpga-hwlib/intel-socfpga-hwlib.mk
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
+INTEL_SOCFPGA_HWLIB_SITE = $(call 
github,altera-opensource,intel-socfpga-hwlib,rel_master_$(INTEL_SOCFPGA_HWLIB_VERSION)_pr)
+INTEL_SOCFPGA_HWLIB_LICENSE = PROPRIETARY
+INTEL_SOCFPGA_HWLIB_LICENSE_FILES = License.txt
+INTEL_SOCFPGA_HWLIB_REDISTRIBUTE = YES
+INTEL_SOCFPGA_HWLIB_INSTALL_STAGING = YES
+
+define INTEL_SOCFPGA_HWLIB_INSTALL_STAGING_CMDS
+ ln -s $(BUILD_DIR)/intel-socfpga-hwlib-$(INTEL_SOCFPGA_HWLIB_VERSION) 
$(STAGING_DIR)/lib/intel-socfpga-hwlib
+endef
+
+# define INTEL_SOCFPGA_HWLIB_INSTALL_IMAGES_CMDS
+# mkdir -p $(BINARIES_DIR)/intel-ucode
+# $(INSTALL) -m 0644 -t $(BINARIES_DIR)/intel-ucode \
+# $(@D)/intel-ucode/*
+# endef
+#
+# ifeq ($(BR2_PACKAGE_INTEL_SOCFPGA_HWLIB_INSTALL_TARGET),y)
+# define INTEL_SOCFPGA_HWLIB_INSTALL_TARGET_CMDS
+# mkdir -p $(TARGET_DIR)/lib/firmware/intel-ucode
+# $(INSTALL) -m 0644 -t $(TARGET_DIR)/lib/firmware/intel-ucode \
+# $(@D)/intel-ucode/*
+# endef
+# else
+# INTEL_SOCFPGA_HWLIB_INSTALL_TARGET = NO
+# endif
+
+# define INTEL_SOCFPGA_HWLIB_LINUX_CONFIG_FIXUPS
+# $(call KCONFIG_ENABLE_OPT,CONFIG_MICROCODE)
+# $(call KCONFIG_ENABLE_OPT,CONFIG_MICROCODE_INTEL)
+# endef
+
+$(eval $(generic-package))

-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

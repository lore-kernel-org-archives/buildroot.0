Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4ECCDD1D3
	for <buildroot@archiver.kernel.org>; Fri, 27 Sep 2024 18:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D2D54253C;
	Fri, 27 Sep 2024 18:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdjL9hWM9s4A; Fri, 27 Sep 2024 18:36:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB8D542541
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB8D542541;
	Fri, 27 Sep 2024 18:36:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F8421BF376
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 18:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B7294253C
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 18:36:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AB2TJ6K-enDm for <buildroot@lists.busybox.net>;
 Fri, 27 Sep 2024 18:36:04 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.21;
 helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A6DF42541
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A6DF42541
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A6DF42541
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 18:36:03 +0000 (UTC)
X-CSE-ConnectionGUID: omZ+P62ESPmOK7ZkReYpGw==
X-CSE-MsgGUID: bcn1/X6lRYqLrvEFY8QFhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26566490"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="26566490"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 11:36:03 -0700
X-CSE-ConnectionGUID: M9TonF39SUqNSBV5pKGCbA==
X-CSE-MsgGUID: vzPANTH/QCGSupfUcHatrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="73042369"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP; 27 Sep 2024 11:36:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 0549230D; Fri, 27 Sep 2024 21:35:59 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: buildroot@buildroot.org
Date: Fri, 27 Sep 2024 21:34:59 +0300
Message-ID: <20240927183553.2866682-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727462164; x=1758998164;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=31siuLAp83QgGCZuIJw6lO5XU1rZnA6JtjDObArVrYk=;
 b=cz0y4n2Y1mpURrZ8nVIjbrWDi6t2g1Me1sAQfXc+J1p5sb8zawarZ5qv
 ledtngh1NN9MuHy5ls4lPIJqoHX0MbEGaGNmHbPKiAOmP+xxIaCP6xL+W
 e50qJEhhUIsOwmy7mDOgtIkTlmuiYazIX+nmeBMYJvokPAgsnHrtkDBMX
 /2tTloos0gEklwurelCQy7pBF7jyB4FIEn6cOAUtifAHq+wlR9Itbp+du
 P2zBmB24BATr5rnIvtof1eC1EYZgITOt83W0pMgN/w9wdTenSwFX7wVlq
 v5nJ/a4wSn8uSfMcHgNNb+ss7s2wMvLdRfUNwGfmetmqf01QTZhd37pt2
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cz0y4n2Y
Subject: [Buildroot] [PATCH v2 1/1] package: Add iotools package
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andy Yan <andyshrk@163.com>, Andy Yan <andyshrk@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The iotools package provides a set of simple command line tools which
allow access to hardware device registers. Supported register interfaces
include PCI, IO, memory mapped IO, SMBus, CPUID, and MSR. Also included
are some utilities which allow for simple arithmetic, logical, and other
operations.

If you ever have to debug hardware, you could probably use these tools.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: removed explicit strip (Baruch), added to DEVELOPERS

 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/iotools/Config.in    | 14 ++++++++++++++
 package/iotools/iotools.hash |  3 +++
 package/iotools/iotools.mk   | 20 ++++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/iotools/Config.in
 create mode 100644 package/iotools/iotools.hash
 create mode 100644 package/iotools/iotools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c3b1d66b016b..158313be9335 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -230,6 +230,7 @@ F:	package/sysdig/
 
 N:	Andy Shevchenko <andy.shevchenko@gmail.com>
 F:	package/fb-test-app/
+F:	package/iotools/
 
 N:	Anisse Astier <anisse@astier.eu>
 F:	package/go/
diff --git a/package/Config.in b/package/Config.in
index bfbec1c21d04..08977a3a92db 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -533,6 +533,7 @@ endmenu
 	source "package/i7z/Config.in"
 	source "package/input-event-daemon/Config.in"
 	source "package/intel-microcode/Config.in"
+	source "package/iotools/Config.in"
 	source "package/ipmitool/Config.in"
 	source "package/ipmiutil/Config.in"
 	source "package/irda-utils/Config.in"
diff --git a/package/iotools/Config.in b/package/iotools/Config.in
new file mode 100644
index 000000000000..ffa1a3666738
--- /dev/null
+++ b/package/iotools/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_IOTOOLS
+	bool "iotools"
+	help
+	  Tools for poking all types of IO, supported are:
+	  - CMOS NVRAM (via /dev/nvram)
+	  - CPU ID (x86)
+	  - IO port (x86, PowerPC)
+	  - MMIO
+	  - MSR (x86)
+	  - PCI configuration space
+	  - SCOM (PowerPC)
+	  - SMBus
+
+	  https://github.com/andy-shev/iotools
diff --git a/package/iotools/iotools.hash b/package/iotools/iotools.hash
new file mode 100644
index 000000000000..11d7ffb73e39
--- /dev/null
+++ b/package/iotools/iotools.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  13b8b87c7d1f22b8d8f50c499af09f9414a0879d69c22393f1051ed4bf28f378  iotools-v1.7.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/iotools/iotools.mk b/package/iotools/iotools.mk
new file mode 100644
index 000000000000..03b87c89e9d0
--- /dev/null
+++ b/package/iotools/iotools.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# iotools
+#
+################################################################################
+
+IOTOOLS_VERSION = v1.7
+IOTOOLS_SITE = $(call github,andy-shev,iotools,$(IOTOOLS_VERSION))
+IOTOOLS_LICENSE = GPL-2.0+
+IOTOOLS_LICENSE_FILES = COPYING
+
+define IOTOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) all
+endef
+
+define IOTOOLS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/bin -D $(@D)/iotools
+endef
+
+$(eval $(generic-package))
-- 
2.43.0.rc1.1336.g36b5255a03ac

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

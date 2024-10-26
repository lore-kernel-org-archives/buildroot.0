Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E77FD10BF7
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 12:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0737F60AAF;
	Sat, 26 Oct 2024 12:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGUJizgeDwuM; Sat, 26 Oct 2024 12:45:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F65C60BF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F65C60BF9;
	Sat, 26 Oct 2024 12:45:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96B442318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81782820FC
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JKhyNSbAYa4G for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 12:45:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0A04820FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0A04820FB
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:45:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AE7883A17; Sat, 26 Oct 2024 12:45:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 14:43:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8851a2583e09fcd3b9c3c84c9245cdfb68ddd958
X-Git-Newrev: aa7217276d0da805229739b1ede8eb3a1fe365aa
X-Patchwork-Hint: ignore
Message-Id: <20241026124531.8AE7883A17@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iotools: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=aa7217276d0da805229739b1ede8eb3a1fe365aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The iotools package provides a set of simple command line tools which
allow access to hardware device registers. Supported register interfaces
include PCI, IO, memory mapped IO, SMBus, CPUID, and MSR. Also included
are some utilities which allow for simple arithmetic, logical, and other
operations.

If you ever have to debug hardware, you could probably use these tools.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/iotools/Config.in    | 14 ++++++++++++++
 package/iotools/iotools.hash |  3 +++
 package/iotools/iotools.mk   | 29 +++++++++++++++++++++++++++++
 5 files changed, 48 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fc3e4bdf25..a369c15311 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -239,6 +239,7 @@ F:	package/sysdig/
 
 N:	Andy Shevchenko <andy.shevchenko@gmail.com>
 F:	package/fb-test-app/
+F:	package/iotools/
 
 N:	Anthony Viallard <viallard@syscom-instruments.com>
 F:	package/gnuplot/
diff --git a/package/Config.in b/package/Config.in
index fa010e231f..5caa82e34c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -535,6 +535,7 @@ endmenu
 	source "package/i7z/Config.in"
 	source "package/input-event-daemon/Config.in"
 	source "package/intel-microcode/Config.in"
+	source "package/iotools/Config.in"
 	source "package/ipmitool/Config.in"
 	source "package/ipmiutil/Config.in"
 	source "package/irda-utils/Config.in"
diff --git a/package/iotools/Config.in b/package/iotools/Config.in
new file mode 100644
index 0000000000..ffa1a36667
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
index 0000000000..6b1ef3d47d
--- /dev/null
+++ b/package/iotools/iotools.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  13b8b87c7d1f22b8d8f50c499af09f9414a0879d69c22393f1051ed4bf28f378  iotools-1.7.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/iotools/iotools.mk b/package/iotools/iotools.mk
new file mode 100644
index 0000000000..5c5a657cab
--- /dev/null
+++ b/package/iotools/iotools.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# iotools
+#
+################################################################################
+
+IOTOOLS_VERSION = 1.7
+IOTOOLS_SITE = $(call github,andy-shev,iotools,v$(IOTOOLS_VERSION))
+IOTOOLS_LICENSE = GPL-2.0+
+IOTOOLS_LICENSE_FILES = COPYING
+
+IOTOOLS_MAKE_OPTS = \
+	CROSS_COMPILE=$(TARGET_CROSS)
+
+ifeq ($(BR2_STATIC_LIBS),y)
+IOTOOLS_MAKE_OPTS += STATIC=1
+else
+IOTOOLS_MAKE_OPTS += STATIC=0
+endif
+
+define IOTOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(IOTOOLS_MAKE_OPTS) all
+endef
+
+define IOTOOLS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/iotools $(TARGET_DIR)/usr/bin/iotools
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

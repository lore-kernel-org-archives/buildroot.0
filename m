Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FC7C001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F31DB6101E;
	Sun, 30 Jul 2023 21:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F31DB6101E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tY5iJP54__D7; Sun, 30 Jul 2023 21:25:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F29EB61023;
	Sun, 30 Jul 2023 21:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F29EB61023
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EEFD61BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C73AD409B0
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:24:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C73AD409B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SlAQBd96L-ma for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:24:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1CBB4099F
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1CBB4099F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C8BB83CF7; Sun, 30 Jul 2023 21:24:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 23:22:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67cbbbfe6e9632deacd0784bdbf51496ad76701d
X-Git-Newrev: f93a6c2830d2da73a40edeb83826467672392b62
X-Patchwork-Hint: ignore
Message-Id: <20230730212457.8C8BB83CF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencsd: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f93a6c2830d2da73a40edeb83826467672392b62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This library provides an API suitable for the decode of
ARM(r) CoreSight(tm) trace streams.

OpenCSD is for example an optional dependency in the Linux
"perf" tool, starting from kernel version 5.1.

https://github.com/Linaro/OpenCSD

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/opencsd/Config.in    | 27 +++++++++++++++++++++++++++
 package/opencsd/opencsd.hash |  3 +++
 package/opencsd/opencsd.mk   | 31 +++++++++++++++++++++++++++++++
 5 files changed, 63 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d4a6637671..51e7e3439d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1716,6 +1716,7 @@ F:	package/libjxl/
 F:	package/octave/
 F:	package/ola/
 F:	package/openblas/
+F:	package/opencsd/
 F:	package/openmpi/
 F:	package/perftest/
 F:	package/ptm2human/
diff --git a/package/Config.in b/package/Config.in
index 908806db41..43c38d7d99 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1722,6 +1722,7 @@ menu "Hardware handling"
 	source "package/mtdev/Config.in"
 	source "package/ne10/Config.in"
 	source "package/neardal/Config.in"
+	source "package/opencsd/Config.in"
 	source "package/opensc/Config.in"
 	source "package/owfs/Config.in"
 	source "package/pcsc-lite/Config.in"
diff --git a/package/opencsd/Config.in b/package/opencsd/Config.in
new file mode 100644
index 0000000000..6e400cc2ae
--- /dev/null
+++ b/package/opencsd/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_OPENCSD_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm
+	default y if BR2_armeb
+	default y if BR2_aarch64
+	default y if BR2_aarch64_be
+
+config BR2_PACKAGE_OPENCSD
+	bool "opencsd"
+	depends on BR2_PACKAGE_OPENCSD_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  This library provides an API suitable for the decode of
+	  ARM(r) CoreSight(tm) trace streams.
+
+	  OpenCSD is for example an optional dependency in the Linux
+	  "perf" tool, starting from kernel version 5.1.
+
+	  https://github.com/Linaro/OpenCSD
+
+comment "opencsd needs a toolchain w/ C++11, gcc >= 4.8, dynamic library"
+	depends on BR2_PACKAGE_OPENCSD_ARCH_SUPPORTS
+	depends on BR2_STATIC_LIBS \
+		|| !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/opencsd/opencsd.hash b/package/opencsd/opencsd.hash
new file mode 100644
index 0000000000..84a762fb36
--- /dev/null
+++ b/package/opencsd/opencsd.hash
@@ -0,0 +1,3 @@
+# Locally Computed:
+sha256  e1bb6d8d09e87974cb5ca6db2a13b0e1ba9e51117ca2ed71879df07ff7af4de2  opencsd-1.4.0.tar.gz
+sha256  980eef4b0744e63834e3ec0d50c2a4ff6d81d7ec62dd8ba8c66acae0ec5a2e88  LICENSE
diff --git a/package/opencsd/opencsd.mk b/package/opencsd/opencsd.mk
new file mode 100644
index 0000000000..680364d01d
--- /dev/null
+++ b/package/opencsd/opencsd.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# opencsd
+#
+################################################################################
+
+OPENCSD_VERSION = 1.4.0
+OPENCSD_SITE = $(call github,Linaro,OpenCSD,v$(OPENCSD_VERSION))
+OPENCSD_LICENSE = BSD-3-Clause
+OPENCSD_LICENSE_FILES = LICENSE
+OPENCSD_INSTALL_STAGING = YES
+
+OPENCSD_MAKE_OPTS = \
+	CROSS_COMPILE="$(TARGET_CROSS)"
+
+define OPENCSD_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/decoder/build/linux \
+		$(OPENCSD_MAKE_OPTS) all
+endef
+
+define OPENCSD_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/decoder/build/linux \
+		$(OPENCSD_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
+endef
+
+define OPENCSD_INSTALL_STAGING_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/decoder/build/linux \
+		$(OPENCSD_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

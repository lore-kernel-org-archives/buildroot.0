Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E79BC38A2D
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 09:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 044AF60E0B;
	Thu, 27 Oct 2022 09:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 044AF60E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8xgBV6z4qlbW; Thu, 27 Oct 2022 09:53:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 351E160BF4;
	Thu, 27 Oct 2022 09:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 351E160BF4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A448B1BF2CB
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 09:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E3DB408F7
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 09:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E3DB408F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pLrJi--Dfz5o for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 09:53:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E53240253
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 09:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E53240253
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AAE187326; Thu, 27 Oct 2022 09:53:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Oct 2022 11:52:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3cf8930508738ccea33448f2e59a15c7eee126b3
X-Git-Newrev: 8fdf8731e727dc5c2d4080d7a56e1d71dc25e533
X-Patchwork-Hint: ignore
Message-Id: <20221027095300.5AAE187326@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdio-tools: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=8fdf8731e727dc5c2d4080d7a56e1d71dc25e533
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mdio-tools are kernel module and accompanying tools for low-level
debugging of devices attached on MDIO bus like PHY-s, switches etc.

Userspace tools provide C22 or C45 reads and writes, benchmarking
and even dedicated Marvell Link Street tools via the included
kernel module.

Signed-off-by: Robert Marko <robimarko@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/mdio-tools/Config.in       | 14 ++++++++++++++
 package/mdio-tools/mdio-tools.hash |  3 +++
 package/mdio-tools/mdio-tools.mk   | 21 +++++++++++++++++++++
 5 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bc4640685a..dac8fefd0b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2510,6 +2510,9 @@ F:	package/tzdata/
 N:	RJ Ascani <rj.ascani@gmail.com>
 F:	package/azmq/
 
+N:	Robert Marko <robimarko@gmail.com>
+F:	package/mdio-tools/
+
 N:	Robert Rose <robertroyrose@gmail.com>
 F:	package/grpc/
 
diff --git a/package/Config.in b/package/Config.in
index ebafe11dea..e4eb2b7434 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -537,6 +537,7 @@ endmenu
 	source "package/mbpfan/Config.in"
 	source "package/mdadm/Config.in"
 	source "package/mdevd/Config.in"
+	source "package/mdio-tools/Config.in"
 	source "package/memtest86/Config.in"
 	source "package/memtester/Config.in"
 	source "package/memtool/Config.in"
diff --git a/package/mdio-tools/Config.in b/package/mdio-tools/Config.in
new file mode 100644
index 0000000000..d63ba8f727
--- /dev/null
+++ b/package/mdio-tools/Config.in
@@ -0,0 +1,14 @@
+comment "mdio-tools needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+comment "mdio-tools needs a toolchain w/ headers >= 5.1"
+	depends on !BR2_LINUX_KERNEL
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+
+config BR2_PACKAGE_MDIO_TOOLS
+	bool "mdio-tools"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+	select BR2_PACKAGE_LIBMNL
+	help
+	  Low-level debug tools for MDIO devices
diff --git a/package/mdio-tools/mdio-tools.hash b/package/mdio-tools/mdio-tools.hash
new file mode 100644
index 0000000000..0111165f27
--- /dev/null
+++ b/package/mdio-tools/mdio-tools.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c5e17431c62392f6c1da1ba4fb0a6f5918521509a377af74485851f93ff2a106  mdio-tools-1.2.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
new file mode 100644
index 0000000000..c4be54142e
--- /dev/null
+++ b/package/mdio-tools/mdio-tools.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# mdio-tools
+#
+################################################################################
+
+MDIO_TOOLS_VERSION = 1.2.0
+MDIO_TOOLS_SITE = https://github.com/wkz/mdio-tools/releases/download/$(MDIO_TOOLS_VERSION)
+MDIO_TOOLS_LICENSE = GPL-2.0
+MDIO_TOOLS_LICENSE_FILES = COPYING
+MDIO_TOOLS_DEPENDENCIES = host-pkgconf libmnl
+
+MDIO_TOOLS_MODULE_SUBDIRS = kernel
+
+define MDIO_TOOLS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MDIO_DEVICE)
+endef
+
+$(eval $(kernel-module))
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

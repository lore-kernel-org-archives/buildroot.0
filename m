Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC69C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C905841493;
	Fri, 12 Jul 2024 15:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhVy6fh_0nPv; Fri, 12 Jul 2024 15:52:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A19B64129F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A19B64129F;
	Fri, 12 Jul 2024 15:52:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E3621BF5D7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 795D3608BE
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id THgB3mLKPsM0 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:52:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C74161387
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C74161387
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:52:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D23B860CC; Fri, 12 Jul 2024 15:52:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 17:51:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cb762efa4f35fa62a63475154c9431fd0da8e97
X-Git-Newrev: 70319b47f646f74f407ed3355baf5b581a10518a
X-Patchwork-Hint: ignore
Message-Id: <20240712155211.7D23B860CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdex: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=70319b47f646f74f407ed3355baf5b581a10518a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides utilities for asynchronous programming in C
using a futures/promises model. Newer versions of sysprof require
this library.

https://gitlab.gnome.org/GNOME/libdex

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libdex/Config.in   | 17 +++++++++++++++++
 package/libdex/libdex.hash |  5 +++++
 package/libdex/libdex.mk   | 31 +++++++++++++++++++++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ae3a675731..1fa425f3ee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -55,6 +55,7 @@ F:	package/brotli/
 F:	package/bubblewrap/
 F:	package/cage/
 F:	package/cog/
+F:	package/libdex/
 F:	package/libepoxy/
 F:	package/libmanette/
 F:	package/libpsl/
diff --git a/package/Config.in b/package/Config.in
index 44ce5a5005..2b71978112 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2163,6 +2163,7 @@ menu "Other"
 	source "package/libcrossguid/Config.in"
 	source "package/libcsv/Config.in"
 	source "package/libdaemon/Config.in"
+	source "package/libdex/Config.in"
 	source "package/libdill/Config.in"
 	source "package/libeastl/Config.in"
 	source "package/libee/Config.in"
diff --git a/package/libdex/Config.in b/package/libdex/Config.in
new file mode 100644
index 0000000000..f10bdac46f
--- /dev/null
+++ b/package/libdex/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBDEX
+	bool "libdex"
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_USE_WCHAR # libglib2, gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Dex provides Future-based programming for GLib-based
+	  applications. It both integrates with and brings new
+	  features for application and library authors who want
+	  to structure concurrent code in an easy to manage way.
+
+	  https://gitlab.gnome.org/GNOME/libdex
+
+comment "libdex needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libdex/libdex.hash b/package/libdex/libdex.hash
new file mode 100644
index 0000000000..ec22f330d9
--- /dev/null
+++ b/package/libdex/libdex.hash
@@ -0,0 +1,5 @@
+# From https://download.gnome.org/sources/libdex/0.6/libdex-0.6.1.sha256sum
+sha256  d176de6578571e32a8c0b603b6a5a13fa5f87fb6b5442575b38ec5af16b17a92  libdex-0.6.1.tar.xz
+
+# License files
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
new file mode 100644
index 0000000000..530dfc2bab
--- /dev/null
+++ b/package/libdex/libdex.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# libdex
+#
+################################################################################
+
+LIBDEX_VERSION_MAJOR = 0.6
+LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).1
+LIBDEX_SOURCE = libdex-$(LIBDEX_VERSION).tar.xz
+LIBDEX_SITE = https://download.gnome.org/sources/libdex/$(LIBDEX_VERSION_MAJOR)
+LIBDEX_LICENSE = LGPL-2.1+
+LIBDEX_LICENSE_FILES = COPYING
+LIBDEX_INSTALL_STAGING = YES
+LIBDEX_DEPENDENCIES = libglib2
+LIBDEX_CONF_OPTS = \
+	-Ddocs=false \
+	-Dexamples=false \
+	-Dsysprof=false \
+	-Dtests=false \
+	-Dvapi=false \
+	-Deventfd=enabled \
+	-Dintrospection=disabled
+
+ifeq ($(BR2_PACKAGE_LIBURING),y)
+LIBDEX_CONF_OPTS += -Dliburing=enabled
+LIBDEX_DEPENDENCIES += liburing
+else
+LIBDEX_CONF_OPTS += -Dliburing=disabled
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

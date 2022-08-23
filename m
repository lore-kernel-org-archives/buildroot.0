Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCBFC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 20:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D50CC40A03;
	Tue, 23 Aug 2022 20:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D50CC40A03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4HNhEMRwlwP4; Tue, 23 Aug 2022 20:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D77DA409D8;
	Tue, 23 Aug 2022 20:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D77DA409D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 359521BF9A4
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1006840249
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1006840249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0IAZK6zA9179 for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 20:48:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E705A40266
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 20:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E705A40266
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A108987BED; Tue, 23 Aug 2022 20:33:46 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 22:44:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 58c58466319a7864441dc6c70e880165db79ead0
X-Git-Newrev: d73bc1eb3a559c96310359cbb2cc7fb1792037df
X-Patchwork-Hint: ignore
Message-Id: <20220823203346.A108987BED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package: Add libmanette
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d73bc1eb3a559c96310359cbb2cc7fb1792037df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libmanette is a library which provides a higher level interface to
enumerate and make use of game controllers (gamepads, joysticks).
WebKitGTK can use libmanette to expose controllers to web content,
which will be enabled on a follow-up patch.

Minimal kernel headers 4.16 for input_event_sec and input_event_usec
in struct input_event.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[Arnout: add kernel headers dependency suggested by Romain]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libmanette/Config.in       | 17 +++++++++++++++
 package/libmanette/libmanette.hash |  5 +++++
 package/libmanette/libmanette.mk   | 42 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 66 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4287fd9cf7..34cce542bd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -35,6 +35,7 @@ F:	package/bubblewrap/
 F:	package/cage/
 F:	package/cog/
 F:	package/libepoxy/
+F:	package/libmanette/
 F:	package/libpsl/
 F:	package/libwpe/
 F:	package/webkitgtk/
diff --git a/package/Config.in b/package/Config.in
index 2c2752b412..802fb5da30 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -518,6 +518,7 @@ endmenu
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
 	source "package/libiec61850/Config.in"
+	source "package/libmanette/Config.in"
 	source "package/libubootenv/Config.in"
 	source "package/libuio/Config.in"
 	source "package/linux-backports/Config.in"
diff --git a/package/libmanette/Config.in b/package/libmanette/Config.in
new file mode 100644
index 0000000000..31fff15286
--- /dev/null
+++ b/package/libmanette/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBMANETTE
+	bool "libmanette"
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_USE_WCHAR # libglib2 -> gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
+	select BR2_PACKAGE_LIBEVDEV
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  GObject library which provides access to game controllers.
+
+	  https://gitlab.gnome.org/GNOME/libmanette
+
+comment "libmanette needs a toolchain w/ wchar, threads, headers >= 4.16"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
diff --git a/package/libmanette/libmanette.hash b/package/libmanette/libmanette.hash
new file mode 100644
index 0000000000..96089f971a
--- /dev/null
+++ b/package/libmanette/libmanette.hash
@@ -0,0 +1,5 @@
+# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.6.sha256sum
+sha256  63653259a821ec7d90d681e52e757e2219d462828c9d74b056a5f53267636bac  libmanette-0.2.6.tar.xz
+
+# Locally calculated
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libmanette/libmanette.mk b/package/libmanette/libmanette.mk
new file mode 100644
index 0000000000..10f2b8a466
--- /dev/null
+++ b/package/libmanette/libmanette.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# libmanette
+#
+################################################################################
+
+LIBMANETTE_VERSION_MAJOR = 0.2
+LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).6
+LIBMANETTE_SOURCE = libmanette-$(LIBMANETTE_VERSION).tar.xz
+LIBMANETTE_SITE = https://download.gnome.org/sources/libmanette/$(LIBMANETTE_VERSION_MAJOR)
+LIBMANETTE_LICENSE = LGPL-2.1+
+LIBMANETTE_LICENSE_FILES = COPYING
+LIBMANETTE_INSTALL_STAGING = YES
+LIBMANETTE_DEPENDENCIES = \
+	libevdev \
+	libglib2 \
+	$(TARGET_NLS_DEPENDENCIES)
+
+LIBMANETTE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+
+LIBMANETTE_CONF_OPTS = \
+	-Ddemos=false \
+	-Dbuild-tests=false \
+	-Dinstall-tests=false \
+	-Ddoc=false \
+	-Dvapi=false
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBMANETTE_CONF_OPTS += -Dintrospection=true
+LIBMANETTE_DEPENDENCIES += gobject-introspection
+else
+LIBMANETTE_CONF_OPTS += -Dintrospection=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
+LIBMANETTE_CONF_OPTS += -Dgudev=enabled
+LIBMANETTE_DEPENDENCIES += libgudev
+else
+LIBMANETTE_CONF_OPTS += -Dgudev=disabled
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

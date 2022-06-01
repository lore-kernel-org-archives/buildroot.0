Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5DCCCA473
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 21:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0237409DA;
	Wed,  1 Jun 2022 21:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fvoSLX8l11Wx; Wed,  1 Jun 2022 21:09:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC1F8409C8;
	Wed,  1 Jun 2022 21:09:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 067351BF36A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0258A409C8
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y7RZUnDOJZrk for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 21:09:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C71F140102
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 21:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m7kBNXF/lImucmAkIudNwci4aCkvj/EYdhj83R1pSKI=; b=AcgSNLHQcrvI5lo1fNoAj4+s1f
 MJEBsruFUTGYN7ikfxhGch9WlBxdZH4EjCkb4/JYFe/ckSwlcQ/hw3CA5kqL7nFREd2rizmkM7Zf6
 gCr4NMGE88bnGc8zaqgjKpW7MPna2N4SGYtaehcHWhsFsF6Dpmufojj+UwfrkP5AjRzS1VKuT7LR7
 EQ7zSDdLA/TXtfmZ3CEpWffLQzlKvRjdcsGHo3xYIbEhjkZ9sEZlAWhIGibHTI1AshKDjeG5RlmEE
 cPG2zxDOrSv0odasFpt6qchZHocwVi/Q50eSI+Fm1dzuX87Kabgg3lo0La/Ky7q3Xj7PKAGiMtyWT
 V/GqFJSw==;
Received: from 91-153-34-181.elisa-laajakaista.fi ([91.153.34.181] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nwVbB-007f5Y-Kv; Wed, 01 Jun 2022 23:09:49 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id a3222a47;
 Wed, 1 Jun 2022 21:09:39 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Thu,  2 Jun 2022 00:09:38 +0300
Message-Id: <20220601210939.2350383-1-aperez@igalia.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package: Add libmanette
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libmanette is a library which provides a higher level interface to
enumerate and make use of game controllers (gamepads, joysticks).
WebKitGTK can use libmanette to expose controllers to web content,
which will be enabled on a follow-up patch.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libmanette/Config.in       | 15 +++++++++++
 package/libmanette/libmanette.hash |  5 ++++
 package/libmanette/libmanette.mk   | 42 ++++++++++++++++++++++++++++++
 5 files changed, 64 insertions(+)
 create mode 100644 package/libmanette/Config.in
 create mode 100644 package/libmanette/libmanette.hash
 create mode 100644 package/libmanette/libmanette.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 71cc3da6d7..740e9a3ca7 100644
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
index 00f061015f..2242ad409e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -506,6 +506,7 @@ endmenu
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
 	source "package/libiec61850/Config.in"
+	source "package/libmanette/Config.in"
 	source "package/libubootenv/Config.in"
 	source "package/libuio/Config.in"
 	source "package/linux-backports/Config.in"
diff --git a/package/libmanette/Config.in b/package/libmanette/Config.in
new file mode 100644
index 0000000000..8297d8c7f4
--- /dev/null
+++ b/package/libmanette/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBMANETTE
+	bool "libmanette"
+	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBEVDEV
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  GObject library which provides access to game controllers.
+
+	  https://gitlab.gnome.org/GNOME/libmanette
+
+comment "libmanette needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
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
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

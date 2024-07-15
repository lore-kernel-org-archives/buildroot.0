Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C18DC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 12:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 040C740B8D;
	Tue, 16 Jul 2024 12:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bvTxUkoCQDYd; Tue, 16 Jul 2024 12:39:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AFB440B91
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AFB440B91;
	Tue, 16 Jul 2024 12:39:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0381A1BF38A
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F051081154
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2iQcjk74lny for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 12:39:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17E568107C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17E568107C
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 12:39:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B21C86B30; Tue, 16 Jul 2024 12:39:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 21:49:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7aac1c008f9c59f8c669bade17864b099221065
X-Git-Newrev: e52605c092d8eaa926da8720ae498a38eddb5205
X-Patchwork-Hint: ignore
Message-Id: <20240716123912.0B21C86B30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libjcat: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e52605c092d8eaa926da8720ae498a38eddb5205
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libjcat/Config.in    | 15 +++++++++++++++
 package/libjcat/libjcat.hash |  3 +++
 package/libjcat/libjcat.mk   | 43 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 63 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f7b7db53ce..e181382fe9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1484,6 +1484,7 @@ F:	package/fxdiv/
 F:	package/gensio/
 F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
+F:	package/libjcat/
 F:	package/libucontext/
 F:	package/lilv/
 F:	package/lv2/
diff --git a/package/Config.in b/package/Config.in
index b9f5c4d7c2..4a38c282a3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1531,6 +1531,7 @@ endmenu
 menu "Compression and decompression"
 	source "package/libarchive/Config.in"
 	source "package/libdeflate/Config.in"
+	source "package/libjcat/Config.in"
 	source "package/libmspack/Config.in"
 	source "package/libsquish/Config.in"
 	source "package/libzip/Config.in"
diff --git a/package/libjcat/Config.in b/package/libjcat/Config.in
new file mode 100644
index 0000000000..cf7bc334f5
--- /dev/null
+++ b/package/libjcat/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBJCAT
+	bool "libjcat"
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_JSON_GLIB
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Library for reading and writing Jcat files.
+
+	  https://github.com/hughsie/libjcat
+
+comment "fwupd needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libjcat/libjcat.hash b/package/libjcat/libjcat.hash
new file mode 100644
index 0000000000..b6dc8d2f69
--- /dev/null
+++ b/package/libjcat/libjcat.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  a6232aeca3c3fab6dbb3bed06ec3832088b49a4b278a7119558d72be60ce921f  libjcat-0.2.1.tar.xz
+sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
diff --git a/package/libjcat/libjcat.mk b/package/libjcat/libjcat.mk
new file mode 100644
index 0000000000..e13e5dbfb7
--- /dev/null
+++ b/package/libjcat/libjcat.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# libjcat
+#
+################################################################################
+
+LIBJCAT_VERSION = 0.2.1
+LIBJCAT_SITE = https://github.com/hughsie/libjcat/releases/download/$(LIBJCAT_VERSION)
+LIBJCAT_SOURCE = libjcat-$(LIBJCAT_VERSION).tar.xz
+LIBJCAT_LICENSE = LGPL-2.1+
+LIBJCAT_LICENSE_FILES = LICENSE
+LIBJCAT_INSTALL_STAGING = YES
+LIBJCAT_DEPENDENCIES = host-pkgconf json-glib libglib2
+
+LIBJCAT_CONF_OPTS = \
+	-Dgtkdoc=false \
+	-Dtests=false \
+	-Ded25519=false \
+	-Dman=false \
+	-Dcli=true
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBJCAT_DEPENDENCIES += host-vala gobject-introspection
+LIBJCAT_CONF_OPTS += -Dintrospection=true -Dvapi=true
+else
+LIBJCAT_CONF_OPTS += -Dintrospection=false -Dvapi=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGPG_ERROR)$(BR2_PACKAGE_LIBGPGME),yy)
+LIBJCAT_DEPENDENCIES += libgpg-error libgpgme
+LIBJCAT_CONF_OPTS += -Dgpg=true
+else
+LIBJCAT_CONF_OPTS += -Dgpg=false
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBJCAT_DEPENDENCIES += gnutls
+LIBJCAT_CONF_OPTS += -Dpkcs7=true
+else
+LIBJCAT_CONF_OPTS += -Dpkcs7=false
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

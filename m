Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386EDC001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBE3D409F4;
	Sun,  6 Aug 2023 14:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBE3D409F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AKP0lq01bBrK; Sun,  6 Aug 2023 14:24:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F9E3409A1;
	Sun,  6 Aug 2023 14:24:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F9E3409A1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 845CB1BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE32B401D8
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE32B401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEsuTu9RfP6m for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:24:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B46984000B
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B46984000B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A14C384457; Sun,  6 Aug 2023 14:24:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 16:24:08 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 05555c0daf5610f733f5516901b5c44d07d09599
X-Git-Newrev: 28e38f4d5cff5db7aa96a4ab5c87cf996087c977
X-Patchwork-Hint: ignore
Message-Id: <20230806142426.A14C384457@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libsoup3: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=28e38f4d5cff5db7aa96a4ab5c87cf996087c977
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Libsoup3 has a new API [1], packages using libsoup may not compile
with libsoup3 or may crash at runtime in unexpected ways, so we add a
new package. It can be installed side by site with libsoup, without
any conflict.

[1] https://libsoup.org/libsoup-3.0/ch02.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/libsoup3/Config.in     | 34 +++++++++++++++++++++++++
 package/libsoup3/libsoup3.hash |  4 +++
 package/libsoup3/libsoup3.mk   | 57 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 97 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0f6cb75e0e..c9117146ea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2854,6 +2854,7 @@ F:	toolchain/
 
 N:	Thomas Devoogdt <thomas@devoogdt.com>
 F:	package/fluent-bit/
+F:	package/libsoup3/
 
 N:	Thomas Huth <huth@tuxfamily.org>
 F:	board/qemu/m68k-mcf5208/
diff --git a/package/Config.in b/package/Config.in
index 54cddc3914..e12ee34e9f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1957,6 +1957,7 @@ menu "Networking"
 	source "package/libshout/Config.in"
 	source "package/libsocketcan/Config.in"
 	source "package/libsoup/Config.in"
+	source "package/libsoup3/Config.in"
 	source "package/libsrtp/Config.in"
 	source "package/libstrophe/Config.in"
 	source "package/libteam/Config.in"
diff --git a/package/libsoup3/Config.in b/package/libsoup3/Config.in
new file mode 100644
index 0000000000..504cc3bd2b
--- /dev/null
+++ b/package/libsoup3/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_LIBSOUP3
+	bool "libsoup3"
+	depends on BR2_USE_WCHAR # glib2, libpsl
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBPSL
+	select BR2_PACKAGE_NGHTTP2
+	select BR2_PACKAGE_SQLITE
+	help
+	  libsoup3 is an HTTP client/server library. It uses GObject
+	  and the GLib main loop, to integrate well with GNOME
+	  applications.
+
+	  https://wiki.gnome.org/Projects/libsoup
+
+if BR2_PACKAGE_LIBSOUP3
+
+config BR2_PACKAGE_LIBSOUP3_SSL
+	bool "https support"
+	depends on !BR2_STATIC_LIBS # glib-networking, gnutls
+	select BR2_PACKAGE_GLIB_NETWORKING # runtime
+	select BR2_PACKAGE_GNUTLS # runtime
+	help
+	  Enable HTTPS (SSL) support.
+
+comment "libsoup3 https support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
+endif
+
+comment "libsoup3 needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libsoup3/libsoup3.hash b/package/libsoup3/libsoup3.hash
new file mode 100644
index 0000000000..01313b394b
--- /dev/null
+++ b/package/libsoup3/libsoup3.hash
@@ -0,0 +1,4 @@
+# From https://download.gnome.org/sources/libsoup/3.4/libsoup-3.4.2.sha256sum
+sha256  78c8fa37cb152d40ec8c4a148d6155e2f6947f3f1602a7cda3a31ad40f5ee2f3  libsoup-3.4.2.tar.xz
+# Locally calculated
+sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup3/libsoup3.mk b/package/libsoup3/libsoup3.mk
new file mode 100644
index 0000000000..9e66b6ebd2
--- /dev/null
+++ b/package/libsoup3/libsoup3.mk
@@ -0,0 +1,57 @@
+################################################################################
+#
+# libsoup3
+#
+################################################################################
+
+LIBSOUP3_VERSION_MAJOR = 3.4
+LIBSOUP3_VERSION = $(LIBSOUP3_VERSION_MAJOR).2
+LIBSOUP3_SOURCE = libsoup-$(LIBSOUP3_VERSION).tar.xz
+LIBSOUP3_SITE = https://download.gnome.org/sources/libsoup/$(LIBSOUP3_VERSION_MAJOR)
+LIBSOUP3_LICENSE = LGPL-2.0+
+LIBSOUP3_LICENSE_FILES = COPYING
+LIBSOUP3_CPE_ID_VENDOR = gnome
+LIBSOUP3_INSTALL_STAGING = YES
+LIBSOUP3_DEPENDENCIES = \
+	host-intltool \
+	host-libglib2 \
+	host-pkgconf \
+	libglib2 \
+	libpsl \
+	nghttp2 \
+	sqlite \
+	$(TARGET_NLS_DEPENDENCIES)
+
+LIBSOUP3_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+
+LIBSOUP3_CONF_OPTS = \
+	-Dntlm=disabled \
+	-Dsysprof=disabled \
+	-Dtests=false \
+	-Dtls_check=false \
+	-Dvapi=disabled
+
+ifeq ($(BR2_PACKAGE_BROTLI),y)
+LIBSOUP3_CONF_OPTS += -Dbrotli=enabled
+LIBSOUP3_DEPENDENCIES += brotli
+else
+LIBSOUP3_CONF_OPTS += -Dbrotli=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBSOUP3_CONF_OPTS += -Dintrospection=enabled
+LIBSOUP3_DEPENDENCIES += gobject-introspection
+else
+LIBSOUP3_CONF_OPTS += -Dintrospection=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBKRB5),y)
+LIBSOUP3_CONF_OPTS += \
+	-Dgssapi=enabled \
+	-Dkrb5_config=$(STAGING_DIR)/usr/bin/krb5-config
+LIBSOUP3_DEPENDENCIES += libkrb5
+else
+LIBSOUP3_CONF_OPTS += -Dgssapi=disabled
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64876C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:39:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 070B8610CA
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 070B8610CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3B1640268;
	Wed, 17 Nov 2021 21:39:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EAJg9m9iOSLc; Wed, 17 Nov 2021 21:39:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D240A403C4;
	Wed, 17 Nov 2021 21:39:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5117B1BF307
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 994D860A87
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:38:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D4bstjJiHG_A for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:38:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48ABC60A83
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:38:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3D76A8D5A1; Wed, 17 Nov 2021 21:34:07 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 22:34:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 84e90ce45c34eb21596e4208510605ddb507419a
X-Git-Newrev: 3db4d486d689b4a9d59c8f7637211893b0a1cb1b
X-Patchwork-Hint: ignore
Message-Id: <20211117213407.3D76A8D5A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libmediaart: bump to
 version 1.9.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=3db4d486d689b4a9d59c8f7637211893b0a1cb1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Switch to meson-package
- Drop BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE which is not supported
  anymore
- Update indentation in hash file (two spaces)

https://gitlab.gnome.org/GNOME/libmediaart/-/blob/1.9.5/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                                   |  9 +++
 .../0001-meson-add-introspection-option.patch      | 87 ++++++++++++++++++++++
 .../0002-meson-add-unit_tests-option.patch         | 48 ++++++++++++
 package/libmediaart/Config.in                      |  8 +-
 package/libmediaart/libmediaart.hash               |  6 +-
 package/libmediaart/libmediaart.mk                 | 25 +++----
 6 files changed, 157 insertions(+), 26 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 40011a1890..f3ecf981c0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,15 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2022.02"
+
+config BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE
+	bool "libmediaart 'none' backend removed"
+	select BR2_LEGACY
+	help
+	  'none' backend has been removed from libmediaart since version
+	  1.9.5.
+
 comment "Legacy options removed in 2021.11"
 
 config BR2_OPENJDK_VERSION_LTS
diff --git a/package/libmediaart/0001-meson-add-introspection-option.patch b/package/libmediaart/0001-meson-add-introspection-option.patch
new file mode 100644
index 0000000000..2b849040fe
--- /dev/null
+++ b/package/libmediaart/0001-meson-add-introspection-option.patch
@@ -0,0 +1,87 @@
+From ee7d8736af172cd5ad71a0bd511c39daf401e3f6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 5 Oct 2021 23:35:26 +0200
+Subject: [PATCH] meson: add introspection option
+
+Add introspection option
+
+Fix #3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.gnome.org/GNOME/libmediaart/-/merge_requests/14]
+---
+ libmediaart/meson.build | 42 +++++++++++++++++++++--------------------
+ meson_options.txt       |  2 ++
+ 2 files changed, 24 insertions(+), 20 deletions(-)
+
+diff --git a/libmediaart/meson.build b/libmediaart/meson.build
+index 56e00ab..2f44e63 100644
+--- a/libmediaart/meson.build
++++ b/libmediaart/meson.build
+@@ -41,28 +41,30 @@ libmediaart = shared_library(
+   install: true,
+ )
+ 
+-gir_args = [
+-  '--quiet',
+-  '-DLIBMEDIAART_COMPILATION',
+-]
++if get_option('introspection')
++  gir_args = [
++    '--quiet',
++    '-DLIBMEDIAART_COMPILATION',
++  ]
+ 
+-libmediaart_gir_and_typelib = gnome.generate_gir(libmediaart,
+-  sources: libmediaart_sources + libmediaart_introspection_sources + libmediaart_public_headers,
+-  nsversion: libmediaart_api_version,
+-  namespace: 'MediaArt',
+-  identifier_prefix: 'MediaArt',
+-  symbol_prefix: 'media_art',
+-  includes: ['Gio-2.0', 'GObject-2.0'],
+-  header: 'libmediaart/mediaart.h',
+-  export_packages: 'libmediaart-' + libmediaart_api_version,
+-  extra_args: gir_args,
+-  install: true
+-)
++  libmediaart_gir_and_typelib = gnome.generate_gir(libmediaart,
++    sources: libmediaart_sources + libmediaart_introspection_sources + libmediaart_public_headers,
++    nsversion: libmediaart_api_version,
++    namespace: 'MediaArt',
++    identifier_prefix: 'MediaArt',
++    symbol_prefix: 'media_art',
++    includes: ['Gio-2.0', 'GObject-2.0'],
++    header: 'libmediaart/mediaart.h',
++    export_packages: 'libmediaart-' + libmediaart_api_version,
++    extra_args: gir_args,
++    install: true
++  )
+ 
+-libmediaart_vapi = gnome.generate_vapi('libmediaart-' + libmediaart_api_version,
+-  sources: libmediaart_gir_and_typelib[0],
+-  packages: 'gio-2.0',
+-  install: true)
++  libmediaart_vapi = gnome.generate_vapi('libmediaart-' + libmediaart_api_version,
++    sources: libmediaart_gir_and_typelib[0],
++    packages: 'gio-2.0',
++    install: true)
++endif
+ 
+ libmediaart_dep = declare_dependency(
+   link_with: libmediaart,
+diff --git a/meson_options.txt b/meson_options.txt
+index 3ef49ba..b8c51b1 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -1,5 +1,7 @@
+ option('image_library', type: 'combo', choices: ['auto', 'gdk-pixbuf', 'qt4', 'qt5'],
+        description: 'Which image processing backend to use')
++option('introspection', type : 'boolean', value : 'true',
++       description : 'Enable / disable the GObject-Introspection integration')
+ option('gtk_doc',
+   type: 'boolean',
+   value: 'false',
+-- 
+2.33.0
+
diff --git a/package/libmediaart/0002-meson-add-unit_tests-option.patch b/package/libmediaart/0002-meson-add-unit_tests-option.patch
new file mode 100644
index 0000000000..3519ff1984
--- /dev/null
+++ b/package/libmediaart/0002-meson-add-unit_tests-option.patch
@@ -0,0 +1,48 @@
+From 01d94777d9d1906750db0e27e2e7b8f228ae4343 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 9 Oct 2021 23:45:53 +0200
+Subject: [PATCH] meson: add unit_tests option
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:  not sent yet (waiting feedback on first patch)]
+---
+ meson_options.txt |  2 ++
+ tests/meson.build | 14 ++++++++------
+ 2 files changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/meson_options.txt b/meson_options.txt
+index b8c51b1..1172f93 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -2,6 +2,8 @@ option('image_library', type: 'combo', choices: ['auto', 'gdk-pixbuf', 'qt4', 'q
+        description: 'Which image processing backend to use')
+ option('introspection', type : 'boolean', value : 'true',
+        description : 'Enable / disable the GObject-Introspection integration')
++option('unit_tests', type : 'boolean', value : 'true',
++       description : 'Enable / disable unit tests')
+ option('gtk_doc',
+   type: 'boolean',
+   value: 'false',
+diff --git a/tests/meson.build b/tests/meson.build
+index 28834c0..02c96a1 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -1,7 +1,9 @@
+-mediaart_test = executable('mediaart-test',
+-  'mediaarttest.c',
+-  dependencies: libmediaart_dep,
+-)
++if get_option('unit_tests')
++  mediaart_test = executable('mediaart-test',
++    'mediaarttest.c',
++    dependencies: libmediaart_dep,
++  )
+ 
+-test('mediaart', mediaart_test,
+-     env: 'G_TEST_SRCDIR=' + meson.current_source_dir())
++  test('mediaart', mediaart_test,
++       env: 'G_TEST_SRCDIR=' + meson.current_source_dir())
++endif
+-- 
+2.33.0
+
diff --git a/package/libmediaart/Config.in b/package/libmediaart/Config.in
index c11d6f49d9..d7973444ae 100644
--- a/package/libmediaart/Config.in
+++ b/package/libmediaart/Config.in
@@ -18,13 +18,7 @@ if BR2_PACKAGE_LIBMEDIAART
 
 choice
 	prompt "media art backend"
-	default BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE
-
-config BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE
-	bool "none"
-	help
-	  With no backend, libmediaart will not be able to process MP3
-	  album art.
+	default BR2_PACKAGE_LIBMEDIAART_BACKEND_GDK_PIXBUF
 
 config BR2_PACKAGE_LIBMEDIAART_BACKEND_GDK_PIXBUF
 	bool "gdk-pixbuf"
diff --git a/package/libmediaart/libmediaart.hash b/package/libmediaart/libmediaart.hash
index d51c056223..d7115b20d4 100644
--- a/package/libmediaart/libmediaart.hash
+++ b/package/libmediaart/libmediaart.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/libmediaart/1.9/libmediaart-1.9.4.sha256sum:
-sha256	a57be017257e4815389afe4f58fdacb6a50e74fd185452b23a652ee56b04813d	libmediaart-1.9.4.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/libmediaart/1.9/libmediaart-1.9.5.sha256sum:
+sha256  07def5a42c482ae71d3e1f77a4d0fdc337f74226059a65284d6d5a241f0e9cd6  libmediaart-1.9.5.tar.xz
 
 # Locally computed:
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING.LESSER
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index 0d110a43e5..b4c09d85e1 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -5,39 +5,32 @@
 ################################################################################
 
 LIBMEDIAART_VERSION_MAJOR = 1.9
-LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).4
+LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).5
 LIBMEDIAART_SOURCE = libmediaart-$(LIBMEDIAART_VERSION).tar.xz
 LIBMEDIAART_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/libmediaart/$(LIBMEDIAART_VERSION_MAJOR)
 LIBMEDIAART_LICENSE = LGPL-2.1+
 LIBMEDIAART_LICENSE_FILES = COPYING.LESSER
 LIBMEDIAART_INSTALL_STAGING = YES
-LIBMEDIAART_DEPENDENCIES = libglib2
-LIBMEDIAART_CONF_OPTS = --disable-unit-tests
+LIBMEDIAART_DEPENDENCIES = libglib2 $(TARGET_NLS_DEPENDENCIES)
+LIBMEDIAART_CONF_OPTS = -Dunit_tests=false
+LIBMEDIAART_LDFLAGS = $(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LIBMEDIAART_BACKEND_GDK_PIXBUF),y)
 LIBMEDIAART_DEPENDENCIES += gdk-pixbuf
-LIBMEDIAART_CONF_OPTS += \
-	--enable-gdkpixbuf \
-	--disable-qt
+LIBMEDIAART_CONF_OPTS += -Dimage_library=gdk-pixbuf
 else ifeq ($(BR2_PACKAGE_LIBMEDIAART_BACKEND_QT),y)
 # qt5 needs c++11 (since qt-5.7)
 LIBMEDIAART_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 LIBMEDIAART_DEPENDENCIES += qt5base
-LIBMEDIAART_CONF_OPTS += \
-	--disable-gdkpixbuf \
-	--enable-qt
-else ifeq ($(BR2_PACKAGE_LIBMEDIAART_BACKEND_NONE),y)
-LIBMEDIAART_CONF_OPTS += \
-	--disable-gdkpixbuf \
-	--disable-qt
+LIBMEDIAART_CONF_OPTS += -Dimage_library=qt5
 endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-LIBMEDIAART_CONF_OPTS += --enable-introspection
+LIBMEDIAART_CONF_OPTS += -Dintrospection=true
 LIBMEDIAART_DEPENDENCIES += gobject-introspection
 else
-LIBMEDIAART_CONF_OPTS += --disable-introspection
+LIBMEDIAART_CONF_OPTS += -Dintrospection=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

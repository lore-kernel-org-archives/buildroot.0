Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56F2C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 17:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DEC860D5F;
	Tue, 14 Jun 2022 17:00:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ajRgU-ZhA3Tq; Tue, 14 Jun 2022 17:00:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 315B360B02;
	Tue, 14 Jun 2022 17:00:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 880B81BF37A
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0018417B3
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 16:58:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VZdfF1U_y6nX for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 16:58:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54E1541812
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 16:58:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7071E8705D; Tue, 14 Jun 2022 16:45:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 17:59:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6e7d92d822b5e8e7067e33bf69972f884a90355
X-Git-Newrev: 9c95e3492e11c033a03cc5845dd9e359ed28497d
X-Patchwork-Hint: ignore
Message-Id: <20220614164552.7071E8705D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmediaart: bump to version 1.9.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c95e3492e11c033a03cc5845dd9e359ed28497d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop all patches (already in version)
- unit_tests option has been renamed tests:
  https://gitlab.gnome.org/GNOME/libmediaart/-/commit/1b0be1d5bea76c1d02a7afebc431844e933ed4a8

https://gitlab.gnome.org/GNOME/libmediaart/-/blob/1.9.6/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-meson-add-introspection-option.patch      | 87 ----------------------
 .../0002-meson-add-unit_tests-option.patch         | 48 ------------
 ...diaart-meson.build-replace-shared_library.patch | 35 ---------
 package/libmediaart/libmediaart.hash               |  4 +-
 package/libmediaart/libmediaart.mk                 |  4 +-
 5 files changed, 4 insertions(+), 174 deletions(-)

diff --git a/package/libmediaart/0001-meson-add-introspection-option.patch b/package/libmediaart/0001-meson-add-introspection-option.patch
deleted file mode 100644
index 2b849040fe..0000000000
--- a/package/libmediaart/0001-meson-add-introspection-option.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From ee7d8736af172cd5ad71a0bd511c39daf401e3f6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 5 Oct 2021 23:35:26 +0200
-Subject: [PATCH] meson: add introspection option
-
-Add introspection option
-
-Fix #3
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.gnome.org/GNOME/libmediaart/-/merge_requests/14]
----
- libmediaart/meson.build | 42 +++++++++++++++++++++--------------------
- meson_options.txt       |  2 ++
- 2 files changed, 24 insertions(+), 20 deletions(-)
-
-diff --git a/libmediaart/meson.build b/libmediaart/meson.build
-index 56e00ab..2f44e63 100644
---- a/libmediaart/meson.build
-+++ b/libmediaart/meson.build
-@@ -41,28 +41,30 @@ libmediaart = shared_library(
-   install: true,
- )
- 
--gir_args = [
--  '--quiet',
--  '-DLIBMEDIAART_COMPILATION',
--]
-+if get_option('introspection')
-+  gir_args = [
-+    '--quiet',
-+    '-DLIBMEDIAART_COMPILATION',
-+  ]
- 
--libmediaart_gir_and_typelib = gnome.generate_gir(libmediaart,
--  sources: libmediaart_sources + libmediaart_introspection_sources + libmediaart_public_headers,
--  nsversion: libmediaart_api_version,
--  namespace: 'MediaArt',
--  identifier_prefix: 'MediaArt',
--  symbol_prefix: 'media_art',
--  includes: ['Gio-2.0', 'GObject-2.0'],
--  header: 'libmediaart/mediaart.h',
--  export_packages: 'libmediaart-' + libmediaart_api_version,
--  extra_args: gir_args,
--  install: true
--)
-+  libmediaart_gir_and_typelib = gnome.generate_gir(libmediaart,
-+    sources: libmediaart_sources + libmediaart_introspection_sources + libmediaart_public_headers,
-+    nsversion: libmediaart_api_version,
-+    namespace: 'MediaArt',
-+    identifier_prefix: 'MediaArt',
-+    symbol_prefix: 'media_art',
-+    includes: ['Gio-2.0', 'GObject-2.0'],
-+    header: 'libmediaart/mediaart.h',
-+    export_packages: 'libmediaart-' + libmediaart_api_version,
-+    extra_args: gir_args,
-+    install: true
-+  )
- 
--libmediaart_vapi = gnome.generate_vapi('libmediaart-' + libmediaart_api_version,
--  sources: libmediaart_gir_and_typelib[0],
--  packages: 'gio-2.0',
--  install: true)
-+  libmediaart_vapi = gnome.generate_vapi('libmediaart-' + libmediaart_api_version,
-+    sources: libmediaart_gir_and_typelib[0],
-+    packages: 'gio-2.0',
-+    install: true)
-+endif
- 
- libmediaart_dep = declare_dependency(
-   link_with: libmediaart,
-diff --git a/meson_options.txt b/meson_options.txt
-index 3ef49ba..b8c51b1 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -1,5 +1,7 @@
- option('image_library', type: 'combo', choices: ['auto', 'gdk-pixbuf', 'qt4', 'qt5'],
-        description: 'Which image processing backend to use')
-+option('introspection', type : 'boolean', value : 'true',
-+       description : 'Enable / disable the GObject-Introspection integration')
- option('gtk_doc',
-   type: 'boolean',
-   value: 'false',
--- 
-2.33.0
-
diff --git a/package/libmediaart/0002-meson-add-unit_tests-option.patch b/package/libmediaart/0002-meson-add-unit_tests-option.patch
deleted file mode 100644
index 3519ff1984..0000000000
--- a/package/libmediaart/0002-meson-add-unit_tests-option.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 01d94777d9d1906750db0e27e2e7b8f228ae4343 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 9 Oct 2021 23:45:53 +0200
-Subject: [PATCH] meson: add unit_tests option
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:  not sent yet (waiting feedback on first patch)]
----
- meson_options.txt |  2 ++
- tests/meson.build | 14 ++++++++------
- 2 files changed, 10 insertions(+), 6 deletions(-)
-
-diff --git a/meson_options.txt b/meson_options.txt
-index b8c51b1..1172f93 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -2,6 +2,8 @@ option('image_library', type: 'combo', choices: ['auto', 'gdk-pixbuf', 'qt4', 'q
-        description: 'Which image processing backend to use')
- option('introspection', type : 'boolean', value : 'true',
-        description : 'Enable / disable the GObject-Introspection integration')
-+option('unit_tests', type : 'boolean', value : 'true',
-+       description : 'Enable / disable unit tests')
- option('gtk_doc',
-   type: 'boolean',
-   value: 'false',
-diff --git a/tests/meson.build b/tests/meson.build
-index 28834c0..02c96a1 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -1,7 +1,9 @@
--mediaart_test = executable('mediaart-test',
--  'mediaarttest.c',
--  dependencies: libmediaart_dep,
--)
-+if get_option('unit_tests')
-+  mediaart_test = executable('mediaart-test',
-+    'mediaarttest.c',
-+    dependencies: libmediaart_dep,
-+  )
- 
--test('mediaart', mediaart_test,
--     env: 'G_TEST_SRCDIR=' + meson.current_source_dir())
-+  test('mediaart', mediaart_test,
-+       env: 'G_TEST_SRCDIR=' + meson.current_source_dir())
-+endif
--- 
-2.33.0
-
diff --git a/package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch b/package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch
deleted file mode 100644
index d4b377d327..0000000000
--- a/package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 2272d762436a3b0d2e4fef8fb4f1669814904620 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 12 Dec 2021 20:14:54 +0100
-Subject: [PATCH] libmediaart/meson.build: replace shared_library
-
-Replace shared_library by library call to avoid the following build
-failure when building statically:
-
-/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
-__uClibc_main.c:(.text+0x15c): undefined reference to `__fini_array_start'
-
-Fixes:
- - http://autobuild.buildroot.org/results/18d26882a68dcf8f09b3e3d25636454a12939310
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libmediaart/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libmediaart/meson.build b/libmediaart/meson.build
-index 2f44e63..1fd3b99 100644
---- a/libmediaart/meson.build
-+++ b/libmediaart/meson.build
-@@ -30,7 +30,7 @@ marshal = gnome.genmarshal('marshal',
- 
- libmediaart_dependencies = [glib, gio_unix, gobject, image_library]
- 
--libmediaart = shared_library(
-+libmediaart = library(
-   'mediaart-' + libmediaart_api_version,
-   libmediaart_sources, marshal[0], marshal[1],
-   version: libmediaart_ltversion,
--- 
-2.33.0
-
diff --git a/package/libmediaart/libmediaart.hash b/package/libmediaart/libmediaart.hash
index d7115b20d4..ebc914526b 100644
--- a/package/libmediaart/libmediaart.hash
+++ b/package/libmediaart/libmediaart.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/libmediaart/1.9/libmediaart-1.9.5.sha256sum:
-sha256  07def5a42c482ae71d3e1f77a4d0fdc337f74226059a65284d6d5a241f0e9cd6  libmediaart-1.9.5.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/libmediaart/1.9/libmediaart-1.9.6.sha256sum:
+sha256  c3bc5025d7db380587f9c8eb800c611f6b5a16d6b4b78fcff93f62876a677f17  libmediaart-1.9.6.tar.xz
 
 # Locally computed:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index de92cde849..429e0c20de 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMEDIAART_VERSION_MAJOR = 1.9
-LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).5
+LIBMEDIAART_VERSION = $(LIBMEDIAART_VERSION_MAJOR).6
 LIBMEDIAART_SOURCE = libmediaart-$(LIBMEDIAART_VERSION).tar.xz
 LIBMEDIAART_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/libmediaart/$(LIBMEDIAART_VERSION_MAJOR)
@@ -13,7 +13,7 @@ LIBMEDIAART_LICENSE = LGPL-2.1+
 LIBMEDIAART_LICENSE_FILES = COPYING.LESSER
 LIBMEDIAART_INSTALL_STAGING = YES
 LIBMEDIAART_DEPENDENCIES = libglib2 $(TARGET_NLS_DEPENDENCIES)
-LIBMEDIAART_CONF_OPTS = -Dunit_tests=false
+LIBMEDIAART_CONF_OPTS = -Dtests=false
 LIBMEDIAART_LDFLAGS = $(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LIBMEDIAART_BACKEND_GDK_PIXBUF),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC53C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E906B6FB32;
	Sun, 11 Sep 2022 09:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E906B6FB32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FoUpDMEzwhI; Sun, 11 Sep 2022 09:13:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4D0B6FB09;
	Sun, 11 Sep 2022 09:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4D0B6FB09
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8326A1BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22ED96106E
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22ED96106E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w2C_Q7pxU_Pr for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF45E6FB30
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF45E6FB30
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AAB098361F; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 19:30:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d68628a5382844a40856be486cd41dbfb0c7cabb
X-Git-Newrev: 3c09118dc42f48156376527665a38d1cbb871a38
X-Patchwork-Hint: ignore
Message-Id: <20220911084827.AAB098361F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gobject-introspection: bump
 version to 1.72.0
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
Content-Type: multipart/mixed; boundary="===============0928999761146985708=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0928999761146985708==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3c09118dc42f48156376527665a38d1cbb871a38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove upstreamed patch 0004-build-Avoid-the-doctemplates-hack.patch.
- Update license hashes due to address changes.

Signed-off-by: Adam Duskett <aduskett@rivian.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../gobject-introspection/0001-disable-tests.patch |   2 +-
 .../0004-build-Avoid-the-doctemplates-hack.patch   | 221 ---------------------
 .../gobject-introspection.hash                     |   8 +-
 .../gobject-introspection/gobject-introspection.mk |   2 +-
 4 files changed, 6 insertions(+), 227 deletions(-)

diff --git a/package/gobject-introspection/0001-disable-tests.patch b/package/gobject-introspection/0001-disable-tests.patch
index ed2d9d6fc0..390707c10a 100644
--- a/package/gobject-introspection/0001-disable-tests.patch
+++ b/package/gobject-introspection/0001-disable-tests.patch
@@ -16,7 +16,7 @@ diff --git a/meson.build b/meson.build
 index c2cb577f..65ce7adf 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -225,12 +225,6 @@ else
+@@ -232,12 +232,6 @@ else
  endif
  subdir('docs')
  
diff --git a/package/gobject-introspection/0004-build-Avoid-the-doctemplates-hack.patch b/package/gobject-introspection/0004-build-Avoid-the-doctemplates-hack.patch
deleted file mode 100644
index 0b70b5c4c0..0000000000
--- a/package/gobject-introspection/0004-build-Avoid-the-doctemplates-hack.patch
+++ /dev/null
@@ -1,221 +0,0 @@
-From 0504b26ec2adb13dfdff51679d84ad2f69af5918 Mon Sep 17 00:00:00 2001
-From: Emmanuele Bassi <ebassi@gnome.org>
-Date: Tue, 11 Jan 2022 15:51:10 +0000
-Subject: [PATCH] build: Avoid the doctemplates hack
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The hack that copies the doctemplates directory into the build
-directory has stopped working with newer versions of Meson; while it's
-possible to copy files, custom_target() cannot depend on a directory.
-Additionally, the dependency has always been broken.
-
-Instead, we enumerate the template files—after all, it's not like they
-change a lot—and then we list them as dependencies for the test targets.
-
-Fixes: #414
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-effb1e09dee263cdac4ec593e8caf316e6f01fe2]
----
- giscanner/doctemplates/devdocs/meson.build | 19 +++++++
- giscanner/doctemplates/mallard/meson.build | 63 ++++++++++++++++++++++
- giscanner/meson.build                      | 14 ++---
- tests/scanner/meson.build                  | 24 +++++----
- 4 files changed, 98 insertions(+), 22 deletions(-)
- create mode 100644 giscanner/doctemplates/devdocs/meson.build
- create mode 100644 giscanner/doctemplates/mallard/meson.build
-
-diff --git a/giscanner/doctemplates/devdocs/meson.build b/giscanner/doctemplates/devdocs/meson.build
-new file mode 100644
-index 00000000..2037182a
---- /dev/null
-+++ b/giscanner/doctemplates/devdocs/meson.build
-@@ -0,0 +1,19 @@
-+doc_templates += files([
-+  'Gjs/_doc.tmpl',
-+  'Gjs/_index.tmpl',
-+  'Gjs/_method.tmpl',
-+  'Gjs/_methods.tmpl',
-+  'Gjs/_properties.tmpl',
-+  'Gjs/_signals.tmpl',
-+  'Gjs/_staticmethods.tmpl',
-+  'Gjs/_vfuncs.tmpl',
-+  'Gjs/base.tmpl',
-+  'Gjs/callback.tmpl',
-+  'Gjs/class.tmpl',
-+  'Gjs/default.tmpl',
-+  'Gjs/enum.tmpl',
-+  'Gjs/function.tmpl',
-+  'Gjs/interface.tmpl',
-+  'Gjs/method.tmpl',
-+  'Gjs/namespace.tmpl',
-+])
-diff --git a/giscanner/doctemplates/mallard/meson.build b/giscanner/doctemplates/mallard/meson.build
-new file mode 100644
-index 00000000..5fe4e2af
---- /dev/null
-+++ b/giscanner/doctemplates/mallard/meson.build
-@@ -0,0 +1,63 @@
-+base_templates = files([
-+  'base.tmpl',
-+  'class.tmpl',
-+  'namespace.tmpl',
-+])
-+
-+c_templates = files([
-+  'C/callback.tmpl',
-+  'C/class.tmpl',
-+  'C/constructor.tmpl',
-+  'C/default.tmpl',
-+  'C/enum.tmpl',
-+  'C/field.tmpl',
-+  'C/function.tmpl',
-+  'C/interface.tmpl',
-+  'C/method.tmpl',
-+  'C/namespace.tmpl',
-+  'C/property.tmpl',
-+  'C/record.tmpl',
-+  'C/signal.tmpl',
-+  'C/vfunc.tmpl',
-+])
-+
-+gjs_templates = files([
-+  'Gjs/callback.tmpl',
-+  'Gjs/class.tmpl',
-+  'Gjs/constructor.tmpl',
-+  'Gjs/default.tmpl',
-+  'Gjs/enum.tmpl',
-+  'Gjs/field.tmpl',
-+  'Gjs/function.tmpl',
-+  'Gjs/interface.tmpl',
-+  'Gjs/method.tmpl',
-+  'Gjs/namespace.tmpl',
-+  'Gjs/property.tmpl',
-+  'Gjs/record.tmpl',
-+  'Gjs/signal.tmpl',
-+  'Gjs/vfunc.tmpl',
-+])
-+
-+py_templates = files([
-+  'Python/callback.tmpl',
-+  'Python/class.tmpl',
-+  'Python/constructor.tmpl',
-+  'Python/default.tmpl',
-+  'Python/enum.tmpl',
-+  'Python/field.tmpl',
-+  'Python/function.tmpl',
-+  'Python/interface.tmpl',
-+  'Python/method.tmpl',
-+  'Python/namespace.tmpl',
-+  'Python/property.tmpl',
-+  'Python/record.tmpl',
-+  'Python/signal.tmpl',
-+  'Python/vfunc.tmpl',
-+])
-+
-+doc_templates += [
-+  base_templates,
-+  c_templates,
-+  gjs_templates,
-+  py_templates,
-+]
-diff --git a/giscanner/meson.build b/giscanner/meson.build
-index 41edcd44..3d7dc678 100644
---- a/giscanner/meson.build
-+++ b/giscanner/meson.build
-@@ -53,17 +53,9 @@ configure_file(input : '../girepository/gdump.c',
- 
- install_subdir('doctemplates', install_dir: giscannerdir)
- 
--# XXX: this doesn't track the input, but there is nothing to copy many files
--# in meson.
--doc_templates = custom_target('copy-templates',
--  input : 'doctemplates',
--  output : 'doctemplates',
--  command : [
--    python, '-c',
--      'import sys, shutil;' +
--      'shutil.rmtree(sys.argv[2], ignore_errors=True);' +
--      'shutil.copytree(sys.argv[1], sys.argv[2])',
--    '@INPUT@', '@OUTPUT@'])
-+doc_templates = []
-+subdir('doctemplates/devdocs')
-+subdir('doctemplates/mallard')
- 
- flex = find_program('flex', 'win_flex')
- bison = find_program('bison', 'win_bison')
-diff --git a/tests/scanner/meson.build b/tests/scanner/meson.build
-index 5176b957..b81b3fd5 100644
---- a/tests/scanner/meson.build
-+++ b/tests/scanner/meson.build
-@@ -525,19 +525,26 @@ foreach gir : test_girs
- endforeach
- 
- if has_girdoctool and glib_dep.type_name() == 'pkgconfig'
-+  doctool_env = environment()
-+  doctool_env.set('srcdir', meson.current_source_dir())
-+  doctool_env.set('builddir', meson.current_build_dir())
-+
-   foreach language : ['C', 'Python', 'Gjs']
-     regress_docs = custom_target(
-       'generate-docs-' + language,
-       input: regress_gir,
--      depends: [doc_templates],
-+      depend_files: doc_templates,
-       build_by_default: not cairo_deps_found,
-+      env: doctool_env,
-       output: 'Regress-1.0-' + language,
-       command: [
-         python, girdoctool,
-         '--add-include-path=' + join_paths(build_root, 'gir'),
-         '--add-include-path=' + meson.current_build_dir(),
-         '--language', language,
--        '@INPUT@', '-o', '@OUTPUT@'],
-+        '--templates-dir=' + join_paths(meson.current_source_dir(), '../../giscanner/doctemplates'),
-+        '@INPUT@', '-o', '@OUTPUT@',
-+      ],
-     )
- 
-     if cairo_deps_found
-@@ -546,10 +553,7 @@ if has_girdoctool and glib_dep.type_name() == 'pkgconfig'
-         python,
-         args: [gi_tester, 'Regress-1.0-' + language],
-         depends: [regress_docs],
--        env: [
--          'srcdir=' + meson.current_source_dir(),
--          'builddir=' + meson.current_build_dir(),
--        ],
-+        env: doctool_env,
-       )
-     endif
-   endforeach
-@@ -557,9 +561,10 @@ if has_girdoctool and glib_dep.type_name() == 'pkgconfig'
-   regress_sections = custom_target(
-     'generate-docs-sections',
-     input: regress_gir,
--    depends: [doc_templates],
-+    depend_files: [doc_templates],
-     build_by_default: not cairo_deps_found,
-     output: 'Regress-1.0-sections.txt',
-+    env: doctool_env,
-     command: [
-       python, girdoctool,
-       '--add-include-path=' + join_paths(build_root, 'gir'),
-@@ -574,10 +579,7 @@ if has_girdoctool and glib_dep.type_name() == 'pkgconfig'
-       python,
-       args: [gi_tester, 'Regress-1.0-sections.txt'],
-       depends: [regress_sections],
--      env: [
--        'srcdir=' + meson.current_source_dir(),
--        'builddir=' + meson.current_build_dir(),
--      ],
-+      env: doctool_env,
-     )
-   endif
- endif
--- 
-2.25.1
-
diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
index 5b76df6b40..8f9d323d9a 100644
--- a/package/gobject-introspection/gobject-introspection.hash
+++ b/package/gobject-introspection/gobject-introspection.hash
@@ -1,5 +1,5 @@
-#From http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.70/gobject-introspection-1.70.0.sha256sum
-sha256  902b4906e3102d17aa2fcb6dad1c19971c70f2a82a159ddc4a94df73a3cafc4a  gobject-introspection-1.70.0.tar.xz
-sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING.LGPL
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING.GPL
+#From http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.70/gobject-introspection-1.72.0.sha256sum
+sha256  02fe8e590861d88f83060dd39cda5ccaa60b2da1d21d0f95499301b186beaabc  gobject-introspection-1.72.0.tar.xz
+sha256  faa2e414bd5f91d2d2c39e85c7cc3f2ccde05c3306f96b404f8ed8cf0266c279  COPYING.LGPL
+sha256  4c1cedcbb4a12ea964f1160dbbf36099e5a59b96129a99a1a1a61f2cb09271fb  COPYING.GPL
 sha256  23f82cbc9808cdd8e902df38271434040ce0562ca382ac2a96f5e3bf807b6d31  giscanner/scannerlexer.l
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index 41d64171a7..c8ad9b3c72 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.70
+GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.72
 GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
 GOBJECT_INTROSPECTION_SITE = http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
 GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz

--===============0928999761146985708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0928999761146985708==--

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D1BC4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 390474050E;
	Tue,  6 Feb 2024 10:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 390474050E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i5kORMNjnJTc; Tue,  6 Feb 2024 10:13:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDD9F4049A;
	Tue,  6 Feb 2024 10:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDD9F4049A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07DEC1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4582402B1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4582402B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FZ7H3T7g__NS for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:13:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02C0840176
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02C0840176
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E01EB86F05; Tue,  6 Feb 2024 10:13:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 10:51:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3613cc9b3fe7d60e46ec7ddf5fe50a895797665
X-Git-Newrev: 02734c0c22b5567194f187b5650470f90c6db681
X-Patchwork-Hint: ignore
Message-Id: <20240206101345.E01EB86F05@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rygel: bump to version 0.42.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=02734c0c22b5567194f187b5650470f90c6db681
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop first patch (already in version)
- Refresh second patch
- x11 is mandatory since
  https://gitlab.gnome.org/GNOME/rygel/-/commit/18cd2cff6f64b7a54156ac97e5c4f50eb8fd8d67
  and upstream doesn't want to make it optional:
  https://gitlab.gnome.org/GNOME/rygel/-/issues/221
- This bump will also fix the following build failure raised since bump
  of gupnp to version 1.6.6 in commit
  b7938d2ae78ace5bffcf523f06304b27cd4edc0b:

  ../output-1/build/rygel-0.40.2/meson.build:79:8: ERROR: Dependency "gupnp-1.2" not found, tried pkgconfig and cmake

https://gitlab.gnome.org/GNOME/rygel/-/blob/rygel-0.42.5/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/bdf87468199504384f79e4ab59971776d517296b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |   3 +-
 .../0001-build-Add-man_pages-build-options.patch   | 150 ---------------------
 ...0001-meson.build-fix-g_ir_compiler-calls.patch} |  16 +--
 package/rygel/Config.in                            |   3 +
 package/rygel/rygel.hash                           |   4 +-
 package/rygel/rygel.mk                             |   5 +-
 6 files changed, 17 insertions(+), 164 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 31ed5bb5cc..1f85ff2e07 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1177,8 +1177,7 @@ package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch Upstream
 package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch Upstream
 package/rubix/0001-dont-use-legacy-functions.patch Upstream
 package/rubix/0002-misc-fixes.patch Sob Upstream
-package/rygel/0001-build-Add-man_pages-build-options.patch Upstream
-package/rygel/0002-meson.build-fix-g_ir_compiler-calls.patch Upstream
+package/rygel/0001-meson.build-fix-g_ir_compiler-calls.patch Upstream
 package/rygel/S99rygel Indent Shellcheck Variables
 package/s6-linux-init/0001-configure-add-D_GNU_SOURCE.patch Upstream
 package/s6-linux-utils/0001-src-s6-linux-utils-rngseed.c-fix-build-with-glibc.patch Upstream
diff --git a/package/rygel/0001-build-Add-man_pages-build-options.patch b/package/rygel/0001-build-Add-man_pages-build-options.patch
deleted file mode 100644
index cdd7cc7721..0000000000
--- a/package/rygel/0001-build-Add-man_pages-build-options.patch
+++ /dev/null
@@ -1,150 +0,0 @@
-From 5a54c5bb1c9609b7bffe6b3e05f934030e4e990e Mon Sep 17 00:00:00 2001
-From: Jens Georg <mail@jensge.org>
-Date: Sat, 26 Dec 2020 18:40:51 +0100
-Subject: [PATCH] build: Add man_pages build options
-
-Check if xsltproc runs succesfully and fail otherwise
-
-Fixes #192
-
-[Retrieved from:
-https://gitlab.gnome.org/GNOME/rygel/-/commit/5a54c5bb1c9609b7bffe6b3e05f934030e4e990e]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- doc/man/meson.build | 98 +++++++++++++++++++++++++++------------------
- doc/meson.build     |  5 ++-
- meson_options.txt   |  1 +
- 3 files changed, 64 insertions(+), 40 deletions(-)
-
-diff --git a/doc/man/meson.build b/doc/man/meson.build
-index ef3fcfbf5..4c92eab2b 100644
---- a/doc/man/meson.build
-+++ b/doc/man/meson.build
-@@ -1,43 +1,63 @@
- xsltproc = find_program('xsltproc', required: false)
- 
- if xsltproc.found()
--  xlstproc_flags = [
--    '--nonet',
--    '--stringparam', 'man.output.quietly', '1',
--    '--stringparam', 'funcsynopsis.style', 'ansi',
--    '--stringparam', 'man.authors.section.enabled', '1',
--    '--stringparam', 'man.copyright.section.enabled', '1',
--  ]
--
--  xsltproc_args = [
--    xsltproc,
--    xlstproc_flags,
--    '-o', '@OUTPUT@',
--    'http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl',
--    '@INPUT@',
--  ]
--
--  man_input_files = [
--    'rygel.xml',
--    'rygel.conf.xml'
--  ]
--
--  man_output_files = [
--    'rygel.1',
--    'rygel.conf.5'
--  ]
--
--  custom_target('man 1 pages',
--                input: 'rygel.xml',
--                output: 'rygel.1',
--                command: xsltproc_args,
--                install: true,
--                install_dir: join_paths(get_option('mandir'), 'man1'))
--
--  custom_target('man 5 pages',
--                input: 'rygel.conf.xml',
--                output: 'rygel.conf.5',
--                command: xsltproc_args,
--                install: true,
--                install_dir: join_paths(get_option('mandir'), 'man5'))
-+    stylesheet = 'http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl'
-+
-+    xlstproc_flags = [
-+        '--nonet',
-+        '--stringparam', 'man.output.quietly', '1',
-+        '--stringparam', 'funcsynopsis.style', 'ansi',
-+        '--stringparam', 'man.authors.section.enabled', '1',
-+        '--stringparam', 'man.copyright.section.enabled', '1',
-+    ]
-+
-+    xsltproc_args = [
-+        xsltproc,
-+        xlstproc_flags,
-+        '-o', '@OUTPUT@',
-+        stylesheet,
-+        '@INPUT@',
-+    ]
-+
-+    man_input_files = [
-+        'rygel.xml',
-+        'rygel.conf.xml'
-+    ]
-+
-+    man_output_files = [
-+        'rygel.1',
-+        'rygel.conf.5'
-+    ]
-+
-+    r = run_command(
-+        [
-+            xsltproc,
-+            xlstproc_flags,
-+            '-o', '/dev/null',
-+            stylesheet,
-+            'rygel.xml'
-+        ]
-+    )
-+
-+    if (r.returncode() == 0)
-+        custom_target(
-+            'man 1 pages',
-+            input: 'rygel.xml',
-+            output: 'rygel.1',
-+            command: xsltproc_args,
-+            install: true,
-+            install_dir: join_paths(get_option('mandir'), 'man1')
-+        )
-+
-+        custom_target(
-+            'man 5 pages',
-+            input: 'rygel.conf.xml',
-+            output: 'rygel.conf.5',
-+            command: xsltproc_args,
-+            install: true,
-+            install_dir: join_paths(get_option('mandir'), 'man5')
-+        )
-+    else
-+        error('Cannot bulid man pages, failed to run xsltproc')
-+    endif
- endif
-diff --git a/doc/meson.build b/doc/meson.build
-index 41c733e50..91c08fae5 100644
---- a/doc/meson.build
-+++ b/doc/meson.build
-@@ -1,2 +1,5 @@
--subdir('man')
-+if get_option('man_pages')
-+    subdir('man')
-+endif
-+
- subdir('reference')
-diff --git a/meson_options.txt b/meson_options.txt
-index cb604c4e9..c60ff1a9a 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -1,5 +1,6 @@
- option('uninstalled', type: 'boolean', value: 'false', description: 'Run Rygel from build directory only')
- option('api-docs', type: 'boolean', value: 'false', description: 'Build the API documentation')
-+option('man_pages', type: 'boolean', value: 'true', description: 'Build the man pages')
- option('systemd-user-units-dir', type : 'string', value : 'auto', description : 'Where to install the systemd user unit (use special values "auto" or "none", or pass a path')
- option('plugins', type : 'array', choices : ['external', 'gst-launch', 'lms', 'media-export', 'mpris', 'playbin', 'ruih', 'tracker', 'tracker3'])
- option('engines', type : 'array', choices : ['simple', 'gstreamer'])
--- 
-GitLab
-
diff --git a/package/rygel/0002-meson.build-fix-g_ir_compiler-calls.patch b/package/rygel/0001-meson.build-fix-g_ir_compiler-calls.patch
similarity index 93%
rename from package/rygel/0002-meson.build-fix-g_ir_compiler-calls.patch
rename to package/rygel/0001-meson.build-fix-g_ir_compiler-calls.patch
index 3961ad0564..1d8f4599f4 100644
--- a/package/rygel/0002-meson.build-fix-g_ir_compiler-calls.patch
+++ b/package/rygel/0001-meson.build-fix-g_ir_compiler-calls.patch
@@ -35,12 +35,12 @@ index fd43bebe..e6be2b5e 100644
 @@ -70,7 +70,9 @@ core_gir = custom_target('RygelCore-2.6.gir',
  # so we depend on the custom_target from that step and pass the input through
  # commandline.
- custom_target('RygelCore-2.6.typelib',
--               command: [g_ir_compiler, '--output', '@OUTPUT@', join_paths(meson.current_build_dir(), 'RygelCore-2.6.gir')],
+ custom_target('RygelCore-2.8.typelib',
+-               command: [g_ir_compiler, '--output', '@OUTPUT@', join_paths(meson.current_build_dir(), 'RygelCore-2.8.gir')],
 +               command: [g_ir_compiler, '--output', '@OUTPUT@',
 +                         '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,
-+                         join_paths(meson.current_build_dir(), 'RygelCore-2.6.gir')],
-                output: 'RygelCore-2.6.typelib',
++                         join_paths(meson.current_build_dir(), 'RygelCore-2.8.gir')],
+                output: 'RygelCore-2.8.typelib',
                 depends: [ core_lib, core_gir ],
                 install: true,
 diff --git a/src/librygel-renderer-gst/meson.build b/src/librygel-renderer-gst/meson.build
@@ -52,8 +52,8 @@ index ad98a3a7..e8baefe1 100644
                          '--includedir', core_girdir,
                          '--includedir', renderer_girdir,
 +                        '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,
-                         join_paths(meson.current_build_dir(), 'RygelRendererGst-2.6.gir')],
-                output: 'RygelRendererGst-2.6.typelib',
+                         join_paths(meson.current_build_dir(), 'RygelRendererGst-2.8.gir')],
+                output: 'RygelRendererGst-2.8.typelib',
                 depends: [renderer_gst_lib, renderer_lib, renderer_gst_gir, renderer_gir],
 diff --git a/src/librygel-renderer/meson.build b/src/librygel-renderer/meson.build
 index 5f401527..821273ff 100644
@@ -64,7 +64,7 @@ index 5f401527..821273ff 100644
                          '--output', '@OUTPUT@',
                          '--includedir', core_girdir,
 +                        '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,
-                         join_paths(meson.current_build_dir(), 'RygelRenderer-2.6.gir')],
+                         join_paths(meson.current_build_dir(), 'RygelRenderer-2.8.gir')],
                 output: 'RygelRenderer-2.6.typelib',
                 depends: [ renderer_lib, renderer_gir, core_gir ],
 diff --git a/src/librygel-server/meson.build b/src/librygel-server/meson.build
@@ -76,7 +76,7 @@ index a3bd77d9..6b084eb6 100644
                          '--output', '@OUTPUT@',
                          '--includedir', core_girdir,
 +                        '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,
-                         join_paths(meson.current_build_dir(), 'RygelServer-2.6.gir')],
+                         join_paths(meson.current_build_dir(), 'RygelServer-2.8.gir')],
                 output: 'RygelServer-2.6.typelib',
                 depends: [ server_lib, server_gir, core_gir ],
 -- 
diff --git a/package/rygel/Config.in b/package/rygel/Config.in
index e160068a55..a3c2bd29da 100644
--- a/package/rygel/Config.in
+++ b/package/rygel/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RYGEL
 	bool "rygel"
+	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # gupnp-av
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gupnp-av
 	depends on BR2_USE_MMU # gupnp-av, gobject-introspection
@@ -15,6 +16,7 @@ config BR2_PACKAGE_RYGEL
 	select BR2_PACKAGE_LIBGEE
 	select BR2_PACKAGE_LIBMEDIAART
 	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_XLIB_LIBX11
 	help
 	  Rygel is a home media solution (UPnP AV MediaServer) that
 	  allows you to easily share audio, video and pictures to other
@@ -57,6 +59,7 @@ endif # BR2_PACKAGE_RYGEL
 comment "rygel needs python3 and a glibc toolchain w/ wchar, threads, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
diff --git a/package/rygel/rygel.hash b/package/rygel/rygel.hash
index 8bda1c2af7..77db59cf40 100644
--- a/package/rygel/rygel.hash
+++ b/package/rygel/rygel.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.gnome.org/sources/rygel/0.40/rygel-0.40.2.sha256sum:
-sha256  c9e8c736296d22c4defe959727a29d31437bbd2b7aa0c6470d6be24011050697  rygel-0.40.2.tar.xz
+# Hash from: https://ftp.gnome.org/pub/gnome/sources/rygel/0.42/rygel-0.42.5.sha256sum:
+sha256  1133602d2e6710aade6b22aa98d93384c8d56396f344763413e96e0110b7d89f  rygel-0.42.5.tar.xz
 
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
index 81d35be833..5c155f8e13 100644
--- a/package/rygel/rygel.mk
+++ b/package/rygel/rygel.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RYGEL_VERSION_MAJOR = 0.40
-RYGEL_VERSION = $(RYGEL_VERSION_MAJOR).2
+RYGEL_VERSION_MAJOR = 0.42
+RYGEL_VERSION = $(RYGEL_VERSION_MAJOR).5
 RYGEL_SOURCE = rygel-$(RYGEL_VERSION).tar.xz
 RYGEL_SITE = https://download.gnome.org/sources/rygel/$(RYGEL_VERSION_MAJOR)
 RYGEL_LICENSE = LGPL-2.1+, CC-BY-SA-3.0 (logo)
@@ -18,6 +18,7 @@ RYGEL_DEPENDENCIES = \
 	libgee \
 	libmediaart \
 	sqlite \
+	xlib_libX11 \
 	$(TARGET_NLS_DEPENDENCIES)
 RYGEL_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

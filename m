Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB953C77B76
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 11:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61B7C812A4;
	Sun, 23 Apr 2023 11:03:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61B7C812A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NjcdrMgxTywB; Sun, 23 Apr 2023 11:03:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9830080E62;
	Sun, 23 Apr 2023 11:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9830080E62
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B5F491C2B5C
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 11:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB05D60BA6
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 11:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB05D60BA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KxNhb5DQ_Jkw for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 11:02:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BBAF60F2A
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 11:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BBAF60F2A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 667D184053; Sun, 23 Apr 2023 11:02:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 13:01:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2758794a453aa1eacdcb048070e6434ec601ca5
X-Git-Newrev: 3f9622fe3d85b4d9f734b879abc1d485afea19b2
X-Patchwork-Hint: ignore
Message-Id: <20230423110248.667D184053@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglib2: bump version to 2.76.1
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
Content-Type: multipart/mixed; boundary="===============8199527535538686813=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8199527535538686813==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3f9622fe3d85b4d9f734b879abc1d485afea19b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- glib2 has moved from PCRE to PCRE2 [1].
- Drop `fam` option since it no longer available [2].
- Drop "0001-fix-compile-time-atomic-detection.patch" since upstream
   patch was dropped and new atomic detection implementation has been
   applied in this version.
- Drop "0002-remove-cpp-requirement.patch" since upstream has modified
   its Meson scripts to have any C++ usage as optional.
- Drop "0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch"
   since change is available in this version.
- Add new patch to address new Werror compilation errors [3].
- Renamed "0004-*.patch" -> "0001-*.patch" since it should still be
   applicable for its mentioned build case.

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=1938974
[2]: https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2570
[3]: https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3390

Signed-off-by: James Knight <james.d.knight@live.com>
[yann.morin.1998@free.fr:
  - update upstream status on new patch
  - regenerate .checkpackageignore
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  3 -
 .../0001-fix-compile-time-atomic-detection.patch   | 34 --------
 ...add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch} |  0
 ...or-format-in-gio-gunixconnection.c-part-2.patch | 93 ++++++++++++++++++++++
 package/libglib2/0002-remove-cpp-requirement.patch | 87 --------------------
 ...o-format-nonliteral-to-compiler-arguments.patch | 29 -------
 package/libglib2/Config.in                         |  3 +-
 package/libglib2/libglib2.hash                     |  6 +-
 package/libglib2/libglib2.mk                       | 14 ++--
 9 files changed, 106 insertions(+), 163 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f0ad3e88bd..2758ad9377 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -801,9 +801,6 @@ package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.pat
 package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch Upstream
 package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch Upstream
 package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch Upstream
-package/libglib2/0001-fix-compile-time-atomic-detection.patch Upstream
-package/libglib2/0002-remove-cpp-requirement.patch Upstream
-package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch Upstream
 package/libgpgme/0001-Fix-build-without-threads.patch Upstream
 package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch Upstream
 package/libgsm/0001-misc-fixes-from-archlinux.patch Upstream
diff --git a/package/libglib2/0001-fix-compile-time-atomic-detection.patch b/package/libglib2/0001-fix-compile-time-atomic-detection.patch
deleted file mode 100644
index aae505f8e5..0000000000
--- a/package/libglib2/0001-fix-compile-time-atomic-detection.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d5c628a6179b99705fa05ab87437321b132c81bc Mon Sep 17 00:00:00 2001
-From: Brendan Heading <brendanheading@gmail.com>
-Date: Wed, 21 Jun 2017 16:36:15 -0400
-Subject: [PATCH] Fix compile time atomic detection
-
-Improved compile-time detection of atomic support in the compiler.
-
-Upstream-Status: 'Needs information'
-See : https://gitlab.gnome.org/GNOME/glib/issues/1063
-
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-Refresh for 2.68.1
----
- glib/gthread-posix.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/glib/gthread-posix.c b/glib/gthread-posix.c
-index 71a6b7b..d09d029 100644
---- a/glib/gthread-posix.c
-+++ b/glib/gthread-posix.c
-@@ -72,8 +72,7 @@
- #include <sys/syscall.h>
- #endif
- 
--#if defined(HAVE_FUTEX) && \
--    (defined(HAVE_STDATOMIC_H) || defined(__ATOMIC_SEQ_CST))
-+#if defined(HAVE_FUTEX) && defined(__ATOMIC_SEQ_CST) && defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4) && !defined(__clang__)
- #define USE_NATIVE_MUTEX
- #endif
- 
--- 
-2.9.4
-
diff --git a/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch b/package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
similarity index 100%
rename from package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
rename to package/libglib2/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
diff --git a/package/libglib2/0002-Fix-error-format-in-gio-gunixconnection.c-part-2.patch b/package/libglib2/0002-Fix-error-format-in-gio-gunixconnection.c-part-2.patch
new file mode 100644
index 0000000000..6075bacb06
--- /dev/null
+++ b/package/libglib2/0002-Fix-error-format-in-gio-gunixconnection.c-part-2.patch
@@ -0,0 +1,93 @@
+From 4ae8606b6f80f9764e1f0a82cea7e23c8af487ae Mon Sep 17 00:00:00 2001
+From: James Knight <james.d.knight@live.com>
+Date: Thu, 20 Apr 2023 23:41:32 -0400
+Subject: [PATCH] Fix error format in gio/gunixconnection.c (part 2)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Update a series of error messages to use `g_set_error_literal` instead
+of `g_set_error`. This should prevent `format-nonliteral` compiler
+issues when `-Werror` is configured:
+
+    ../gio/gunixconnection.c: In function ‘g_unix_connection_receive_fd’:
+    ../gio/gunixconnection.c:183:9: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
+      183 |         nscm);
+          |         ^~~~
+    ../gio/gunixconnection.c:217:20: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
+      217 |                    nfd);
+          |                    ^~~
+    ../gio/gunixconnection.c: In function ‘g_unix_connection_receive_credentials’:
+    ../gio/gunixconnection.c:601:24: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
+      601 |                        nscm);
+          |                        ^~~~
+
+This is similar to a previous change [1] made to `gunixconnection.c`.
+
+[1]: 44b3d5d80445234041f6c59feb89645f7102c3a4
+
+Signed-off-by: James Knight <james.d.knight@live.com>
+Upstream: backport from upstream https://gitlab.gnome.org/GNOME/glib/-/commit/4ae8606b6f80f9764e1f0a82cea7e23c8af487ae
+---
+ gio/gunixconnection.c | 31 ++++++++++++++-----------------
+ 1 file changed, 14 insertions(+), 17 deletions(-)
+
+diff --git a/gio/gunixconnection.c b/gio/gunixconnection.c
+index b3f2b1c04b0abdf7136918585ae4cea8970a88bb..c012fcbfe00b69e9da609c7b626229db98e931ac 100644
+--- a/gio/gunixconnection.c
++++ b/gio/gunixconnection.c
+@@ -176,11 +176,10 @@ g_unix_connection_receive_fd (GUnixConnection  *connection,
+     {
+       gint i;
+ 
+-      g_set_error (error, G_IO_ERROR, G_IO_ERROR_FAILED,
+-        ngettext("Expecting 1 control message, got %d",
+-                 "Expecting 1 control message, got %d",
+-                 nscm),
+-        nscm);
++      g_set_error_literal (error, G_IO_ERROR, G_IO_ERROR_FAILED,
++                           ngettext ("Expecting 1 control message, got %d",
++                                     "Expecting 1 control message, got %d",
++                                     nscm));
+ 
+       for (i = 0; i < nscm; i++)
+         g_object_unref (scms[i]);
+@@ -210,11 +209,10 @@ g_unix_connection_receive_fd (GUnixConnection  *connection,
+     {
+       gint i;
+ 
+-      g_set_error (error, G_IO_ERROR, G_IO_ERROR_FAILED,
+-                   ngettext("Expecting one fd, but got %d\n",
+-                            "Expecting one fd, but got %d\n",
+-                            nfd),
+-                   nfd);
++      g_set_error_literal (error, G_IO_ERROR, G_IO_ERROR_FAILED,
++                           ngettext ("Expecting one fd, but got %d\n",
++                                     "Expecting one fd, but got %d\n",
++                                     nfd));
+ 
+       for (i = 0; i < nfd; i++)
+         close (fds[i]);
+@@ -592,13 +590,12 @@ g_unix_connection_receive_credentials (GUnixConnection      *connection,
+     {
+       if (nscm != 1)
+         {
+-          g_set_error (error,
+-                       G_IO_ERROR,
+-                       G_IO_ERROR_FAILED,
+-                       ngettext("Expecting 1 control message, got %d",
+-                                "Expecting 1 control message, got %d",
+-                                nscm),
+-                       nscm);
++          g_set_error_literal (error,
++                               G_IO_ERROR,
++                               G_IO_ERROR_FAILED,
++                               ngettext ("Expecting 1 control message, got %d",
++                                         "Expecting 1 control message, got %d",
++                                         nscm));
+           goto out;
+         }
+ 
+-- 
+2.39.1.windows.1
+
diff --git a/package/libglib2/0002-remove-cpp-requirement.patch b/package/libglib2/0002-remove-cpp-requirement.patch
deleted file mode 100644
index 84511dea32..0000000000
--- a/package/libglib2/0002-remove-cpp-requirement.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From dd65a8cfdeafeb18b72d8d1eb676c7ca43ae505f Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Aduskett@gmail.com>
-Date: Mon, 16 Sep 2019 10:12:38 -0700
-Subject: [PATCH] remove cpp requirement
-
-The c++ test is necessary to ensure libglib doesn't accidentally use C++
-reserved keywords in public headers. Because this is just a test, it isn't
-necessary to have a C++ compiler to build libglib2.
-
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
-Upstream status: Denied (Buildroot specific)
-https://gitlab.gnome.org/GNOME/glib/issues/1748
----
- glib/glibconfig.h.in |  1 -
- meson.build          | 19 +------------------
- 2 files changed, 1 insertion(+), 19 deletions(-)
-
-diff --git a/glib/glibconfig.h.in b/glib/glibconfig.h.in
-index e66748d95..2173d8be6 100644
---- a/glib/glibconfig.h.in
-+++ b/glib/glibconfig.h.in
-@@ -119,7 +119,6 @@ typedef unsigned @glib_intptr_type_define@ guintptr;
- @glib_vacopy@
- 
- @g_have_iso_c_varargs@
--@g_have_iso_cxx_varargs@
- 
- /* gcc-2.95.x supports both gnu style and ISO varargs, but if -ansi
-  * is passed ISO vararg support is turned off, and there is no work
-diff --git a/meson.build b/meson.build
-index 48fdfe864..5df242e39 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,4 +1,4 @@
--project('glib', 'c', 'cpp',
-+project('glib', 'c',
-   version : '2.72.3',
-   # NOTE: We keep this pinned at 0.52 because that's what Debian Stable ships
-   meson_version : '>= 0.52.0',
-@@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
- )
- 
- cc = meson.get_compiler('c')
--cxx = meson.get_compiler('cpp')
- 
- cc_can_run = not meson.is_cross_build() or meson.has_exe_wrapper()
- 
-@@ -495,7 +494,6 @@ else
- endif
- 
- add_project_arguments(cc.get_supported_arguments(warning_c_args), language: 'c')
--add_project_arguments(cxx.get_supported_arguments(warning_cxx_args), language: 'cpp')
- 
- # FIXME: We cannot build some of the GResource tests with -z nodelete, which
- # means we cannot use that flag in add_project_link_arguments(), and must add
-@@ -1734,20 +1732,6 @@ if g_have_iso_c_varargs
- #endif''')
- endif
- 
--g_have_iso_cxx_varargs = cxx.compiles('''
--  void some_func (void) {
--    int a(int p1, int p2, int p3);
--    #define call_a(...) a(1,__VA_ARGS__)
--    call_a(2,3);
--  }''', name : 'ISO C99 varargs macros in C++')
--
--if g_have_iso_cxx_varargs
--  glibconfig_conf.set('g_have_iso_cxx_varargs', '''
--#ifdef __cplusplus
--# define G_HAVE_ISO_VARARGS 1
--#endif''')
--endif
--
- g_have_gnuc_varargs = cc.compiles('''
-   void some_func (void) {
-     int a(int p1, int p2, int p3);
-@@ -2381,7 +2365,6 @@ subdir('gobject')
- subdir('gthread')
- subdir('gmodule')
- subdir('gio')
--subdir('fuzzing')
- if build_tests
-   subdir('tests')
- endif
--- 
-2.34.1
-
diff --git a/package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch b/package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch
deleted file mode 100644
index e212393011..0000000000
--- a/package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9e0f11a4981737f98bac93a22b6f2ff1a3887b63 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Aduskett@gmail.com>
-Date: Tue, 9 Apr 2019 13:03:51 -0400
-Subject: [PATCH] Add '-Wno-format-nonliteral' to compiler arguments.
-
-This warning is a false positive on older versions of gcc.
-See https://gitlab.gnome.org/GNOME/glib/issues/1744 for more details.
-
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
-Refresh for 2.68.1
----
- meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/meson.build b/meson.build
-index 3c615b7..7cae4e8 100644
---- a/meson.build
-+++ b/meson.build
-@@ -435,6 +435,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
-     # building with -Wbad-function-cast.
-     '-Wno-bad-function-cast',
-     '-Wno-cast-function-type',
-+    '-Wno-format-nonliteral',
-     # Due to function casts through (void*) we cannot support -Wpedantic:
-     # https://wiki.gnome.org/Projects/GLib/CompilerRequirements#Function_pointer_conversions.
-     '-Wno-pedantic',
--- 
-2.20.1
-
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 31f3649c75..077d7d66e8 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -5,8 +5,7 @@ config BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBFFI
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_PCRE_UCP
+	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_ZLIB
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 0395ff234a..07ed7635a6 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.72/glib-2.72.3.sha256sum
-sha256  4a39a2f624b8512d500d5840173eda7fa85f51c109052eae806acece85d345f0  glib-2.72.3.tar.xz
+# https://download.gnome.org/sources/glib/2.76/glib-2.76.1.sha256sum
+sha256  43dc0f6a126958f5b454136c4398eab420249c16171a769784486e25f2fda19f  glib-2.76.1.tar.xz
 # License files, locally calculated
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 3084aa6cb8..ecd7d5dbfe 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.72
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
+LIBGLIB2_VERSION_MAJOR = 2.76
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
@@ -24,7 +24,6 @@ endif
 
 HOST_LIBGLIB2_CONF_OPTS = \
 	-Ddtrace=false \
-	-Dfam=false \
 	-Dglib_debug=disabled \
 	-Dlibelf=disabled \
 	-Dselinux=disabled \
@@ -35,12 +34,12 @@ HOST_LIBGLIB2_CONF_OPTS = \
 
 LIBGLIB2_DEPENDENCIES = \
 	host-pkgconf host-libglib2 \
-	libffi pcre zlib $(TARGET_NLS_DEPENDENCIES)
+	libffi pcre2 zlib $(TARGET_NLS_DEPENDENCIES)
 
 HOST_LIBGLIB2_DEPENDENCIES = \
 	host-gettext \
 	host-libffi \
-	host-pcre \
+	host-pcre2 \
 	host-pkgconf \
 	host-util-linux \
 	host-zlib
@@ -69,6 +68,11 @@ ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 LIBGLIB2_DEPENDENCIES += elfutils
 endif
 
+# Uses __atomic_compare_exchange_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBGLIB2_LDFLAGS += -latomic
+endif
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBGLIB2_CONF_OPTS += -Diconv=external
 LIBGLIB2_DEPENDENCIES += libiconv

--===============8199527535538686813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8199527535538686813==--

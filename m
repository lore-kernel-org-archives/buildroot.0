Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA41C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 598F481270;
	Sun,  9 Jan 2022 22:50:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k7E0MY6xJFjg; Sun,  9 Jan 2022 22:50:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 683B581400;
	Sun,  9 Jan 2022 22:50:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AAC61BF969
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03EE960B98
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ToKHCH13WBoL for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:49:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC15760B90
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:49:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7FABD832B2; Sun,  9 Jan 2022 22:42:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 23:45:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 570ed7b8229222de70c11c2550f4694475445997
X-Git-Newrev: 53c0c7dd01228122c7ceb44d65f2800dbcf473f1
X-Patchwork-Hint: ignore
Message-Id: <20220109224247.7FABD832B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vte: bump to version 0.66.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=53c0c7dd01228122c7ceb44d65f2800dbcf473f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to meson-package and so replace host-intltool dependency by
  TARGET_NLS_DEPENDENCIES:
  https://gitlab.gnome.org/GNOME/vte/-/issues/87
- Retrieve upstream hash
- Switch license file to LGPL-3.0+:
  https://gitlab.gnome.org/GNOME/vte/-/commit/5e14529d4219f3792690566ef7ec70febd87e070
- Drop libxml2 dependency (not needed with meson)
- Add uclibc or glibc dependency, upstream doesn't want to support musl:
  https://gitlab.gnome.org/GNOME/vte/-/issues/72
  https://gitlab.gnome.org/GNOME/vte/-/issues/247
- Add optional icu dependency:
  https://gitlab.gnome.org/GNOME/vte/-/commit/9e4fbae2cabcd937ac4d1a984ba844d24b44b83f
- Add optional libfribidi dependency:
  https://gitlab.gnome.org/GNOME/vte/-/commit/7d3704f1c54e58443624355835f675ec22c6b9d3
- Add optional systemd dependency:
  https://gitlab.gnome.org/GNOME/vte/-/commit/81bd158c24ef1d716d3cbf801e72fda2e11b81b4
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...build-with-kernel-headers-from-linux-4-13.patch | 54 ++++++++++++++++++++++
 ...eck-for-fstack-protector-compiler-support.patch | 43 +++++++++++++++++
 package/vte/Config.in                              |  7 +--
 package/vte/vte.hash                               |  8 ++--
 package/vte/vte.mk                                 | 45 +++++++++++++-----
 5 files changed, 139 insertions(+), 18 deletions(-)

diff --git a/package/vte/0001-build-Fix-build-with-kernel-headers-from-linux-4-13.patch b/package/vte/0001-build-Fix-build-with-kernel-headers-from-linux-4-13.patch
new file mode 100644
index 0000000000..7c3a5ab05e
--- /dev/null
+++ b/package/vte/0001-build-Fix-build-with-kernel-headers-from-linux-4-13.patch
@@ -0,0 +1,54 @@
+From 91123bb5201156e3d3adbe24305488f5eea2c8d7 Mon Sep 17 00:00:00 2001
+From: Christian Persch <chpe@src.gnome.org>
+Date: Mon, 27 Sep 2021 22:46:47 +0200
+Subject: [PATCH] build: Fix build with kernel headers from linux < 4.13
+
+We already support running with a kernel that doesn't support this
+ioctl, so let's also support building with one. Add the missing
+ioctl definition to missing.hh.
+
+Fixes: https://gitlab.gnome.org/GNOME/vte/-/issues/2514
+
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/vte/-/commit/91123bb5201156e3d3adbe24305488f5eea2c8d7]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/missing.hh | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/missing.hh b/src/missing.hh
+index e5a58727..7902e41e 100644
+--- a/src/missing.hh
++++ b/src/missing.hh
+@@ -23,11 +23,14 @@
+ #include <fcntl.h>
+ 
+ #ifdef __linux__
++
++#include <sys/ioctl.h>
+ #include <sys/syscall.h>
+ 
+ #if defined(__mips__) || defined(__mips64__)
+ #include <asm/sgidefs.h>
+ #endif
++
+ #endif
+ 
+ /* NSIG isn't in POSIX, so if it doesn't exist use this here. See bug #759196 */
+@@ -128,4 +131,13 @@ char* strchrnul(char const* s,
+ #define CLOSE_RANGE_CLOEXEC (1u << 2)
+ #endif
+ 
++#if !defined(TIOCGPTPEER)
++/* See linux commit 54ebbfb1603415d9953c150535850d30609ef077 */
++#if defined(__sparc__)
++#define TIOCGPTPEER _IOR('t', 137, int)
++#else
++#define TIOCGPTPEER _IOR('T', 0x41, int)
++#endif
++#endif /* !TIOCGPTPEER */
++
+ #endif /* __linux__ */
+-- 
+GitLab
+
diff --git a/package/vte/0002-build-Fix-check-for-fstack-protector-compiler-support.patch b/package/vte/0002-build-Fix-check-for-fstack-protector-compiler-support.patch
new file mode 100644
index 0000000000..67b6c47482
--- /dev/null
+++ b/package/vte/0002-build-Fix-check-for-fstack-protector-compiler-support.patch
@@ -0,0 +1,43 @@
+From e32dba1d5cf884959af5b2c0691db00c263ea048 Mon Sep 17 00:00:00 2001
+From: Christian Persch <chpe@src.gnome.org>
+Date: Mon, 27 Dec 2021 19:24:46 +0100
+Subject: [PATCH] build: Fix check for -fstack-protector* compiler support
+
+Need to use has_link_argument() on some platforms.
+
+Fixes: https://gitlab.gnome.org/GNOME/vte/-/issues/2535
+
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/vte/-/commit/e32dba1d5cf884959af5b2c0691db00c263ea048]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 93b7f376..381d5d58 100644
+--- a/meson.build
++++ b/meson.build
+@@ -461,8 +461,6 @@ compiler_flags_common = [
+   '-fdiagnostics-show-option',
+   '-fno-common',
+   '-fno-semantic-interposition',
+-  '-fstack-protector',
+-  '-fstack-protector-strong',
+ ]
+ 
+ if enable_debug
+@@ -550,6 +548,10 @@ add_project_arguments(global_cxxflags, language: 'cpp')
+ linker_flags = [
+   ['-Wl,-Bsymbolic', false,],
+   ['-Wl,-Bsymbolic-functions', get_option('_b_symbolic_functions'),],
++
++  # See issue vte#2535.
++  ['-fstack-protector', false],
++  ['-fstack-protector-strong', false],
+ ]
+ 
+ foreach flag: linker_flags
+-- 
+GitLab
+
diff --git a/package/vte/Config.in b/package/vte/Config.in
index 96de3d38cc..2635a6007c 100644
--- a/package/vte/Config.in
+++ b/package/vte/Config.in
@@ -7,11 +7,11 @@ config BR2_PACKAGE_VTE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		BR2_PACKAGE_HAS_LIBGL
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBGTK3
-	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_PCRE2
 	help
 	  VTE is a library (libvte) implementing a terminal emulator
@@ -22,13 +22,14 @@ config BR2_PACKAGE_VTE
 
 	  http://github.com/GNOME/vte
 
-comment "vte needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
+comment "vte needs a uClibc or glibc toolchain w/ wchar, threads, C++, gcc >= 4.8"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		BR2_TOOLCHAIN_USES_MUSL
 
 comment "vte needs an OpenGL or an OpenGL-EGL/wayland backend"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
diff --git a/package/vte/vte.hash b/package/vte/vte.hash
index 3fbc5acab0..90818d31f3 100644
--- a/package/vte/vte.hash
+++ b/package/vte/vte.hash
@@ -1,3 +1,5 @@
-# Locally calculated
-sha256	a3a9fb182740b392a45cd3f46fa61a985f68bb6b1817b52daec22034c46158c3  vte-0.48.3.tar.xz
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/vte/0.66/vte-0.66.2.sha256sum
+sha256  e89974673a72a0a06edac6d17830b82bb124decf0cb3b52cebc92ec3ff04d976  vte-0.66.2.tar.xz
+
+# Hash for license file:
+sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING.LGPL3
diff --git a/package/vte/vte.mk b/package/vte/vte.mk
index 6c8d1433f5..07e813685e 100644
--- a/package/vte/vte.mk
+++ b/package/vte/vte.mk
@@ -4,26 +4,47 @@
 #
 ################################################################################
 
-VTE_VERSION = 0.48.3
+VTE_VERSION_MAJOR = 0.66
+VTE_VERSION = $(VTE_VERSION_MAJOR).2
 VTE_SOURCE = vte-$(VTE_VERSION).tar.xz
-VTE_SITE = http://ftp.gnome.org/pub/gnome/sources/vte/0.48
-VTE_DEPENDENCIES = host-intltool host-pkgconf libgtk3 libxml2 pcre2
-VTE_LICENSE = LGPL-2.1+
-VTE_LICENSE_FILES = COPYING
-VTE_CONF_OPTS += --disable-vala
+VTE_SITE = http://ftp.gnome.org/pub/gnome/sources/vte/$(VTE_VERSION_MAJOR)
+VTE_DEPENDENCIES = host-pkgconf libgtk3 pcre2 $(TARGET_NLS_DEPENDENCIES)
+VTE_LICENSE = LGPL-3.0+
+VTE_LICENSE_FILES = COPYING.LGPL3
+
+ifeq ($(BR2_PACKAGE_ICU),y)
+VTE_CONF_OPTS += -Dicu=true
+VTE_DEPENDENCIES += icu
+else
+VTE_CONF_OPTS += -Dicu=false
+endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-VTE_CONF_OPTS += --enable-introspection
-VTE_DEPENDENCIES += gobject-introspection
+VTE_CONF_OPTS += -Dgir=true -Dvapi=true
+VTE_DEPENDENCIES += host-vala gobject-introspection
 else
-VTE_CONF_OPTS += --disable-introspection
+VTE_CONF_OPTS += -Dgir=false -Dvapi=false
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-VTE_CONF_OPTS += --with-gnutls
+VTE_CONF_OPTS += -Dgnutls=true
 VTE_DEPENDENCIES += gnutls
 else
-VTE_CONF_OPTS += --without-gnutls
+VTE_CONF_OPTS += -Dgnutls=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
+VTE_CONF_OPTS += -Dfribidi=true
+VTE_DEPENDENCIES += libfribidi
+else
+VTE_CONF_OPTS += -Dfribidi=false
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+VTE_CONF_OPTS += -D_systemd=true
+VTE_DEPENDENCIES += systemd
+else
+VTE_CONF_OPTS += -D_systemd=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

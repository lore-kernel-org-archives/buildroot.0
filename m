Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7C7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 15:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E8BC40299;
	Sun, 26 Dec 2021 15:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uif6A_GBYVFq; Sun, 26 Dec 2021 15:00:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A6E7402A7;
	Sun, 26 Dec 2021 15:00:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 905521BF2F4
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E24C40582
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eXyQq8hdHqBk for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 15:00:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBB6940108
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 15:00:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E17D982641; Sun, 26 Dec 2021 14:55:07 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 16:00:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ee6c37939f7413a953f6d2575d5757f682b23c0
X-Git-Newrev: 91ebf2b58b119a43134a95994c3cd63297f599fa
X-Patchwork-Hint: ignore
Message-Id: <20211226145507.E17D982641@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fakeroot: bump to version 1.26
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
Content-Type: multipart/mixed; boundary="===============4251849213485464699=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4251849213485464699==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=91ebf2b58b119a43134a95994c3cd63297f599fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop first patch (not needed anymore)
- Drop second to fifth patches (already in version)
- Drop autoreconf

https://salsa.debian.org/clint/fakeroot/-/blob/debian/1.26-1/debian/changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fakeroot/0001-skip-doc-subdirs.patch       | 14 ----
 ....c-define-_STAT_VER-if-not-already-define.patch | 45 ------------
 ....c-add-wrappers-for-new-glibc-2.33-symbol.patch | 80 ----------------------
 ...igure.ac-fix-__xmknod-at-pointer-argument.patch | 66 ------------------
 .../0005-fix-build-regression-on-macOS.patch       | 63 -----------------
 package/fakeroot/fakeroot.hash                     |  4 +-
 package/fakeroot/fakeroot.mk                       |  6 +-
 7 files changed, 4 insertions(+), 274 deletions(-)

diff --git a/package/fakeroot/0001-skip-doc-subdirs.patch b/package/fakeroot/0001-skip-doc-subdirs.patch
deleted file mode 100644
index 91663fb64d..0000000000
--- a/package/fakeroot/0001-skip-doc-subdirs.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-For some reason, version 1.25 and up is missing all localized doc,
-and thus fails on the install stage.
-
-Skip the directories.
-
-Signed-off-by: Norbert Lange <nolange79@gmail.com>
---- fakeroot-1.25.1.org/doc/Makefile.am	2020-09-22 23:52:20.000000000 +0200
-+++ fakeroot-1.25.1/doc/Makefile.am	2020-09-24 11:05:27.611298673 +0200
-@@ -1,5 +1,4 @@
- AUTOMAKE_OPTIONS=foreign
--SUBDIRS = de es fr nl pt sv
-
- man_MANS = faked.1 fakeroot.1
-
diff --git a/package/fakeroot/0002-libfakeroot.c-define-_STAT_VER-if-not-already-define.patch b/package/fakeroot/0002-libfakeroot.c-define-_STAT_VER-if-not-already-define.patch
deleted file mode 100644
index 574e55e33a..0000000000
--- a/package/fakeroot/0002-libfakeroot.c-define-_STAT_VER-if-not-already-define.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 03bc0ee07fb6e293d081ffd8af1654788b434f6a Mon Sep 17 00:00:00 2001
-From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
-Date: Thu, 11 Feb 2021 20:59:25 -0800
-Subject: [PATCH] libfakeroot.c: define _STAT_VER if not already defined
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-glibc 2.33 does does declare `_STAT_VER` anymore.
-
-Based on patch from Jan Pazdziora:
-https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.org/message/SMQ3RYXEYTVZH6PLQMKNB3NM4XLPMNZO/
-
-Backported from: feda578ca3608b7fc9a28a3a91293611c0ef47b7
-
-Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
-Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
----
- libfakeroot.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/libfakeroot.c b/libfakeroot.c
-index 3e80e38..14cdbc4 100644
---- a/libfakeroot.c
-+++ b/libfakeroot.c
-@@ -90,6 +90,16 @@
- #define SEND_GET_XATTR64(a,b,c) send_get_xattr64(a,b)
- #endif
- 
-+#ifndef _STAT_VER
-+ #if defined (__aarch64__)
-+  #define _STAT_VER 0
-+ #elif defined (__x86_64__)
-+  #define _STAT_VER 1
-+ #else
-+  #define _STAT_VER 3
-+ #endif
-+#endif
-+
- /*
-    These INT_* (which stands for internal) macros should always be used when
-    the fakeroot library owns the storage of the stat variable.
--- 
-2.30.1
-
diff --git a/package/fakeroot/0003-libfakeroot.c-add-wrappers-for-new-glibc-2.33-symbol.patch b/package/fakeroot/0003-libfakeroot.c-add-wrappers-for-new-glibc-2.33-symbol.patch
deleted file mode 100644
index 8115598d64..0000000000
--- a/package/fakeroot/0003-libfakeroot.c-add-wrappers-for-new-glibc-2.33-symbol.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From feda578ca3608b7fc9a28a3a91293611c0ef47b7 Mon Sep 17 00:00:00 2001
-From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
-Date: Thu, 11 Feb 2021 21:00:04 -0800
-Subject: [PATCH] libfakeroot.c: add wrappers for new glibc 2.33+ symbols
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This patch add wrappers for newly exported symbols in glibc 2.33.
-
-Backported from: feda578ca3608b7fc9a28a3a91293611c0ef47b7
-
-Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
-Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
----
- libfakeroot.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 48 insertions(+)
-
-diff --git a/libfakeroot.c b/libfakeroot.c
-index 14cdbc4..d75c51f 100644
---- a/libfakeroot.c
-+++ b/libfakeroot.c
-@@ -1352,6 +1352,54 @@ int renameat(int olddir_fd, const char *oldpath,
- #endif /* HAVE_FSTATAT */
- 
- 
-+#if defined(__GLIBC__) && __GLIBC_PREREQ(2,33)
-+/* Glibc 2.33 exports symbols for these functions in the shared lib */
-+  int lstat(const char *file_name, struct stat *statbuf) {
-+     return WRAP_LSTAT LSTAT_ARG(_STAT_VER, file_name, statbuf);
-+  }
-+  int stat(const char *file_name, struct stat *st) {
-+     return WRAP_STAT STAT_ARG(_STAT_VER, file_name, st);
-+  }
-+  int fstat(int fd, struct stat *st) {
-+     return WRAP_FSTAT FSTAT_ARG(_STAT_VER, fd, st);
-+  }
-+
-+  #ifdef HAVE_FSTATAT
-+    int fstatat(int dir_fd, const char *path, struct stat *st, int flags) {
-+       return WRAP_FSTATAT FSTATAT_ARG(_STAT_VER, dir_fd, path, st, flags);
-+    }
-+  #endif
-+
-+  #ifdef STAT64_SUPPORT
-+    int lstat64(const char *file_name, struct stat64 *st) {
-+       return WRAP_LSTAT64 LSTAT64_ARG(_STAT_VER, file_name, st);
-+    }
-+    int stat64(const char *file_name, struct stat64 *st) {
-+       return WRAP_STAT64 STAT64_ARG(_STAT_VER, file_name, st);
-+    }
-+    int fstat64(int fd, struct stat64 *st) {
-+       return WRAP_FSTAT64 FSTAT64_ARG(_STAT_VER, fd, st);
-+    }
-+
-+    #ifdef HAVE_FSTATAT
-+      int fstatat64(int dir_fd, const char *path, struct stat64 *st, int flags) {
-+	 return WRAP_FSTATAT64 FSTATAT64_ARG(_STAT_VER, dir_fd, path, st, flags);
-+      }
-+    #endif
-+  #endif
-+
-+  int mknod(const char *pathname, mode_t mode, dev_t dev) {
-+     return WRAP_MKNOD MKNOD_ARG(_STAT_VER, pathname, mode, &dev);
-+  }
-+
-+  #if defined(HAVE_FSTATAT) && defined(HAVE_MKNODAT)
-+    int mknodat(int dir_fd, const char *pathname, mode_t mode, dev_t dev) {
-+       return WRAP_MKNODAT MKNODAT_ARG(_STAT_VER, dir_fd, pathname, mode, &dev);
-+    }
-+  #endif
-+#endif /* GLIBC_PREREQ */
-+
-+
- #ifdef FAKEROOT_FAKENET
- pid_t fork(void)
- {
--- 
-2.30.1
-
diff --git a/package/fakeroot/0004-configure.ac-fix-__xmknod-at-pointer-argument.patch b/package/fakeroot/0004-configure.ac-fix-__xmknod-at-pointer-argument.patch
deleted file mode 100644
index 38dfea868b..0000000000
--- a/package/fakeroot/0004-configure.ac-fix-__xmknod-at-pointer-argument.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 432dd46e662772020306a2ce8b1be38321697e69 Mon Sep 17 00:00:00 2001
-From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
-Date: Sat, 13 Feb 2021 19:32:08 -0800
-Subject: [PATCH] configure.ac: fix __xmknod{,at} pointer argument
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Switch default to assume * and not the absence of *.
-
-On glibc 2.33+, there is no definition for these functions in header
-files, so the compile test doesn't work. But, we can default to using
-the pointer (as is the case with newer glibc), and use the header file
-on older platforms to fail the test and use no pointer.
-
-Backported from: c3eebec293e35b997bb46c22fb5a4e114afb5e7f
-
-Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
-Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
----
- configure.ac | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 73415d2..d85566f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -183,13 +183,13 @@ AC_MSG_CHECKING([for type of arg of __xmknod])
-   ]], [[
-        int __xmknod  ( int ver,
-                        const char *pathname ,
--                       mode_t  mode ,  dev_t dev);
-+                       mode_t  mode ,  dev_t *dev);
-   ]])],[
--   AC_DEFINE(XMKNOD_FRTH_ARG,)
--   AC_MSG_RESULT([no extra *])
--  ],[
-    AC_DEFINE(XMKNOD_FRTH_ARG,[*])
-    AC_MSG_RESULT([needs *])
-+  ],[
-+   AC_DEFINE(XMKNOD_FRTH_ARG,)
-+   AC_MSG_RESULT([no extra *])
- 
-   ])
- 
-@@ -210,13 +210,13 @@ AC_MSG_CHECKING([for type of arg of __xmknodat])
-        int __xmknodat  ( int ver,
-                          int dirfd,
-                          const char *pathname ,
--                         mode_t  mode ,  dev_t dev);
-+                         mode_t  mode ,  dev_t *dev);
-   ]])],[
--   AC_DEFINE(XMKNODAT_FIFTH_ARG,)
--   AC_MSG_RESULT([no extra *])
--  ],[
-    AC_DEFINE(XMKNODAT_FIFTH_ARG,[*])
-    AC_MSG_RESULT([needs *])
-+  ],[
-+   AC_DEFINE(XMKNODAT_FIFTH_ARG,)
-+   AC_MSG_RESULT([no extra *])
- 
-   ])
- 
--- 
-2.30.1
-
diff --git a/package/fakeroot/0005-fix-build-regression-on-macOS.patch b/package/fakeroot/0005-fix-build-regression-on-macOS.patch
deleted file mode 100644
index d5589a79f5..0000000000
--- a/package/fakeroot/0005-fix-build-regression-on-macOS.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 3590b817df703a256f2c1de9a5f5469eaa1c86e9 Mon Sep 17 00:00:00 2001
-From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
-Date: Mon, 15 Feb 2021 11:07:56 -0800
-Subject: [PATCH] fix build regression on macOS
-
-Signed-off-by: Felix Fietkau <nbd@nbd.name>
-Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
-[Ryan: backported from 8090dffdad8fda86dccd47ce7a7db8840bdf7d7b]
-Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
----
- configure.ac  | 6 ++++++
- libfakeroot.c | 4 +++-
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index d85566f..d635df1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -181,6 +181,9 @@ AC_MSG_CHECKING([for type of arg of __xmknod])
-        #include <fcntl.h>
-        #include <unistd.h>
-   ]], [[
-+#ifndef __GLIBC__
-+#error no extra *
-+#endif
-        int __xmknod  ( int ver,
-                        const char *pathname ,
-                        mode_t  mode ,  dev_t *dev);
-@@ -207,6 +210,9 @@ AC_MSG_CHECKING([for type of arg of __xmknodat])
-        #include <fcntl.h>
-        #include <unistd.h>
-   ]], [[
-+#ifndef __GLIBC__
-+#error no extra *
-+#endif
-        int __xmknodat  ( int ver,
-                          int dirfd,
-                          const char *pathname ,
-diff --git a/libfakeroot.c b/libfakeroot.c
-index d75c51f..ec4e577 100644
---- a/libfakeroot.c
-+++ b/libfakeroot.c
-@@ -1352,7 +1352,8 @@ int renameat(int olddir_fd, const char *oldpath,
- #endif /* HAVE_FSTATAT */
- 
- 
--#if defined(__GLIBC__) && __GLIBC_PREREQ(2,33)
-+#if defined(__GLIBC__)
-+#if __GLIBC_PREREQ(2,33)
- /* Glibc 2.33 exports symbols for these functions in the shared lib */
-   int lstat(const char *file_name, struct stat *statbuf) {
-      return WRAP_LSTAT LSTAT_ARG(_STAT_VER, file_name, statbuf);
-@@ -1397,6 +1398,7 @@ int renameat(int olddir_fd, const char *oldpath,
-        return WRAP_MKNODAT MKNODAT_ARG(_STAT_VER, dir_fd, pathname, mode, &dev);
-     }
-   #endif
-+#endif /* __GLIBC__ */
- #endif /* GLIBC_PREREQ */
- 
- 
--- 
-2.25.1
-
diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index 1a23d9e8d8..3d53eeb097 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,4 +1,4 @@
-# From http://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.25.3-1.dsc
-sha256  8e903683357f7f5bcc31b879fd743391ad47691d4be33d24a76be3b6c21e956c  fakeroot_1.25.3.orig.tar.gz
+# From http://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.26-1.dsc
+sha256  480a578ffdc5592e73df4c086950d321b4adc78dbdaec56c82e4fe1fb68de8e9  fakeroot_1.26.orig.tar.gz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index c3312b777b..3fadf1c0f0 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.25.3
+FAKEROOT_VERSION = 1.26
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
-FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20201008T205817Z/pool/main/f/fakeroot
+FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20210907T092512Z/pool/main/f/fakeroot
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
@@ -15,8 +15,6 @@ HOST_FAKEROOT_DEPENDENCIES = host-acl
 HOST_FAKEROOT_CONF_ENV = \
 	ac_cv_header_sys_capability_h=no \
 	ac_cv_func_capset=no
-# patching configure.ac in patch 0003
-HOST_FAKEROOT_AUTORECONF = YES
 FAKEROOT_LICENSE = GPL-3.0+
 FAKEROOT_LICENSE_FILES = COPYING
 

--===============4251849213485464699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4251849213485464699==--

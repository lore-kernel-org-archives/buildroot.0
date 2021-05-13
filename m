From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 13 May 2021 09:05:36 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/libbluray: bump version to
 1.3.0
In-Reply-To: <20210513070536.1021065-1-bernd.kuhls@t-online.de>
References: <20210513070536.1021065-1-bernd.kuhls@t-online.de>
Message-ID: <20210513070536.1021065-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed backported patch.

Changelog:
https://code.videolan.org/videolan/libbluray/-/blob/master/ChangeLog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libbluray/0001-libudfread.patch | 32 -------------------------
 package/libbluray/libbluray.hash        |  4 ++--
 package/libbluray/libbluray.mk          |  4 +---
 3 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 package/libbluray/0001-libudfread.patch

diff --git a/package/libbluray/0001-libudfread.patch b/package/libbluray/0001-libudfread.patch
deleted file mode 100644
index 7e00069d47..0000000000
--- a/package/libbluray/0001-libudfread.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 24d38b8ec371d89b51f8b65f3085672db12334ff Mon Sep 17 00:00:00 2001
-From: Sebastian Ramacher <sramacher@debian.org>
-Date: Sun, 20 Dec 2020 13:32:33 +0100
-Subject: [PATCH] Update check for new libudfread pkg-config file name
-
-Fixes detection of libudfread due to upstream commit:
-https://code.videolan.org/videolan/libudfread/-/commit/76294a7449e068c527e31aec1a22076bf87c6302
-
-Downloaded from upstream commit:
-https://code.videolan.org/videolan/libbluray/-/commit/24d38b8ec371d89b51f8b65f3085672db12334ff
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index e0e80cce..250db73b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -279,7 +279,7 @@ AM_CONDITIONAL([BDJ_J2SE], [ test x"$BDJ_TYPE" != x"j2me" ])
- dnl bootclasspath
- AC_SUBST(BDJ_BOOTCLASSPATH)
- 
--PKG_CHECK_MODULES([LIBUDFREAD], [udfread >= 1.1.0],
-+PKG_CHECK_MODULES([LIBUDFREAD], [libudfread >= 1.1.0],
-     [with_libudfread=yes
-      AC_DEFINE([HAVE_LIBUDFREAD], [1], [Define to 1 if external libudfread is to be used])
-      PACKAGES="$PACKAGES libudfread >= 1.1.0"
--- 
-GitLab
-
diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index 430d477484..4ab8c85866 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,4 +1,4 @@
-# From http://download.videolan.org/pub/videolan/libbluray/1.2.1/libbluray-1.2.1.tar.bz2.sha512
-sha512  e9eeee433034266e88c05ae3469c0bd2bf700d7f16e17ad706f48426c143c823e83c16ab79a637f1e85e4eb858aa0577630671f87ba35d179db2a1d8bc8545c4  libbluray-1.2.1.tar.bz2
+# From http://download.videolan.org/pub/videolan/libbluray/1.3.0/libbluray-1.3.0.tar.bz2.sha512
+sha512  3d5145e6fd7de099c07f937282112c7abb12a5590b7c0b965b00bddee3837ddfd1a30076aaa6d6278d07a5beee3856f602125983ae075ab30eceb6ac1bd9bcdc  libbluray-1.3.0.tar.bz2
 # Locally computed
 sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  COPYING
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index e4fca5204f..233797f38d 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLURAY_VERSION = 1.2.1
+LIBBLURAY_VERSION = 1.3.0
 LIBBLURAY_SITE = http://download.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
 LIBBLURAY_INSTALL_STAGING = YES
@@ -12,8 +12,6 @@ LIBBLURAY_LICENSE = LGPL-2.1+
 LIBBLURAY_LICENSE_FILES = COPYING
 LIBBLURAY_CPE_ID_VENDOR = videolan
 LIBBLURAY_DEPENDENCIES = host-pkgconf
-# 0001-libudfread.patch
-LIBBLURAY_AUTORECONF = YES
 
 LIBBLURAY_CONF_OPTS = --disable-bdjava-jar
 
-- 
2.29.2

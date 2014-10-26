From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:21 +0100
Subject: [Buildroot] [PATCH 15/51] libstrophe: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-15-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch that was accepted upstream. The other one was never sent
before.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 ...-configure.ac-fix-misdetection-of-libxml2.patch | 32 ----------------------
 package/libstrophe/libstrophe.mk                   |  2 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 package/libstrophe/libstrophe-02-configure.ac-fix-misdetection-of-libxml2.patch

diff --git a/package/libstrophe/libstrophe-02-configure.ac-fix-misdetection-of-libxml2.patch b/package/libstrophe/libstrophe-02-configure.ac-fix-misdetection-of-libxml2.patch
deleted file mode 100644
index 7f6610c..0000000
--- a/package/libstrophe/libstrophe-02-configure.ac-fix-misdetection-of-libxml2.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 816df67088fc590c9e8f8598a1a7e90ff1fc425d Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 20 Apr 2014 21:07:41 +0200
-Subject: [PATCH] configure.ac: fix misdetection of libxml2
-
-A small typo in the detection of libxml2 leads to a successful
-pkg-config discovery of libxml2 to be ignored. As a consequence,
-configure.ac falls back to detecting the host libxml2, which does not
-work in cross-compilation situation. This commit fixes this small
-typo.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index e4f9299..a3e48ee 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -16,7 +16,7 @@ AC_ARG_WITH([libxml2],
- if test "x$with_libxml2" != xno; then
-   PKG_CHECK_MODULES([libxml2], [libxml-2.0 >= 2.7],
-                     [with_libxml2=yes], [dummy=1])
--  if test "x$with_libxml2" != yes; then
-+  if test "x$with_libxml2" != xyes; then
-     old_CFLAGS=$CFLAGS
-     CFLAGS="-I /usr/include/libxml2"
-     AC_CHECK_HEADER([libxml/parser.h],
--- 
-1.9.2
-
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index 21f7d29..d7202d7 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSTROPHE_VERSION = d408eaf2bbfe5ff5c56eab01463c278f9891c08e
+LIBSTROPHE_VERSION = 0.8.6
 LIBSTROPHE_SITE = $(call github,strophe,libstrophe,$(LIBSTROPHE_VERSION))
 LIBSTROPHE_DEPENDENCIES = openssl host-pkgconf
 LIBSTROPHE_AUTORECONF = YES
-- 
2.1.1

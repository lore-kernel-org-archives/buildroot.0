From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 12:54:13 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_sessreg: bump version
 to 1.1.2
Message-ID: <20190623105426.7131884389@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=433db5d36a175e5c4ad0a520e32c3e60fb57289c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which was applied upstream:
https://gitlab.freedesktop.org/xorg/app/sessreg/commit/5b403d124c32c20fddc73bc5ae3c7e1febdf1bc4

Added all hashes provided by upstream, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../xapp_sessreg/0001-missing_path_wtmpx.patch     | 24 ----------------------
 package/x11r7/xapp_sessreg/xapp_sessreg.hash       |  9 ++++++--
 package/x11r7/xapp_sessreg/xapp_sessreg.mk         |  2 +-
 3 files changed, 8 insertions(+), 27 deletions(-)

diff --git a/package/x11r7/xapp_sessreg/0001-missing_path_wtmpx.patch b/package/x11r7/xapp_sessreg/0001-missing_path_wtmpx.patch
deleted file mode 100644
index 0be242c0b2..0000000000
--- a/package/x11r7/xapp_sessreg/0001-missing_path_wtmpx.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fix missing defines _PATH_WTMPX/_PATH_UTMPX in musl
-
-Downloaded from
-https://cgit.gentoo.org/proj/musl.git/tree/x11-apps/sessreg/files/sessreg-1.1.0-missing_path_wtmpx.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -Naur sessreg-1.1.0.orig/sessreg.h sessreg-1.1.0/sessreg.h
---- sessreg-1.1.0.orig/sessreg.h	2015-01-20 05:00:27.000000000 +0000
-+++ sessreg-1.1.0/sessreg.h	2016-02-23 11:54:42.057000000 +0000
-@@ -103,6 +103,13 @@
- # define TTYS_FILE	"/etc/ttys"
- #endif
- 
-+#ifndef _PATH_WTMPX
-+# define _PATH_WTMPX	"/var/log/wtmp"
-+#endif
-+#ifndef _PATH_UTMPX
-+# define _PATH_UTMPX	"/var/log/utmp"
-+#endif
-+
- #ifndef WTMPX_FILE
- # define WTMPX_FILE	_PATH_WTMPX
- #endif
diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.hash b/package/x11r7/xapp_sessreg/xapp_sessreg.hash
index 47495b23df..12a7d3689a 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.hash
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.hash
@@ -1,2 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2017-February/002778.html
-sha256 78a76ae3f3f6a26547a34630d1b740f42344848b5fb6d7c9c7f7da255e35a6e1  sessreg-1.1.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-June/002994.html
+md5 92be564d4be7d8aa7b5024057b715210  sessreg-1.1.2.tar.bz2
+sha1 169c1ff9fb152b4b4ca0cfbd3e1aee33af042016  sessreg-1.1.2.tar.bz2
+sha256 dfcb9e954273ace63879aec053c7880466f8755752a35aa9ced3fa5f04fd2c33  sessreg-1.1.2.tar.bz2
+sha512 7e3c2bdcadb7133aace463b58d8c6108d315ec95d2a42509073eeddc7f02644092a4b3168bd3b426c041736a016291092e0bf8368acd620dbeff96d53d12f98c  sessreg-1.1.2.tar.bz2
+# Locally computed
+sha256 ac8f5cc696e6c473aea4caaf18650316dc8912fcf0f370cae1df5f395cea8631  COPYING
diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.mk b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
index 46935aed9a..7f488e2423 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.mk
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_SESSREG_VERSION = 1.1.1
+XAPP_SESSREG_VERSION = 1.1.2
 XAPP_SESSREG_SOURCE = sessreg-$(XAPP_SESSREG_VERSION).tar.bz2
 XAPP_SESSREG_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SESSREG_LICENSE = MIT

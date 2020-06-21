From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 16:51:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-screensaver-matrixtrails: bump
 version to 2.2.3
Message-ID: <20200621145130.2262-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch which was applied upstream.

Updated license hash due to copyright year update:
https://github.com/xbmc/screensaver.matrixtrails/commit/c2fdf919cfa04de45ad213da7645ea435547266d

Removed "v" from _SITE due to changes to github release names.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-Add-missing-stddef-include.patch     | 25 -------------------
 .../kodi-screensaver-matrixtrails.hash        |  4 +--
 .../kodi-screensaver-matrixtrails.mk          |  4 +--
 3 files changed, 4 insertions(+), 29 deletions(-)
 delete mode 100644 package/kodi-screensaver-matrixtrails/0001-Add-missing-stddef-include.patch

diff --git a/package/kodi-screensaver-matrixtrails/0001-Add-missing-stddef-include.patch b/package/kodi-screensaver-matrixtrails/0001-Add-missing-stddef-include.patch
deleted file mode 100644
index 75cadfcb1e..0000000000
--- a/package/kodi-screensaver-matrixtrails/0001-Add-missing-stddef-include.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 404763f096a312e12c0dc4764834987797411745 Mon Sep 17 00:00:00 2001
-From: Rechi <Rechi@users.noreply.github.com>
-Date: Sun, 24 Mar 2019 11:44:05 +0100
-Subject: [PATCH] [fix] add missing stddef.h include for offsetof macro
-
-Downloaded from upstream commit:
-https://github.com/xbmc/screensaver.matrixtrails/commit/404763f096a312e12c0dc4764834987797411745
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/matrixtrails.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/matrixtrails.cpp b/src/matrixtrails.cpp
-index 220855a..2817dbe 100644
---- a/src/matrixtrails.cpp
-+++ b/src/matrixtrails.cpp
-@@ -25,6 +25,7 @@
- #include "matrixtrails.h"
- #include "SOIL2/SOIL2.h"
- 
-+#include <stddef.h>
- #include <vector>
- 
- ////////////////////////////////////////////////////////////////////////////
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
index 9a657a10dd..26b95cbc77 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2d2c795853c5a72184bb6720247d79c48b1d9fbc97e9c2913003a707d612e3ac  kodi-screensaver-matrixtrails-2.2.1-Leia.tar.gz
-sha256  4cfbc2bc766d343a70ba0322bc7203332c232ba57b62fb57a0ee9189cca4ac27  debian/copyright
+sha256  5a2f5bca0c197eea87f06376941c6d0ddbc81cf144d8c3854ac148fdec3400ec  kodi-screensaver-matrixtrails-2.2.3-Leia.tar.gz
+sha256  385a17599b44aaea10537374c1991c21a5e06153878917b12f96fc1cf8bbc118  debian/copyright
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index de2d0f504c..8e619c1b7c 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 2.2.1-Leia
-KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,xbmc,screensaver.matrixtrails,v$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
+KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 2.2.3-Leia
+KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,xbmc,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = debian/copyright
 KODI_SCREENSAVER_MATRIXTRAILS_DEPENDENCIES = kodi
-- 
2.26.2

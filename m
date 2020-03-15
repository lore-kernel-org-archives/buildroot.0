From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 15:12:09 +0100
Subject: [Buildroot] [git commit] package/kodi-screensaver-biogenesis: bump
 version to 2.2.3-Leia
Message-ID: <20200315140204.999958315B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62b478fae8ba499c25d01b193954d743cb107073
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch 0001-Add-missing-stddef-include.patch which was applied
upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Add-missing-stddef-include.patch          | 25 ----------------------
 .../kodi-screensaver-biogenesis.hash               |  2 +-
 .../kodi-screensaver-biogenesis.mk                 |  2 +-
 3 files changed, 2 insertions(+), 27 deletions(-)

diff --git a/package/kodi-screensaver-biogenesis/0001-Add-missing-stddef-include.patch b/package/kodi-screensaver-biogenesis/0001-Add-missing-stddef-include.patch
deleted file mode 100644
index 378b3ad1de..0000000000
--- a/package/kodi-screensaver-biogenesis/0001-Add-missing-stddef-include.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 86da3bfecf8ddd2f8c2c3eed6e1cb8850883f4b2 Mon Sep 17 00:00:00 2001
-From: Rechi <Rechi@users.noreply.github.com>
-Date: Sun, 24 Mar 2019 10:53:31 +0100
-Subject: [PATCH] [fix] add missing stddef.h include for offsetof macro
-
-Downloaded from upstream commit:
-https://github.com/xbmc/screensaver.biogenesis/commit/86da3bfecf8ddd2f8c2c3eed6e1cb8850883f4b2
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/Life.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/Life.cpp b/src/Life.cpp
-index 762ad7d..68be133 100644
---- a/src/Life.cpp
-+++ b/src/Life.cpp
-@@ -24,6 +24,7 @@
- 
- #include "types.h"
- #include <memory.h>
-+#include <stddef.h>
- #ifdef WIN32
- #include <d3d11.h>
- #else
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
index 851519a239..4c1c0d0fc4 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1d1edff918d2a94ba0efd329a45294be47e73eef65f700d62b311eb750d0fef7  kodi-screensaver-biogenesis-2.2.2-Leia.tar.gz
+sha256  b0f721d112282f633a769e7b077c5dd52e5045a8f1ae32c4e602b0e2e937acb0  kodi-screensaver-biogenesis-2.2.3-Leia.tar.gz
 sha256  2bca14bf4f7391885dc6bb7c7ef190238e529a03b92cb22c09a37c178bc94b76  src/Life.cpp
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
index 3888f2996e..7222c16bc3 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_BIOGENESIS_VERSION = 2.2.2-Leia
+KODI_SCREENSAVER_BIOGENESIS_VERSION = 2.2.3-Leia
 KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,xbmc,screensaver.biogenesis,$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
 KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = src/Life.cpp

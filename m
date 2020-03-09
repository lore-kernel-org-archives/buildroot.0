From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  9 Mar 2020 19:39:35 +0100
Subject: [Buildroot] [PATCH 13/16] package/kodi-screensaver-pingpong: bump
 version to 2.1.2-Leia
In-Reply-To: <20200309183938.2528-1-bernd.kuhls@t-online.de>
References: <20200309183938.2528-1-bernd.kuhls@t-online.de>
Message-ID: <20200309183938.2528-13-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream:
https://github.com/xbmc/screensaver.pingpong/commit/6ca75e7d421a49b6124d0e1cd37a529c66a701cb

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ackport-Add-missing-cstddef-includes.patch | 32 -------------------
 .../kodi-screensaver-pingpong.hash            |  2 +-
 .../kodi-screensaver-pingpong.mk              |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 package/kodi-screensaver-pingpong/0001-Backport-Add-missing-cstddef-includes.patch

diff --git a/package/kodi-screensaver-pingpong/0001-Backport-Add-missing-cstddef-includes.patch b/package/kodi-screensaver-pingpong/0001-Backport-Add-missing-cstddef-includes.patch
deleted file mode 100644
index f71e1899ae..0000000000
--- a/package/kodi-screensaver-pingpong/0001-Backport-Add-missing-cstddef-includes.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 6ca75e7d421a49b6124d0e1cd37a529c66a701cb Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 18 Jan 2020 20:01:21 +0100
-Subject: [PATCH] [Backport] Add missing cstddef includes
-
-Fixes build error with gcc 5.5.0.
-
-Backported from https://github.com/xbmc/screensaver.pingpong/pull/21
-
-Patch sent upstream:
-https://github.com/xbmc/screensaver.pingpong/pull/22
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/pingpong.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/pingpong.cpp b/src/pingpong.cpp
-index e1df353..9cd9fb5 100644
---- a/src/pingpong.cpp
-+++ b/src/pingpong.cpp
-@@ -24,6 +24,7 @@
- #include "main.h"
- #include "pingpong.h"
- 
-+#include <cstddef>
- #include <vector>
- 
- #define NUMQUADS 3
--- 
-2.20.1
-
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
index b4e22420ac..128bd251d5 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d4e09509bf036b7d5c381cd4ecac926a59396fb481347a4056d843ae68d3a20d  kodi-screensaver-pingpong-2.1.1-Leia.tar.gz
+sha256 618a7dfc85961c803b6292cea9004bdb71566e10a32aec2870cd29775681a808  kodi-screensaver-pingpong-2.1.2-Leia.tar.gz
 sha256 47ff769788026a338740772250197acd0a84f26b57dda49e5b14d63f2f2937ee  src/readme.txt
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
index 45f2d23039..647417f211 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PINGPONG_VERSION = 2.1.1-Leia
+KODI_SCREENSAVER_PINGPONG_VERSION = 2.1.2-Leia
 KODI_SCREENSAVER_PINGPONG_SITE = $(call github,xbmc,screensaver.pingpong,$(KODI_SCREENSAVER_PINGPONG_VERSION))
 KODI_SCREENSAVER_PINGPONG_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = src/readme.txt
-- 
2.25.0

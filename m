From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Sep 2019 21:28:19 +0200
Subject: [Buildroot] [PATCH v6 18/25] package/kodi-pvr-stalker: bump version
In-Reply-To: <20190921192826.10143-1-bernd.kuhls@t-online.de>
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
Message-ID: <20190921192826.10143-19-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch after being applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-src-CWatchdog.h-Fix-gcc7-build.patch | 29 -------------------
 .../kodi-pvr-stalker/kodi-pvr-stalker.hash    |  2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk  |  4 +--
 3 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 package/kodi-pvr-stalker/0001-src-CWatchdog.h-Fix-gcc7-build.patch

diff --git a/package/kodi-pvr-stalker/0001-src-CWatchdog.h-Fix-gcc7-build.patch b/package/kodi-pvr-stalker/0001-src-CWatchdog.h-Fix-gcc7-build.patch
deleted file mode 100644
index 2d85f6bc6f..0000000000
--- a/package/kodi-pvr-stalker/0001-src-CWatchdog.h-Fix-gcc7-build.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From bb16ccd14deb3a01049daec37b6d2e7711ef4738 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 13 May 2017 20:22:08 +0200
-Subject: [PATCH] src/CWatchdog.h: Fix gcc7 build
-
-Building with gcc7 is broken:
-
-src/CWatchdog.h:31:58: error: 'std::function' has not been declared
-    CWatchdog(unsigned int interval, SAPI *api, std::function<void(SError)> errorCallback);
-                                                     ^~~~~~~~
-
-Submitted-upstream: https://github.com/kodi-pvr/pvr.stalker/pull/93
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/CWatchdog.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/CWatchdog.h b/src/CWatchdog.h
-index c465e91..239d95d 100644
---- a/src/CWatchdog.h
-+++ b/src/CWatchdog.h
-@@ -22,6 +22,7 @@
-  */
- 
- #include <thread>
-+#include <functional>
- 
- #include "SAPI.h"
- 
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
index 07c768f252..1fe9fdf75c 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 466cb3869927cdd245a746a32d92250e198befe577f7a847884eab1fd8eeb139  kodi-pvr-stalker-2.8.6-Krypton.tar.gz
+sha256 1f1399dce1b646f2d0bf4930b834ef899b745320ffdf232d26d4dd4dc31d78f2  kodi-pvr-stalker-92ab8e85e291e65a44dcfd6fcc12393324b0f97d.tar.gz
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index 32ac2cad0e..b58b6cb0d6 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Krypton'
-# When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_STALKER_VERSION = 2.8.6-Krypton
+KODI_PVR_STALKER_VERSION = 92ab8e85e291e65a44dcfd6fcc12393324b0f97d
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPL-2.0+
 KODI_PVR_STALKER_LICENSE_FILES = src/client.h
-- 
2.20.1

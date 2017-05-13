From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 13 May 2017 20:29:44 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/kodi-pvr-stalker: fix gcc7
	compile
Message-ID: <20170513182944.29833-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-src-CWatchdog.h-Fix-gcc7-build.patch      | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/kodi-pvr-stalker/0001-src-CWatchdog.h-Fix-gcc7-build.patch

diff --git a/package/kodi-pvr-stalker/0001-src-CWatchdog.h-Fix-gcc7-build.patch b/package/kodi-pvr-stalker/0001-src-CWatchdog.h-Fix-gcc7-build.patch
new file mode 100644
index 0000000000..54d18a996c
--- /dev/null
+++ b/package/kodi-pvr-stalker/0001-src-CWatchdog.h-Fix-gcc7-build.patch
@@ -0,0 +1,33 @@
+From bb16ccd14deb3a01049daec37b6d2e7711ef4738 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 13 May 2017 20:22:08 +0200
+Subject: [PATCH 1/1] src/CWatchdog.h: Fix gcc7 build
+
+Building with gcc7 is broken:
+
+src/CWatchdog.h:31:58: error: 'std::function' has not been declared
+    CWatchdog(unsigned int interval, SAPI *api, std::function<void(SError)> errorCallback);
+                                                     ^~~~~~~~
+
+Patch sent upstream as PR 93.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/CWatchdog.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/CWatchdog.h b/src/CWatchdog.h
+index c465e91..239d95d 100644
+--- a/src/CWatchdog.h
++++ b/src/CWatchdog.h
+@@ -22,6 +22,7 @@
+  */
+ 
+ #include <thread>
++#include <functional>
+ 
+ #include "SAPI.h"
+ 
+-- 
+2.11.0
+
-- 
2.11.0

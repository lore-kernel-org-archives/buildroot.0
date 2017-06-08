From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 23:35:26 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-stalker: fix build with
	gcc 7.x
Message-ID: <20170608213537.1CEC37FA96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7cd9a3e5802f1abee706549ad9cf87bf018eb6fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-src-CWatchdog.h-Fix-gcc7-build.patch      | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/kodi-pvr-stalker/0001-src-CWatchdog.h-Fix-gcc7-build.patch b/package/kodi-pvr-stalker/0001-src-CWatchdog.h-Fix-gcc7-build.patch
new file mode 100644
index 0000000..2d85f6b
--- /dev/null
+++ b/package/kodi-pvr-stalker/0001-src-CWatchdog.h-Fix-gcc7-build.patch
@@ -0,0 +1,29 @@
+From bb16ccd14deb3a01049daec37b6d2e7711ef4738 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 13 May 2017 20:22:08 +0200
+Subject: [PATCH] src/CWatchdog.h: Fix gcc7 build
+
+Building with gcc7 is broken:
+
+src/CWatchdog.h:31:58: error: 'std::function' has not been declared
+    CWatchdog(unsigned int interval, SAPI *api, std::function<void(SError)> errorCallback);
+                                                     ^~~~~~~~
+
+Submitted-upstream: https://github.com/kodi-pvr/pvr.stalker/pull/93
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

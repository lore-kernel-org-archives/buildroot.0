From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 14:09:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/w_scan: fix musl build
Message-ID: <1453640947-2780-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/d49/d497c0b23b7f905605f1764c136a9d7682e8137e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/w_scan/0001-musl.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/w_scan/0001-musl.patch

diff --git a/package/w_scan/0001-musl.patch b/package/w_scan/0001-musl.patch
new file mode 100644
index 0000000..7633d55
--- /dev/null
+++ b/package/w_scan/0001-musl.patch
@@ -0,0 +1,26 @@
+Fix musl build
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr w_scan-20141122.org/descriptors.h w_scan-20141122/descriptors.h
+--- w_scan-20141122.org/descriptors.h	2014-11-22 09:49:26.000000000 +0100
++++ w_scan-20141122/descriptors.h	2016-01-24 14:05:21.000000000 +0100
+@@ -28,6 +28,7 @@
+ #ifndef __DESCRIPTORS_H__
+ #define __DESCRIPTORS_H__
+ 
++#include <time.h>
+ #include "extended_frontend.h"
+ 
+ /******************************************************************************
+diff -uNr w_scan-20141122.org/version.h w_scan-20141122/version.h
+--- w_scan-20141122.org/version.h	2014-11-22 11:59:56.000000000 +0100
++++ w_scan-20141122/version.h	2016-01-24 14:06:33.000000000 +0100
+@@ -1,6 +1,6 @@
+ /* AUTOMATICALLY GENERATED - DO NOT EDIT MANUALLY */
+ #ifndef W_SCAN_VERSION_H
+ #define W_SCAN_VERSION_H
+-uint version=20141122;
++unsigned int version=20141122;
+ #endif
+ 
-- 
2.7.0.rc3

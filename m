From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:35:37 +0100
Subject: [Buildroot] [git commit] package/w_scan: fix musl build
Message-ID: <20160201224714.CF2387F8C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6bccd66434730d791daf19d963789916c886e77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/d49/d497c0b23b7f905605f1764c136a9d7682e8137e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/w_scan/0001-musl.patch | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

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

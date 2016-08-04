From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2016 22:49:48 +0200
Subject: [Buildroot] [git commit] package/libvpx: Fix compilation when
	__uClinux__ is defined
Message-ID: <20160804205110.7F1C680525@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b178279908d6f03008fd585d9c00908b401b851
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

<lddk.h> is a platform-specific header, which is not provided by any C
library today.

Fixes:

  http://autobuild.buildroot.net/results/ae7ba1d5979ebe39aace628fa8ff2c8f08a70a98/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...mem-vpx_mem.h-Fix-compilation-with-uClibc.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch b/package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch
new file mode 100644
index 0000000..20f08c9
--- /dev/null
+++ b/package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch
@@ -0,0 +1,30 @@
+From 90845a3a263e0f37b9c756c0b01377b9d1a225c9 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 31 Jul 2016 10:37:05 +0200
+Subject: [PATCH] vpx_mem/vpx_mem.h: do not include <lddk.h>
+
+The <lddk.h> header does not exist in most C libraries, and including
+it causes build failures.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ vpx_mem/vpx_mem.h | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/vpx_mem/vpx_mem.h b/vpx_mem/vpx_mem.h
+index c14f288..82df745 100644
+--- a/vpx_mem/vpx_mem.h
++++ b/vpx_mem/vpx_mem.h
+@@ -12,9 +12,6 @@
+ #define VPX_MEM_VPX_MEM_H_
+ 
+ #include "vpx_config.h"
+-#if defined(__uClinux__)
+-# include <lddk.h>
+-#endif
+ 
+ #include <stdlib.h>
+ #include <stddef.h>
+-- 
+2.8.1
+

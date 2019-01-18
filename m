From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 18 Jan 2019 22:17:56 +0100
Subject: [Buildroot] [PATCH 1/1] gnu-efi: fix build with gcc 4.8
Message-ID: <20190118211756.22606-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/a0ca37b5ed27af445344e3ac49dc87bb17512c50

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-efilink-fix-build-with-gcc-4.8.patch      | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch

diff --git a/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch b/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..57c78c9bd4
--- /dev/null
+++ b/package/gnu-efi/0001-efilink-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,35 @@
+From 6335e5c697c57d8b5854b8202de3733bcb151ca6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 18 Jan 2019 22:05:37 +0100
+Subject: [PATCH] efilink: fix build with gcc 4.8
+
+intptr_t is undefined without an include on stdint.h
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a0ca37b5ed27af445344e3ac49dc87bb17512c50
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://sourceforge.net/p/gnu-efi/code/merge-requests/3]
+---
+ inc/efilink.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/inc/efilink.h b/inc/efilink.h
+index cc5aa2d..b69a6fd 100644
+--- a/inc/efilink.h
++++ b/inc/efilink.h
+@@ -1,6 +1,10 @@
+ #ifndef _EFI_LINK_H
+ #define _EFI_LINK_H
+ 
++#if defined(__GNUC__)
++#include <stdint.h>
++#endif
++
+ /*++
+ 
+ Copyright (c) 1998  Intel Corporation
+-- 
+2.14.1
+
-- 
2.14.1

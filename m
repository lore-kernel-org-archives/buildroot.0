From: Will Newton <will.newton@gmail.com>
Date: Wed, 15 Feb 2012 16:26:43 +0000
Subject: [Buildroot] [PATCH] lite: Remove excess slashes from pkg-config
	file.
Message-ID: <CAFbHwiSOquRb-DqUo6-gwbdZguAtYqPt53H6=WWcnKfddyvdyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/lite/lite-pkg-config.patch |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/lite/lite-pkg-config.patch

diff --git a/package/lite/lite-pkg-config.patch
b/package/lite/lite-pkg-config.patch
new file mode 100644
index 0000000..6f09fd1
--- /dev/null
+++ b/package/lite/lite-pkg-config.patch
@@ -0,0 +1,22 @@
+From 7982cccbb6ad58f3802bb266467290200d130a48 Mon Sep 17 00:00:00 2001
+From: Ville Syrjala <syrjala@sci.fi>
+Date: Sat, 27 Nov 2010 01:14:25 +0200
+Subject: [PATCH] Too many '\' characters in the .pc file
+
+---
+ lite.pc.in |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/lite.pc.in b/lite.pc.in
+index 48eb969..3a21eaa 100644
+--- a/lite.pc.in
++++ b/lite.pc.in
+@@ -9,4 +9,4 @@ Description: "LiTE" is a Toolkit Engine
+ Requires: directfb >= @DFB_REQUIRED_VERSION@
+ Version: @VERSION@
+ Libs: -L${libdir} -llite
+-Cflags: -I${includedir} -DLITEFONTDIR=\\\"@LITEFONTDIR@\\\"
++Cflags: -I${includedir} -DLITEFONTDIR=\"@LITEFONTDIR@\"
+--
+1.7.1
+
-- 
1.7.1
-------------- next part --------------

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 19 Apr 2019 00:02:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/freerdp: fix build without xfixes
Message-ID: <20190418220236.5821-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/69245e574787bada718c52c805ec137041dc233d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ..._floatbar.c-fix-build-without-Xfixes.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/freerdp/0001-xf_floatbar.c-fix-build-without-Xfixes.patch

diff --git a/package/freerdp/0001-xf_floatbar.c-fix-build-without-Xfixes.patch b/package/freerdp/0001-xf_floatbar.c-fix-build-without-Xfixes.patch
new file mode 100644
index 0000000000..c0b4195883
--- /dev/null
+++ b/package/freerdp/0001-xf_floatbar.c-fix-build-without-Xfixes.patch
@@ -0,0 +1,32 @@
+From 7dbb64cb62049159d9d71b9be39f469bbd116f41 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 18 Apr 2019 23:40:52 +0200
+Subject: [PATCH] xf_floatbar.c: fix build without Xfixes
+
+Remove unneeded include on Xfixes.h as it is not always available and
+not used in xf_floatbar.c
+
+Fixes:
+ - http://autobuild.buildroot.org/results/69245e574787bada718c52c805ec137041dc233d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/FreeRDP/FreeRDP/pull/5354]
+---
+ client/X11/xf_floatbar.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/client/X11/xf_floatbar.c b/client/X11/xf_floatbar.c
+index 3643b6052..04912aa79 100644
+--- a/client/X11/xf_floatbar.c
++++ b/client/X11/xf_floatbar.c
+@@ -19,7 +19,6 @@
+ #include <X11/Xutil.h>
+ #include <X11/Xatom.h>
+ #include <X11/extensions/shape.h>
+-#include <X11/extensions/Xfixes.h>
+ #include <X11/cursorfont.h>
+ 
+ #include "xf_floatbar.h"
+-- 
+2.20.1
+
-- 
2.20.1

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 May 2015 15:08:59 +0200
Subject: [Buildroot] [PATCH] cc-tool: fix missing stdarg.h include on uClibc
Message-ID: <1430658539-7438-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch to fix a missing <stdarg.h> include for
va_list.

Fixes:

  http://autobuild.buildroot.org/results/9c8/9c828b1da8983577f93bdfae5275fc5122ae874f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cc-tool/0001-add-missing-stdarg-include.patch | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 package/cc-tool/0001-add-missing-stdarg-include.patch

diff --git a/package/cc-tool/0001-add-missing-stdarg-include.patch b/package/cc-tool/0001-add-missing-stdarg-include.patch
new file mode 100644
index 0000000..c4f47fd
--- /dev/null
+++ b/package/cc-tool/0001-add-missing-stdarg-include.patch
@@ -0,0 +1,18 @@
+Add missing <stdarg.h> include for va_list
+
+Fixes the build on uClibc.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/common/log.h
+===================================================================
+--- a/src/common/log.h
++++ b/src/common/log.h
+@@ -13,6 +13,7 @@
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <stdarg.h>
+ #include "common.h"
+ 
+ class Log
-- 
2.1.0

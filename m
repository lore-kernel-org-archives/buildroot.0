From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 May 2015 16:33:46 +0200
Subject: [Buildroot] [git commit] cc-tool: fix missing stdarg.h include on
	uClibc
Message-ID: <20150503143419.0E1D5818B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a500dff16875392b6ae91ab10e0595020b8289fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to fix a missing <stdarg.h> include for
va_list.

Fixes:

  http://autobuild.buildroot.org/results/9c8/9c828b1da8983577f93bdfae5275fc5122ae874f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../cc-tool/0001-add-missing-stdarg-include.patch  |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

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

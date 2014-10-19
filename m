From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 23:26:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/qdecoder: Fix build error
Message-ID: <1413754004-4439-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Error occured with an allyespackageconfig setup:

qcgireq.c: In function '_parse_multipart_value_into_disk':
qcgireq.c:738:60: error: 'errno' undeclared (first use in this function)
         DEBUG("I/O error. (errno=%d)", (ioerror == true) ? errno : 0);

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/qdecoder/qdecoder-0003-errno.patch |   34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/qdecoder/qdecoder-0003-errno.patch

diff --git a/package/qdecoder/qdecoder-0003-errno.patch b/package/qdecoder/qdecoder-0003-errno.patch
new file mode 100644
index 0000000..71d5cfd
--- /dev/null
+++ b/package/qdecoder/qdecoder-0003-errno.patch
@@ -0,0 +1,34 @@
+Fixes build error
+
+qcgireq.c: In function '_parse_multipart_value_into_disk':
+qcgireq.c:738:60: error: 'errno' undeclared (first use in this function)
+         DEBUG("I/O error. (errno=%d)", (ioerror == true) ? errno : 0);
+
+Patch downloaded from upstream repo:
+https://github.com/wolkykim/qdecoder/commit/574f0216a51e3e852cd94e2a0a3b52dc64e74548
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From 574f0216a51e3e852cd94e2a0a3b52dc64e74548 Mon Sep 17 00:00:00 2001
+From: nyov <nyov@nexnode.net>
+Date: Fri, 5 Sep 2014 18:41:10 +0000
+Subject: [PATCH] add missing header include
+
+fixes #7
+---
+ src/qcgireq.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/qcgireq.c b/src/qcgireq.c
+index dcb8c57..d34ff83 100644
+--- a/src/qcgireq.c
++++ b/src/qcgireq.c
+@@ -139,6 +139,7 @@
+ #ifndef _WIN32
+ #include <dirent.h>
+ #endif
++#include <errno.h>
+ #include "qdecoder.h"
+ #include "internal.h"
+ 
-- 
1.7.10.4

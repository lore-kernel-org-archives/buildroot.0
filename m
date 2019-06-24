From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 24 Jun 2019 21:20:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/rtmpdump: fix build
Message-ID: <20190624192014.29450-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/8fd/8fd65149bdbbaf5dcb8e6a9d543f4224875bb156/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rtmpdump/0001-include-limits.h.patch | 39 ++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/rtmpdump/0001-include-limits.h.patch

diff --git a/package/rtmpdump/0001-include-limits.h.patch b/package/rtmpdump/0001-include-limits.h.patch
new file mode 100644
index 0000000000..172a9630f7
--- /dev/null
+++ b/package/rtmpdump/0001-include-limits.h.patch
@@ -0,0 +1,39 @@
+From b9d010d2c07e07eeffa510f14ff833ecb10dc0c8 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 24 Jun 2019 21:11:33 +0200
+Subject: [PATCH] include <limits.h>
+
+Needed after
+https://repo.or.cz/rtmpdump.git/commitdiff/c5f04a58fc2aeea6296ca7c44ee4734c18401aa3
+
+to fix
+
+rtmp.c: In function 'HTTP_read':
+rtmp.c:4459:26: error: 'INT_MAX' undeclared (first use in this function); did you mean 'INT8_MAX'?
+
+reported by buildroot autobuilders:
+http://autobuild.buildroot.net/?reason=rtmpdump-c5f04a58fc2aeea6296ca7c44ee4734c18401aa3
+
+Patch sent upstream by e-mail to author of
+https://repo.or.cz/rtmpdump.git/patch/c5f04a58fc2aeea6296ca7c44ee4734c18401aa3
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ librtmp/rtmp.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/librtmp/rtmp.h b/librtmp/rtmp.h
+index 6d7dd89..48d4fc3 100644
+--- a/librtmp/rtmp.h
++++ b/librtmp/rtmp.h
+@@ -32,6 +32,7 @@
+ #include <errno.h>
+ #include <stdint.h>
+ #include <stddef.h>
++#include <limits.h>
+ 
+ #include "amf.h"
+ 
+-- 
+2.20.1
+
-- 
2.20.1

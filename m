From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 14 Jan 2017 22:17:27 +0200
Subject: [Buildroot] [PATCH 1/3] tslib: fix missing headers
Message-ID: <9af1cba158ce6dcb96f5f121d4105895fea911b9.1484425049.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch adding missing headers.

Fixes:
http://autobuild.buildroot.net/results/cb8/cb81abe996b0fb0070ddcd01c0d695bcc0570548/
http://autobuild.buildroot.net/results/88a/88add491e10f2f7edeb15e0def8843f1321ac7af/
http://autobuild.buildroot.net/results/9db/9db1d64fd08c8763a1648e78d7b9155777de6cae/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...01-tests-ts_calibrate-add-missing-headers.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/tslib/0001-tests-ts_calibrate-add-missing-headers.patch

diff --git a/package/tslib/0001-tests-ts_calibrate-add-missing-headers.patch b/package/tslib/0001-tests-ts_calibrate-add-missing-headers.patch
new file mode 100644
index 000000000000..97cd4beacaba
--- /dev/null
+++ b/package/tslib/0001-tests-ts_calibrate-add-missing-headers.patch
@@ -0,0 +1,35 @@
+From 54b66bfe405d8b70c703684e60bedbad5c7d4213 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sat, 14 Jan 2017 21:35:53 +0200
+Subject: [PATCH] tests/ts_calibrate: add missing headers
+
+The open(2) system call requires sys/types.h and sys/stat.h. Fix the following
+build failure under uClibc-ng:
+
+ts_calibrate.c: In function ?main?:
+ts_calibrate.c:248:19: error: ?S_IRUSR? undeclared (first use in this function)
+                   S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
+                   ^
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/kergoth/tslib/pull/59
+ tests/ts_calibrate.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/ts_calibrate.c b/tests/ts_calibrate.c
+index c6652e479d4b..9a98d1f86205 100644
+--- a/tests/ts_calibrate.c
++++ b/tests/ts_calibrate.c
+@@ -17,6 +17,8 @@
+ #include <string.h>
+ #include <unistd.h>
+ #include <sys/time.h>
++#include <sys/types.h>
++#include <sys/stat.h>
+ 
+ #ifdef __ANDROID__
+ #include <fcntl.h>
+-- 
+2.11.0
+
-- 
2.11.0

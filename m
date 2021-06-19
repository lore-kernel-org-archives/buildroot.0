From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 19 Jun 2021 19:21:47 +0200
Subject: [Buildroot] [PATCH 1/2] package/libndp: drop patch
Message-ID: <20210619172148.295788-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch is not needed since bump to version 1.7 in commit
6274f4191335cf8c9b88796f59da8af04e3abf7a and
https://github.com/jpirko/libndp/commit/94e9a082d76414f82794b0c9817d0c24e3868275

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-ndptool.c-Fix-musl-build.patch       | 30 -------------------
 1 file changed, 30 deletions(-)
 delete mode 100644 package/libndp/0001-ndptool.c-Fix-musl-build.patch

diff --git a/package/libndp/0001-ndptool.c-Fix-musl-build.patch b/package/libndp/0001-ndptool.c-Fix-musl-build.patch
deleted file mode 100644
index 547598c6ee..0000000000
--- a/package/libndp/0001-ndptool.c-Fix-musl-build.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 561f80b9a848be923f37bf1afedbecf92da3b2e7 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 30 Jan 2016 16:36:39 +0100
-Subject: [PATCH 1/1] ndptool.c: Fix musl build
-
-Fixes a build issue with the musl C library
-http://autobuild.buildroot.net/results/d42/d42bebe51bbec38f131840b6bbefdc162f0ad194/build-end.log
-
-Patch sent upstream: https://github.com/jpirko/libndp/pull/7
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- utils/ndptool.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/utils/ndptool.c b/utils/ndptool.c
-index 04ec4e1..c6ef48c 100644
---- a/utils/ndptool.c
-+++ b/utils/ndptool.c
-@@ -27,6 +27,7 @@
- #include <netinet/in.h>
- #include <arpa/inet.h>
- #include <errno.h>
-+#include <sys/select.h>
- #include <ndp.h>
- 
- enum verbosity_level {
--- 
-2.7.0.rc3
-
-- 
2.30.2

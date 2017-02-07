From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Tue, 7 Feb 2017 12:25:27 +0100
Subject: [Buildroot] [PATCH 1/2] tslib: bump to 1.4
In-Reply-To: <20170207101458.c5uhhasch73sihfx@tarshish>
References: <20170207101458.c5uhhasch73sihfx@tarshish>
Message-ID: <1486466728-24435-1-git-send-email-martin.kepplinger@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

additionally this
 * removes the patch adding missing headers (fixed upstream)
 * slightly changes the package desctiption

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---
 ...01-tests-ts_calibrate-add-missing-headers.patch | 35 ----------------------
 package/tslib/Config.in                            |  2 +-
 package/tslib/tslib.hash                           |  4 +--
 package/tslib/tslib.mk                             |  2 +-
 4 files changed, 4 insertions(+), 39 deletions(-)
 delete mode 100644 package/tslib/0001-tests-ts_calibrate-add-missing-headers.patch

diff --git a/package/tslib/0001-tests-ts_calibrate-add-missing-headers.patch b/package/tslib/0001-tests-ts_calibrate-add-missing-headers.patch
deleted file mode 100644
index 97cd4be..0000000
--- a/package/tslib/0001-tests-ts_calibrate-add-missing-headers.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 54b66bfe405d8b70c703684e60bedbad5c7d4213 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sat, 14 Jan 2017 21:35:53 +0200
-Subject: [PATCH] tests/ts_calibrate: add missing headers
-
-The open(2) system call requires sys/types.h and sys/stat.h. Fix the following
-build failure under uClibc-ng:
-
-ts_calibrate.c: In function ?main?:
-ts_calibrate.c:248:19: error: ?S_IRUSR? undeclared (first use in this function)
-                   S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
-                   ^
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/kergoth/tslib/pull/59
- tests/ts_calibrate.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tests/ts_calibrate.c b/tests/ts_calibrate.c
-index c6652e479d4b..9a98d1f86205 100644
---- a/tests/ts_calibrate.c
-+++ b/tests/ts_calibrate.c
-@@ -17,6 +17,8 @@
- #include <string.h>
- #include <unistd.h>
- #include <sys/time.h>
-+#include <sys/types.h>
-+#include <sys/stat.h>
- 
- #ifdef __ANDROID__
- #include <fcntl.h>
--- 
-2.11.0
-
diff --git a/package/tslib/Config.in b/package/tslib/Config.in
index 6b86ebc..3665301 100644
--- a/package/tslib/Config.in
+++ b/package/tslib/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_TSLIB
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	help
-	  Tslib is an abstraction layer for touchscreen panel events.
+	  Tslib is a filtering layer for touchscreen panel events.
 
 	  https://github.com/kergoth/tslib
 
diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index cdbe0d2..6540ac8 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,2 +1,2 @@
-# Locally generated
-sha256  e935101adca980a14d1a13362796222575f99e6a41db585e8358fffddb98d92c  tslib-1.3.tar.xz
+# taken from https://github.com/kergoth/tslib/releases/tag/1.4
+sha256  ad0373f1dbfda27caec92cb10421227f226c79d160488f1ac915585ba947741f  tslib-1.4.tar.xz
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index d3388a2..5ea526e 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.3
+TSLIB_VERSION = 1.4
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL, LGPL
-- 
2.1.4

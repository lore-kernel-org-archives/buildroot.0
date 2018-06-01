From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  1 Jun 2018 15:03:48 +0300
Subject: [Buildroot] [PATCH next] dash: bump to version 0.5.10.2
Message-ID: <41b10a2660ad43d39e93dde6faa6a3cc4b930f79.1527854628.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...02-histedit-fix-build-with-musl-libc.patch | 35 -------------------
 package/dash/dash.hash                        |  6 ++--
 package/dash/dash.mk                          |  2 +-
 3 files changed, 5 insertions(+), 38 deletions(-)
 delete mode 100644 package/dash/0002-histedit-fix-build-with-musl-libc.patch

diff --git a/package/dash/0002-histedit-fix-build-with-musl-libc.patch b/package/dash/0002-histedit-fix-build-with-musl-libc.patch
deleted file mode 100644
index a9e4c5aea162..000000000000
--- a/package/dash/0002-histedit-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 2da5b72c704fed10f1b04b5432ac6b078d016fae Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 2 Mar 2018 08:25:36 +0200
-Subject: [PATCH] histedit: fix build with musl libc
-
-musl libc defines the optreset BSD extension only in getopt.h. This
-fixes the following build failure:
-
-histedit.c: In function 'histcmd':
-histedit.c:220:2: error: 'optreset' undeclared (first use in this function)
-  optreset = 1; optind = 1; /* initialize getopt */
-  ^~~~~~~~
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://www.mail-archive.com/dash at vger.kernel.org/msg01389.html
-
- src/histedit.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/histedit.c b/src/histedit.c
-index 94465d785cc9..f5c90aba873b 100644
---- a/src/histedit.c
-+++ b/src/histedit.c
-@@ -39,6 +39,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <unistd.h>
-+#include <getopt.h>
- /*
-  * Editline and history functions (and glue).
-  */
--- 
-2.16.1
-
diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index b5a37b61d776..a2e131536a47 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,2 +1,4 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.9.1.tar.gz.sha256sum
-sha256	5ecd5bea72a93ed10eb15a1be9951dd51b52e5da1d4a7ae020efd9826b49e659	dash-0.5.9.1.tar.gz
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.10.2.tar.gz.sha256sum
+sha256	3c663919dc5c66ec991da14c7cf7e0be8ad00f3db73986a987c118862b5f6071	dash-0.5.10.2.tar.gz
+# Locally calculated
+sha256	254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72	COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 9a26ebb642c3..6e744411b1f4 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.9.1
+DASH_VERSION = 0.5.10.2
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
-- 
2.17.0

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Oct 2016 14:56:57 +0200
Subject: [Buildroot] [git commit] libfastjson: bump version to 0.99.4
Message-ID: <20161022125828.A75557F8AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd6448d501c770e48607c27ffe402409a84c555c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch and rename remaining one.

Also fixes:
  http://autobuild.buildroot.net/results/bfe/bfe8ebe3966324b16ca572bfba0a1a8ddc275db9

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libfastjson/0001-fix-missing-config.h.patch    | 29 ----------------------
 ...atch => 0001-m4-fix-detection-of-atomics.patch} |  0
 package/libfastjson/libfastjson.hash               |  2 +-
 package/libfastjson/libfastjson.mk                 |  2 +-
 4 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/package/libfastjson/0001-fix-missing-config.h.patch b/package/libfastjson/0001-fix-missing-config.h.patch
deleted file mode 100644
index 8663e23..0000000
--- a/package/libfastjson/0001-fix-missing-config.h.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 3e017fe8da1e821d4fcd801c75467c8ec2a81eb4 Mon Sep 17 00:00:00 2001
-From: Rainer Gerhards <rgerhards@adiscon.com>
-Date: Tue, 19 Apr 2016 08:21:50 +0200
-Subject: [PATCH] fix missing config.h
-
-[yann.morin.1998 at free.fr: backport from upstream]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
- json_object_iterator.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/json_object_iterator.c b/json_object_iterator.c
-index 6ab3a85..fb51f6e 100644
---- a/json_object_iterator.c
-+++ b/json_object_iterator.c
-@@ -17,8 +17,8 @@
- *******************************************************************************
- */
- 
-+#include "config.h"
- #include <stddef.h>
--
- #include "json.h"
- #include "json_object_private.h"
- #include "json_object_iterator.h"
--- 
-2.7.4
-
diff --git a/package/libfastjson/0002-m4-fix-detection-of-atomics.patch b/package/libfastjson/0001-m4-fix-detection-of-atomics.patch
similarity index 100%
rename from package/libfastjson/0002-m4-fix-detection-of-atomics.patch
rename to package/libfastjson/0001-m4-fix-detection-of-atomics.patch
diff --git a/package/libfastjson/libfastjson.hash b/package/libfastjson/libfastjson.hash
index 8531dac..427db9c 100644
--- a/package/libfastjson/libfastjson.hash
+++ b/package/libfastjson/libfastjson.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  fcdca0c4702362de3db3f02c8da05f985b54a9eccd618af41730409b75d10a8f  libfastjson-v0.99.2.tar.gz
+sha256  03ef63dcc88417e71c19ce4436804159e3397e3a20d3529efef6a43c3bef5c8d  libfastjson-v0.99.4.tar.gz
diff --git a/package/libfastjson/libfastjson.mk b/package/libfastjson/libfastjson.mk
index ec5390c..b1cdd6a 100644
--- a/package/libfastjson/libfastjson.mk
+++ b/package/libfastjson/libfastjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFASTJSON_VERSION = v0.99.2
+LIBFASTJSON_VERSION = v0.99.4
 LIBFASTJSON_SITE = $(call github,rsyslog,libfastjson,$(LIBFASTJSON_VERSION))
 LIBFASTJSON_INSTALL_STAGING = YES
 # From git

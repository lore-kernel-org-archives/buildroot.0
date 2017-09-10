From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 10 Sep 2017 05:40:36 -0500
Subject: [Buildroot] [PATCH] smack: bump version to 1.3.1
Message-ID: <20170910104036.19763-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 ...ck-common.c-Include-limits.h-for-PATH_MAX.patch | 29 ----------------------
 package/smack/smack.hash                           |  2 +-
 package/smack/smack.mk                             |  4 +--
 3 files changed, 3 insertions(+), 32 deletions(-)
 delete mode 100644 package/smack/0001-libsmack-common.c-Include-limits.h-for-PATH_MAX.patch

diff --git a/package/smack/0001-libsmack-common.c-Include-limits.h-for-PATH_MAX.patch b/package/smack/0001-libsmack-common.c-Include-limits.h-for-PATH_MAX.patch
deleted file mode 100644
index 0e30ef5e39..0000000000
--- a/package/smack/0001-libsmack-common.c-Include-limits.h-for-PATH_MAX.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 316c911aa741b14513622a4206ed6d324e951fa0 Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Wed, 20 May 2015 21:25:22 +0200
-Subject: [PATCH 1/1] libsmack/common.c: Include <limits.h> for PATH_MAX
-
-Signed-off-by: Felix Janda <felix.janda@posteo.de>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
-Downloaded from upstream commit
-https://github.com/smack-team/smack/commit/316c911aa741b14513622a4206ed6d324e951fa0
-
- libsmack/common.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libsmack/common.c b/libsmack/common.c
-index 55fee1a..55b59e3 100644
---- a/libsmack/common.c
-+++ b/libsmack/common.c
-@@ -22,6 +22,7 @@
- #include <dirent.h>
- #include <errno.h>
- #include <fcntl.h>
-+#include <limits.h>
- #include <stdio.h>
- #include <string.h>
- #include <unistd.h>
--- 
-2.7.0
-
diff --git a/package/smack/smack.hash b/package/smack/smack.hash
index fd51249811..2c1f446250 100644
--- a/package/smack/smack.hash
+++ b/package/smack/smack.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  94dc21b4a5e570af0eb44debf57491170cccdbf60e03b5a3210f2a14d6448390  smack-v1.1.0.tar.gz
+sha256 1a607da3b1a661dc76b7a5b8571f4a2d56b4d61d78376088d19f2d8637dc6822  smack-1.3.1.tar.gz
diff --git a/package/smack/smack.mk b/package/smack/smack.mk
index 7a4c72296b..d2ac005ab9 100644
--- a/package/smack/smack.mk
+++ b/package/smack/smack.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SMACK_VERSION = v1.1.0
-SMACK_SITE = $(call github,smack-team,smack,$(SMACK_VERSION))
+SMACK_VERSION = 1.3.1
+SMACK_SITE = $(call github,smack-team,smack,v$(SMACK_VERSION))
 SMACK_LICENSE = LGPL-2.1
 SMACK_LICENSE_FILES = COPYING
 SMACK_INSTALL_STAGING = YES
-- 
2.13.5

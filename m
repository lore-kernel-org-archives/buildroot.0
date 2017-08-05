From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Aug 2017 11:36:24 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/mcelog: bump version to 153
Message-ID: <20170805093624.19546-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream:
https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/commit/?id=524ed1cd16de5adcb4a5015777d3dfc63afda1fe

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...memutil.h-add-missing-include-for-va_list.patch | 31 ----------------------
 package/mcelog/mcelog.hash                         |  2 +-
 package/mcelog/mcelog.mk                           |  2 +-
 3 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 package/mcelog/0001-memutil.h-add-missing-include-for-va_list.patch

diff --git a/package/mcelog/0001-memutil.h-add-missing-include-for-va_list.patch b/package/mcelog/0001-memutil.h-add-missing-include-for-va_list.patch
deleted file mode 100644
index f9e08be18..000000000
--- a/package/mcelog/0001-memutil.h-add-missing-include-for-va_list.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 36aad32283eae5b47a05e3adfa3f5f6a7b1b55c0 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 11 Jun 2017 10:02:39 +0200
-Subject: [PATCH] memutil.h: add missing include for va_list
-
-Fixes compile error with uclibc-ng:
-
-In file included from mcelog.c:51:0:
-memutil.h:4:48: error: unknown type name 'va_list'
- int xvasprintf(char **ret, const char *format, va_list ap);
-
-Patch sent upstream: https://github.com/andikleen/mcelog/pull/54
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- memutil.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/memutil.h b/memutil.h
-index 81028e9..dbed7fa 100644
---- a/memutil.h
-+++ b/memutil.h
-@@ -1,4 +1,5 @@
- #include <stdlib.h>
-+#include <stdarg.h>
- 
- int xasprintf(char **strp, const char *fmt, ...);
- int xvasprintf(char **ret, const char *format, va_list ap);
--- 
-2.11.0
-
diff --git a/package/mcelog/mcelog.hash b/package/mcelog/mcelog.hash
index f1c0cd54c..1a9dd602d 100644
--- a/package/mcelog/mcelog.hash
+++ b/package/mcelog/mcelog.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 825644a6cfd9b149e848d91d322724f2fb48f3a98441a25d9d38a5dbe02fe1ef  mcelog-v152.tar.gz
+sha256 d8f3dde21b2e0d76740f374385817c11b3fd69b095a186a6dd12c7b0ba0cca8f  mcelog-v153.tar.gz
diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index d12fc44f7..dca6a18c2 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MCELOG_VERSION = v152
+MCELOG_VERSION = v153
 MCELOG_SITE = $(BR2_KERNEL_MIRROR)/scm/utils/cpu/mce/mcelog.git
 MCELOG_SITE_METHOD = git
 MCELOG_LICENSE = GPL-2.0
-- 
2.11.0

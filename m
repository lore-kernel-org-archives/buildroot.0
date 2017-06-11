From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 10:07:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/mcelog: bump version to 152,
	add hash
Message-ID: <20170611080717.17072-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...memutil.h-add-missing-include-for-va_list.patch | 31 ++++++++++++++++++++++
 package/mcelog/mcelog.hash                         |  2 ++
 package/mcelog/mcelog.mk                           |  2 +-
 3 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 package/mcelog/0001-memutil.h-add-missing-include-for-va_list.patch
 create mode 100644 package/mcelog/mcelog.hash

diff --git a/package/mcelog/0001-memutil.h-add-missing-include-for-va_list.patch b/package/mcelog/0001-memutil.h-add-missing-include-for-va_list.patch
new file mode 100644
index 000000000..f9e08be18
--- /dev/null
+++ b/package/mcelog/0001-memutil.h-add-missing-include-for-va_list.patch
@@ -0,0 +1,31 @@
+From 36aad32283eae5b47a05e3adfa3f5f6a7b1b55c0 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 11 Jun 2017 10:02:39 +0200
+Subject: [PATCH] memutil.h: add missing include for va_list
+
+Fixes compile error with uclibc-ng:
+
+In file included from mcelog.c:51:0:
+memutil.h:4:48: error: unknown type name 'va_list'
+ int xvasprintf(char **ret, const char *format, va_list ap);
+
+Patch sent upstream: https://github.com/andikleen/mcelog/pull/54
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ memutil.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/memutil.h b/memutil.h
+index 81028e9..dbed7fa 100644
+--- a/memutil.h
++++ b/memutil.h
+@@ -1,4 +1,5 @@
+ #include <stdlib.h>
++#include <stdarg.h>
+ 
+ int xasprintf(char **strp, const char *fmt, ...);
+ int xvasprintf(char **ret, const char *format, va_list ap);
+-- 
+2.11.0
+
diff --git a/package/mcelog/mcelog.hash b/package/mcelog/mcelog.hash
new file mode 100644
index 000000000..f1c0cd54c
--- /dev/null
+++ b/package/mcelog/mcelog.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 825644a6cfd9b149e848d91d322724f2fb48f3a98441a25d9d38a5dbe02fe1ef  mcelog-v152.tar.gz
diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index bea31b916..695261302 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MCELOG_VERSION = v111
+MCELOG_VERSION = v152
 MCELOG_SITE = $(BR2_KERNEL_MIRROR)/scm/utils/cpu/mce/mcelog.git
 MCELOG_SITE_METHOD = git
 MCELOG_LICENSE = GPL-2.0
-- 
2.11.0

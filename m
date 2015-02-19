From: Dale Ghent <daleg@omniti.com>
Date: Thu, 19 Feb 2015 16:27:56 +0000
Subject: [Buildroot] [PATCH 1/1] ktap: bump version
In-Reply-To: <1424363276-14325-1-git-send-email-daleg@omniti.com>
References: <1424363276-14325-1-git-send-email-daleg@omniti.com>
Message-ID: <1424363276-14325-2-git-send-email-daleg@omniti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dale Ghent <daleg@omniti.com>
---
 .../ktap/0001-Add-missing-stdarg.h-include.patch   | 47 ----------------------
 package/ktap/ktap.mk                               |  2 +-
 2 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 package/ktap/0001-Add-missing-stdarg.h-include.patch

diff --git a/package/ktap/0001-Add-missing-stdarg.h-include.patch b/package/ktap/0001-Add-missing-stdarg.h-include.patch
deleted file mode 100644
index 9c4566f..0000000
--- a/package/ktap/0001-Add-missing-stdarg.h-include.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From dc135d8f1f2a843cebd4da0d4b17828911e162a6 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 1 Nov 2014 18:53:47 +0100
-Subject: [PATCH] Add missing <stdarg.h> include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-
-In file included from userspace/kp_bcwrite.c:32:0:
-userspace/kp_util.h:74:14: error: unknown type name ?va_list?
-   ErrMsg em, va_list argp);
-              ^
-userspace/kp_util.h:76:42: error: unknown type name ?va_list?
- const char *kp_sprintfv(const char *fmt, va_list argp);
-                                          ^
-In file included from userspace/kp_lex.c:28:0:
-userspace/kp_util.h:74:14: error: unknown type name ?va_list?
-   ErrMsg em, va_list argp);
-              ^
-userspace/kp_util.h:76:42: error: unknown type name ?va_list?
- const char *kp_sprintfv(const char *fmt, va_list argp);
-
-Submitted upstream: https://github.com/ktap/ktap/pull/77
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- userspace/kp_util.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/userspace/kp_util.h b/userspace/kp_util.h
-index af0b221..5778dc4 100644
---- a/userspace/kp_util.h
-+++ b/userspace/kp_util.h
-@@ -1,6 +1,8 @@
- #ifndef __KTAP_UTIL_H__
- #define __KTAP_UTIL_H__
- 
-+#include <stdarg.h>
-+
- #include "../include/ktap_bc.h"
- #include "../include/ktap_err.h"
- 
--- 
-2.0.0
-
diff --git a/package/ktap/ktap.mk b/package/ktap/ktap.mk
index 50ad222..4a0e51c 100644
--- a/package/ktap/ktap.mk
+++ b/package/ktap/ktap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KTAP_VERSION = 5b16b61deb6c8a99d71e5167706a5f5566135828
+KTAP_VERSION = eb66d40310c93dc82bc8eac889744c1ed1f01f7b
 KTAP_SITE = $(call github,ktap,ktap,$(KTAP_VERSION))
 KTAP_LICENSE = GPLv2
 KTAP_LICENSE_FILES = LICENSE-GPL
-- 
1.9.1

From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 24 Aug 2008 05:40:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/procps
Message-ID: <20080824124036.73E683C675@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-24 05:40:36 -0700 (Sun, 24 Aug 2008)
New Revision: 23195

Log:
procps: bump version

Closes #4284.

Removed:
   trunk/buildroot/package/procps/procps-mips-define-pagesize.patch

Modified:
   trunk/buildroot/package/procps/procps.mk


Changeset:
Deleted: trunk/buildroot/package/procps/procps-mips-define-pagesize.patch
===================================================================
--- trunk/buildroot/package/procps/procps-mips-define-pagesize.patch	2008-08-24 12:40:32 UTC (rev 23194)
+++ trunk/buildroot/package/procps/procps-mips-define-pagesize.patch	2008-08-24 12:40:36 UTC (rev 23195)
@@ -1,29 +0,0 @@
-diff -Naurp procps-3.2.3.orig/minimal.c procps-3.2.3/minimal.c
---- procps-3.2.3.orig/minimal.c	2004-05-04 20:26:14.000000000 -0400
-+++ procps-3.2.3/minimal.c	2004-08-20 02:01:35.868100752 -0400
-@@ -68,8 +68,8 @@
- ///////////////////////////////////////////////////////////
- 
- #ifndef PAGE_SIZE
--#warning PAGE_SIZE not defined, assuming it is 4096
--#define PAGE_SIZE 4096
-+#warning PAGE_SIZE not defined, using sysconf() to determine correct value
-+#define PAGE_SIZE (sysconf(_SC_PAGESIZE))
- #endif
- 
- 
-diff -Naurp procps-3.2.3.orig/ps/common.h procps-3.2.3/ps/common.h
---- procps-3.2.3.orig/ps/common.h	2004-04-25 17:03:18.000000000 -0400
-+++ procps-3.2.3/ps/common.h	2004-08-20 02:00:59.228670792 -0400
-@@ -16,6 +16,11 @@
- #include "../proc/readproc.h"
- #include <asm/page.h>  /* looks safe for glibc, we need PAGE_SIZE */
- 
-+#ifndef PAGE_SIZE
-+#warning PAGE_SIZE not defined, using sysconf() to determine correct value
-+#define PAGE_SIZE (sysconf(_SC_PAGESIZE))
-+#endif
-+
- #if 0
- #define trace(args...) printf(## args)
- #else

Modified: trunk/buildroot/package/procps/procps.mk
===================================================================
--- trunk/buildroot/package/procps/procps.mk	2008-08-24 12:40:32 UTC (rev 23194)
+++ trunk/buildroot/package/procps/procps.mk	2008-08-24 12:40:36 UTC (rev 23195)
@@ -3,7 +3,7 @@
 # procps
 #
 #############################################################
-PROCPS_VERSION:=3.2.5
+PROCPS_VERSION:=3.2.7
 PROCPS_SOURCE:=procps-$(PROCPS_VERSION).tar.gz
 PROCPS_SITE:=http://procps.sourceforge.net/
 PROCPS_DIR:=$(BUILD_DIR)/procps-$(PROCPS_VERSION)

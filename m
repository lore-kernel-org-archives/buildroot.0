From: hamish at uclibc.org <hamish@uclibc.org>
Date: Mon, 25 Aug 2008 17:41:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd/mtd-utils.git
Message-ID: <20080826004129.EE31A3C685@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-08-25 17:41:29 -0700 (Mon, 25 Aug 2008)
New Revision: 23201

Log:
Update to work with recent lzo changes


Removed:
   trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-llzo.patch
   trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-lzo-header.patch


Changeset:
Deleted: trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-llzo.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-llzo.patch	2008-08-25 22:03:41 UTC (rev 23200)
+++ trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-llzo.patch	2008-08-26 00:41:29 UTC (rev 23201)
@@ -1,10 +0,0 @@
-diff -urN mtd-utils-1.1.0-0rig/Makefile mtd-utils-1.1.0/Makefile
---- mtd-utils-1.1.0-0rig/Makefile	2007-08-03 15:55:51.000000000 +0200
-+++ mtd-utils-1.1.0/Makefile	2007-09-27 08:20:55.000000000 +0200
-@@ -63,7 +63,7 @@
- 			$(BUILDDIR)/compr_lzo.o \
-			$(BUILDDIR)/compr.o \
-			$(BUILDDIR)/rbtree.o
--	$(CC) $(LDFLAGS) -o $@ $^ -lz -llzo2
-+	$(CC) $(LDFLAGS) -o $@ $^ -lz -llzo
- 

Deleted: trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-lzo-header.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-lzo-header.patch	2008-08-25 22:03:41 UTC (rev 23200)
+++ trunk/buildroot/package/mtd/mtd-utils.git/mtd-utils-target-lzo-header.patch	2008-08-26 00:41:29 UTC (rev 23201)
@@ -1,14 +0,0 @@
-diff -urN mtd-utils-1.1.0-0rig/compr_lzo.c mtd-utils-1.1.0/compr_lzo.c
---- mtd-utils-1.1.0-0rig/compr_lzo.c	2007-08-03 15:55:51.000000000 +0200
-+++ mtd-utils-1.1.0/compr_lzo.c	2007-09-27 08:18:05.000000000 +0200
-@@ -26,7 +26,7 @@
- #include <string.h>
- #include <asm/types.h>
- #include <linux/jffs2.h>
--#include <lzo/lzo1x.h>
-+#include <lzo1x.h>
- #include "compr.h"
- 
- extern int page_size;
- $(BUILDDIR)/flash_eraseall: $(BUILDDIR)/crc32.o $(BUILDDIR)/flash_eraseall.o
- 	$(CC) $(LDFLAGS) -o $@ $^

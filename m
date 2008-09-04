From: hamish at uclibc.org <hamish@uclibc.org>
Date: Wed,  3 Sep 2008 18:39:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd/mtd-utils
Message-ID: <20080904013941.329723C731@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-09-03 18:39:40 -0700 (Wed, 03 Sep 2008)
New Revision: 23315

Log:
Remove lzo patches which aren't required with latest liblzo package updates


Removed:
   trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-llzo.patch
   trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-lzo-header.patch


Changeset:
Deleted: trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-llzo.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-llzo.patch	2008-09-04 01:35:34 UTC (rev 23314)
+++ trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-llzo.patch	2008-09-04 01:39:40 UTC (rev 23315)
@@ -1,10 +0,0 @@
-diff -urN mtd-utils-1.1.0-0rig/Makefile mtd-utils-1.1.0/Makefile
---- mtd-utils-1.1.0-0rig/Makefile	2007-08-03 15:55:51.000000000 +0200
-+++ mtd-utils-1.1.0/Makefile	2007-09-27 08:20:55.000000000 +0200
-@@ -58,7 +58,7 @@
- 			$(BUILDDIR)/compr_zlib.o \
- 			$(BUILDDIR)/compr_lzo.o \
- 			$(BUILDDIR)/compr.o
--	$(CC) $(LDFLAGS) -o $@ $^ -lz -llzo2
-+	$(CC) $(LDFLAGS) -o $@ $^ -lz -llzo
- 

Deleted: trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-lzo-header.patch
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-lzo-header.patch	2008-09-04 01:35:34 UTC (rev 23314)
+++ trunk/buildroot/package/mtd/mtd-utils/mtd-utils-1.1.0-target-lzo-header.patch	2008-09-04 01:39:40 UTC (rev 23315)
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

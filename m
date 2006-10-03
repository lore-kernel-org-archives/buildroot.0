From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue,  3 Oct 2006 07:11:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd
Message-ID: <20061003141112.A22F248582@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-10-03 07:11:12 -0700 (Tue, 03 Oct 2006)
New Revision: 16297

Log:
- use the HOSTCC for building host-tools.


Modified:
   trunk/buildroot/package/mtd/mtd.mk


Changeset:
Modified: trunk/buildroot/package/mtd/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/mtd.mk	2006-10-03 13:42:42 UTC (rev 16296)
+++ trunk/buildroot/package/mtd/mtd.mk	2006-10-03 14:11:12 UTC (rev 16297)
@@ -57,7 +57,7 @@
 endif
 
 $(MTD_HOST_DIR)/util/mkfs.jffs2: $(MTD_HOST_DIR)/.unpacked
-	CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
+	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
 		$(MAKE) LINUXDIR=$(LINUX_DIR) -C $(MTD_HOST_DIR)/util mkfs.jffs2
 
 mtd-host: $(MKFS_JFFS2)

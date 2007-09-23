From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 23 Sep 2007 07:26:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd/20061007
Message-ID: <20070923142620.72BBA3009F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-23 07:26:19 -0700 (Sun, 23 Sep 2007)
New Revision: 19974

Log:
Late mtd does not support linux-2.4

Modified:
   trunk/buildroot/package/mtd/20061007/mtd.mk


Changeset:
Modified: trunk/buildroot/package/mtd/20061007/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/20061007/mtd.mk	2007-09-23 14:24:13 UTC (rev 19973)
+++ trunk/buildroot/package/mtd/20061007/mtd.mk	2007-09-23 14:26:19 UTC (rev 19974)
@@ -85,7 +85,7 @@
 $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
 	mkdir -p $(TARGET_DIR)/usr/sbin
 	$(MAKE) CFLAGS="-I. -I./include -I$(LINUX_HEADERS_DIR)/include -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
-		CROSS= CC=$(TARGET_CC) LINUXDIR=$(LINUX_DIR) WITHOUT_XATTR=1 -C $(MTD_DIR)
+		CROSS= CC=$(TARGET_CC) LINUXDIR=$(LINUX26_DIR) WITHOUT_XATTR=1 -C $(MTD_DIR)
 
 MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
 

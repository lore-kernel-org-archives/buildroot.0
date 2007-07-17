From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Mon, 16 Jul 2007 17:23:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd
Message-ID: <20070717002347.298AC3008E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-16 17:23:46 -0700 (Mon, 16 Jul 2007)
New Revision: 19121

Log:
We need LDFLAGS here.


Modified:
   trunk/buildroot/package/mtd/mtd.mk


Changeset:
Modified: trunk/buildroot/package/mtd/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/mtd.mk	2007-07-17 00:23:31 UTC (rev 19120)
+++ trunk/buildroot/package/mtd/mtd.mk	2007-07-17 00:23:46 UTC (rev 19121)
@@ -118,6 +118,7 @@
 	$(MAKE)	$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS+="-I$(MTD_DIR)/include" \
 		CFLAGS+="-I$(LINUX_HEADERS_DIR)/include" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		LINUXDIR=$(LINUX_DIR) -C $(MTD_DIR)/util
 
 MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))

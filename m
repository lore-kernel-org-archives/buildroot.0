From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  9 Feb 2007 06:18:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd
Message-ID: <20070209141838.8D8EB48620@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-09 06:18:37 -0800 (Fri, 09 Feb 2007)
New Revision: 17839

Log:
- swap order of include paths. Closes #1205 and #1182


Modified:
   trunk/buildroot/package/mtd/mtd.mk


Changeset:
Modified: trunk/buildroot/package/mtd/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/mtd.mk	2007-02-09 14:05:51 UTC (rev 17838)
+++ trunk/buildroot/package/mtd/mtd.mk	2007-02-09 14:18:37 UTC (rev 17839)
@@ -116,7 +116,7 @@
 MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/util/, $(MTD_TARGETS_y))
 
 $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
-	$(MAKE)	CC=$(TARGET_CC) CFLAGS="-I$(LINUX_HEADERS_DIR)/include -I$(MTD_DIR)/include $(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" LINUXDIR=$(LINUX_DIR) -C $(MTD_DIR)/util
+	$(MAKE)	CC=$(TARGET_CC) CFLAGS="-I$(MTD_DIR)/include -I$(LINUX_HEADERS_DIR)/include $(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" LINUXDIR=$(LINUX_DIR) -C $(MTD_DIR)/util
 
 MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
 

From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  6 Jan 2009 21:42:43 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20090106214244.0870976CB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-06 21:42:43 +0000 (Tue, 06 Jan 2009)
New Revision: 24712

Log:
Add PATH to linux build options to allow 'mkimage' to be found. Neccessary for arm,blackfin,sh and avr32 in linux-2.6.28

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-06 21:24:42 UTC (rev 24711)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-06 21:42:43 UTC (rev 24712)
@@ -190,7 +190,8 @@
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE=$(KERNEL_CROSS) \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
-	LZMA="$(LZMA)"
+	LZMA="$(LZMA)" \
+	PATH=$(STAGING_DIR)/usr/bin:$(PATH)
 
 # =============================================================================
 # ifneq ($(strip $(LINUX26_VERSION)),$(strip $(LINUX_HEADERS_VERSION)))

From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 29 Jan 2009 11:27:21 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20090129112722.25B327741D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-29 11:27:20 +0000 (Thu, 29 Jan 2009)
New Revision: 25118

Log:
busybox: remove unused handling of ancient versions no longer in BR

Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2009-01-29 10:13:02 UTC (rev 25117)
+++ trunk/buildroot/package/busybox/busybox.mk	2009-01-29 11:27:20 UTC (rev 25118)
@@ -46,14 +46,6 @@
 	cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_DIR)/.config
 	$(SED) s,^CONFIG_PREFIX=.*,CONFIG_PREFIX=\"$(TARGET_DIR)\", \
 		$(BUSYBOX_DIR)/.config
-ifeq ($(BR2_BUSYBOX_VERSION_1_0_1),y)
-	$(SED) "s,^CROSS.*,CROSS=$(TARGET_CROSS)\n\PREFIX=$(TARGET_DIR),;" \
-		$(BUSYBOX_DIR)/Rules.mak
-endif
-ifeq ($(BR2_BUSYBOX_VERSION_1_1_3),y)
-	$(SED) s,^PREFIX=.*,CONFIG_PREFIX=\"$(TARGET_DIR)\", \
-		$(BUSYBOX_DIR)/.config
-endif
 ifeq ($(BR2_BUSYBOX_VERSION_1_2_2_1),y)
 	$(SED) s,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX=\"$(TARGET_CROSS)\", \
 		$(BUSYBOX_DIR)/.config

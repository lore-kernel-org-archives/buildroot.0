From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 23 Feb 2007 03:55:27 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070223115527.B61BE485EE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-02-23 03:55:27 -0800 (Fri, 23 Feb 2007)
New Revision: 17962

Log:
Set CONFIG_PREFIX for all versions

Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-02-23 01:05:52 UTC (rev 17961)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-02-23 11:55:27 UTC (rev 17962)
@@ -63,13 +63,13 @@
 
 $(BUSYBOX_DIR)/.configured: $(BUSYBOX_DIR)/.unpacked $(BUSYBOX_CONFIG_FILE)
 	cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_DIR)/.config
+	$(SED) s,^CONFIG_PREFIX=.*,CONFIG_PREFIX=\"$(TARGET_DIR)\", \
+		$(BUSYBOX_DIR)/.config ;
 ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_0_1)),y)
 	$(SED) "s,^CROSS.*,CROSS=$(TARGET_CROSS)\n\PREFIX=$(TARGET_DIR),;" \
 		$(BUSYBOX_DIR)/Rules.mak ;
 endif
 ifeq ($(strip $(BR2_BUSYBOX_VERSION_1_1_3)),y)
-	$(SED) s,^CONFIG_PREFIX=.*,CONFIG_PREFIX=\"$(TARGET_DIR)\", \
-		$(BUSYBOX_DIR)/.config ;
 	$(SED) s,^PREFIX=.*,CONFIG_PREFIX=\"$(TARGET_DIR)\", \
 		$(BUSYBOX_DIR)/.config ;
 endif
@@ -79,14 +79,7 @@
 	$(SED) s,^PREFIX=.*,CROSS_COMPILER_PREFIX=\"$(TARGET_CROSS)\", \
 		$(BUSYBOX_DIR)/.config ;
 endif
-# either 1.4.0 or 1.4.1
-ifneq ($(strip $(BR2_BUSYBOX_VERSION_1_4_0))$(strip $(BR2_BUSYBOX_VERSION_1_4_1)),)
-	$(SED) s,^PREFIX=.*,CONFIG_PREFIX=\"$(TARGET_DIR)\", \
-		$(BUSYBOX_DIR)/.config ;
-endif
 ifeq ($(strip $(BR2_PACKAGE_BUSYBOX_SNAPSHOT)),y)
-	$(SED) s,^CONFIG_PREFIX=.*,CONFIG_PREFIX=\"$(TARGET_DIR)\", \
-		$(BUSYBOX_DIR)/.config ;
 	$(SED) s,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX=\"$(TARGET_CROSS)\", \
 		$(BUSYBOX_DIR)/.config ;
 	$(SED) s,^PREFIX=.*,CROSS_COMPILER_PREFIX=\"$(TARGET_CROSS)\", \

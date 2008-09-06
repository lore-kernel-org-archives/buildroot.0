From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  6 Sep 2008 13:49:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/audio/asterisk
Message-ID: <20080906204921.ED98D3C68E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-06 13:49:21 -0700 (Sat, 06 Sep 2008)
New Revision: 23343

Log:
asterisk: fix paths (broken by r23330)

Modified:
   trunk/buildroot/package/audio/asterisk/asterisk.mk


Changeset:
Modified: trunk/buildroot/package/audio/asterisk/asterisk.mk
===================================================================
--- trunk/buildroot/package/audio/asterisk/asterisk.mk	2008-09-06 20:49:18 UTC (rev 23342)
+++ trunk/buildroot/package/audio/asterisk/asterisk.mk	2008-09-06 20:49:21 UTC (rev 23343)
@@ -15,7 +15,7 @@
 
 $(ASTERISK_DIR)/.source: $(DL_DIR)/$(ASTERISK_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(ASTERISK_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(ASTERISK_DIR) package/asterisk/ asterisk\*.patch
+	toolchain/patch-kernel.sh $(ASTERISK_DIR) package/audio/asterisk/ asterisk\*.patch
 	touch $@
 
 $(ASTERISK_DIR)/.configured: $(ASTERISK_DIR)/.source

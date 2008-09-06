From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  6 Sep 2008 13:49:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/audio/madplay
Message-ID: <20080906204937.A45343C6F8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-06 13:49:37 -0700 (Sat, 06 Sep 2008)
New Revision: 23348

Log:
madplay: fix paths (broken by r23330)

Modified:
   trunk/buildroot/package/audio/madplay/madplay.mk


Changeset:
Modified: trunk/buildroot/package/audio/madplay/madplay.mk
===================================================================
--- trunk/buildroot/package/audio/madplay/madplay.mk	2008-09-06 20:49:34 UTC (rev 23347)
+++ trunk/buildroot/package/audio/madplay/madplay.mk	2008-09-06 20:49:37 UTC (rev 23348)
@@ -23,7 +23,7 @@
 
 $(MADPLAY_DIR)/.unpacked: $(DL_DIR)/$(MADPLAY_SOURCE)
 	$(MADPLAY_CAT) $(DL_DIR)/$(MADPLAY_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MADPLAY_DIR) package/madplay madplay\*.patch\*
+	toolchain/patch-kernel.sh $(MADPLAY_DIR) package/audio/madplay madplay\*.patch\*
 	$(CONFIG_UPDATE) $(MADPLAY_DIR)
 	touch $@
 

From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  6 Sep 2008 13:49:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/audio/alsa-lib
Message-ID: <20080906204915.E00E03C66F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-06 13:49:15 -0700 (Sat, 06 Sep 2008)
New Revision: 23341

Log:
alsa-lib: fix paths (broken by r23330)

Modified:
   trunk/buildroot/package/audio/alsa-lib/alsa-lib.mk


Changeset:
Modified: trunk/buildroot/package/audio/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/audio/alsa-lib/alsa-lib.mk	2008-09-06 20:49:12 UTC (rev 23340)
+++ trunk/buildroot/package/audio/alsa-lib/alsa-lib.mk	2008-09-06 20:49:15 UTC (rev 23341)
@@ -26,7 +26,7 @@
 
 $(ALSA_LIB_DIR)/.unpacked: $(DL_DIR)/$(ALSA_LIB_SOURCE)
 	$(ALSA_LIB_CAT) $(DL_DIR)/$(ALSA_LIB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(ALSA_LIB_DIR) package/alsa-lib/ alsa-lib-$(ALSA_LIB_VERSION)\*.patch*
+	toolchain/patch-kernel.sh $(ALSA_LIB_DIR) package/audio/alsa-lib/ alsa-lib-$(ALSA_LIB_VERSION)\*.patch*
 	$(CONFIG_UPDATE) $(ALSA_LIB_DIR)
 	touch $@
 

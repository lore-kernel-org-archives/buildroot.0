From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  6 Sep 2008 13:49:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/audio/alsa-utils
Message-ID: <20080906204918.DD9EE3C679@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-06 13:49:18 -0700 (Sat, 06 Sep 2008)
New Revision: 23342

Log:
alsa-utils: fix paths (broken by r23330)

Modified:
   trunk/buildroot/package/audio/alsa-utils/alsa-utils.mk


Changeset:
Modified: trunk/buildroot/package/audio/alsa-utils/alsa-utils.mk
===================================================================
--- trunk/buildroot/package/audio/alsa-utils/alsa-utils.mk	2008-09-06 20:49:15 UTC (rev 23341)
+++ trunk/buildroot/package/audio/alsa-utils/alsa-utils.mk	2008-09-06 20:49:18 UTC (rev 23342)
@@ -16,7 +16,7 @@
 
 $(ALSA_UTILS_DIR)/.unpacked: $(DL_DIR)/$(ALSA_UTILS_SOURCE)
 	$(ALSA_UTILS_CAT) $(DL_DIR)/$(ALSA_UTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(ALSA_UTILS_DIR) package/alsa-utils/ alsa-utils-$(ALSA_UTILS_VERSION)\*.patch\*
+	toolchain/patch-kernel.sh $(ALSA_UTILS_DIR) package/audio/alsa-utils/ alsa-utils-$(ALSA_UTILS_VERSION)\*.patch\*
 	$(CONFIG_UPDATE) $(ALSA_UTILS_DIR)
 	touch $@
 

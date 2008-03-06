From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:26:11 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sudo
Message-ID: <20080306182611.13B18120250@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:26:10 -0800 (Thu, 06 Mar 2008)
New Revision: 21230

Log:
cleanup sudo makefile

Modified:
   trunk/buildroot/package/sudo/sudo.mk


Changeset:
Modified: trunk/buildroot/package/sudo/sudo.mk
===================================================================
--- trunk/buildroot/package/sudo/sudo.mk	2008-03-06 18:25:46 UTC (rev 21229)
+++ trunk/buildroot/package/sudo/sudo.mk	2008-03-06 18:26:10 UTC (rev 21230)
@@ -19,7 +19,7 @@
 	$(SUDO_UNZIP) $(DL_DIR)/$(SUDO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(SUDO_DIR) package/sudo sudo\*.patch
 	$(CONFIG_UPDATE) $(SUDO_DIR)
-	touch $(SUDO_DIR)/.unpacked
+	touch $@
 
 $(SUDO_DIR)/.configured: $(SUDO_DIR)/.unpacked $(SUDO_CONFIG_FILE)
 	(cd $(SUDO_DIR); rm -rf config.cache; \
@@ -50,11 +50,11 @@
 		$(SUDO_EXTRA_CONFIG) \
 	)
 
-	touch $(SUDO_DIR)/.configured
+	touch $@
 
 $(SUDO_DIR)/sudo: $(SUDO_DIR)/.configured
 	$(MAKE) -C $(SUDO_DIR)
-	touch -c $(SUDO_DIR)/sudo
+	touch -c $@
 
 $(TARGET_DIR)/usr/bin/sudo: $(SUDO_DIR)/sudo
 	$(INSTALL) -m 4555 -D $(SUDO_DIR)/sudo $(TARGET_DIR)/usr/bin/sudo

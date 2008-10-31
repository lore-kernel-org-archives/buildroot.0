From: correa at uclibc.org <correa@uclibc.org>
Date: Thu, 30 Oct 2008 20:55:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pciutils
Message-ID: <20081031035503.D5C713C765@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-10-30 20:55:03 -0700 (Thu, 30 Oct 2008)
New Revision: 23875

Log:
Minor cleanups. Use touch  for stamp-files

Modified:
   trunk/buildroot/package/pciutils/pciutils.mk


Changeset:
Modified: trunk/buildroot/package/pciutils/pciutils.mk
===================================================================
--- trunk/buildroot/package/pciutils/pciutils.mk	2008-10-31 03:04:55 UTC (rev 23874)
+++ trunk/buildroot/package/pciutils/pciutils.mk	2008-10-31 03:55:03 UTC (rev 23875)
@@ -26,13 +26,13 @@
 	$(PCIUTILS_CAT) $(DL_DIR)/$(PCIUTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(PCIIDS_CAT) $(DL_DIR)/$(PCIIDS_SOURCE) > $(PCIUTILS_DIR)/pci.ids
 	toolchain/patch-kernel.sh $(PCIUTILS_DIR) package/pciutils pciutils\*.patch
-	touch $(PCIUTILS_DIR)/.unpacked
+	touch $@
 
 $(PCIUTILS_DIR)/.compiled: $(PCIUTILS_DIR)/.unpacked
 	$(MAKE1) CC=$(TARGET_CC) OPT="$(TARGET_CFLAGS)" -C $(PCIUTILS_DIR) \
 		SHAREDIR="/usr/share/misc" \
 		PREFIX=/usr
-	touch $(PCIUTILS_DIR)/.compiled
+	touch $@
 
 $(TARGET_DIR)/sbin/lspci: $(PCIUTILS_DIR)/.compiled
 	install -c $(PCIUTILS_DIR)/lspci $(TARGET_DIR)/sbin/lspci

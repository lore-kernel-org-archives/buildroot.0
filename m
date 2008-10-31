From: correa at uclibc.org <correa@uclibc.org>
Date: Fri, 31 Oct 2008 05:41:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pciutils
Message-ID: <20081031124103.030FF3C7ED@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-10-31 05:41:02 -0700 (Fri, 31 Oct 2008)
New Revision: 23881

Log:
pciutils may depend on zlib. Based on Bernhard's git repository.

Modified:
   trunk/buildroot/package/pciutils/pciutils.mk


Changeset:
Modified: trunk/buildroot/package/pciutils/pciutils.mk
===================================================================
--- trunk/buildroot/package/pciutils/pciutils.mk	2008-10-31 12:14:39 UTC (rev 23880)
+++ trunk/buildroot/package/pciutils/pciutils.mk	2008-10-31 12:41:02 UTC (rev 23881)
@@ -57,7 +57,7 @@
 $(TARGET_DIR)/usr/share/misc/$(PCIIDS_FILE): $(PCIUTILS_DIR)/.unpacked
 	$(INSTALL) -D $(PCIUTILS_DIR)/$(PCIIDS_FILE) $(@D)
 
-pciutils: uclibc $(TARGET_DIR)/sbin/setpci $(TARGET_DIR)/sbin/lspci $(TARGET_DIR)/usr/share/misc/$(PCIIDS_FILE)
+pciutils: uclibc $(if $(BR2_PACKAGE_ZLIB),zlib) $(TARGET_DIR)/sbin/setpci $(TARGET_DIR)/sbin/lspci $(TARGET_DIR)/usr/share/misc/$(PCIIDS_FILE)
 
 pciutils-source: $(DL_DIR)/$(PCIUTILS_SOURCE) $(DL_DIR)/$(PCIIDS_SOURCE)
 

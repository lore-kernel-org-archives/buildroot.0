From: correa at uclibc.org <correa@uclibc.org>
Date: Thu, 30 Oct 2008 21:03:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pciutils
Message-ID: <20081031040328.19ABB3C784@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-10-30 21:03:27 -0700 (Thu, 30 Oct 2008)
New Revision: 23876

Log:
Fix bug #0005884 - pciutils depends on zlib

Modified:
   trunk/buildroot/package/pciutils/Config.in
   trunk/buildroot/package/pciutils/pciutils.mk


Changeset:
Modified: trunk/buildroot/package/pciutils/Config.in
===================================================================
--- trunk/buildroot/package/pciutils/Config.in	2008-10-31 03:55:03 UTC (rev 23875)
+++ trunk/buildroot/package/pciutils/Config.in	2008-10-31 04:03:27 UTC (rev 23876)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PCIUTILS
 	bool "pciutils"
+	depends on BR2_PACKAGE_ZLIB
 	help
 	  Various utilities dealing with the PCI bus.
 	  Provides things like setpci and lspci.

Modified: trunk/buildroot/package/pciutils/pciutils.mk
===================================================================
--- trunk/buildroot/package/pciutils/pciutils.mk	2008-10-31 03:55:03 UTC (rev 23875)
+++ trunk/buildroot/package/pciutils/pciutils.mk	2008-10-31 04:03:27 UTC (rev 23876)
@@ -43,7 +43,7 @@
 $(TARGET_DIR)/usr/share/misc/pci.ids: $(PCIUTILS_DIR)/.unpacked
 	install -Dc $(PCIUTILS_DIR)/pci.ids $(TARGET_DIR)/usr/share/misc/pci.ids
 
-pciutils: uclibc $(TARGET_DIR)/sbin/setpci $(TARGET_DIR)/sbin/lspci $(TARGET_DIR)/usr/share/misc/pci.ids
+pciutils: uclibc zlib $(TARGET_DIR)/sbin/setpci $(TARGET_DIR)/sbin/lspci $(TARGET_DIR)/usr/share/misc/pci.ids
 
 pciutils-clean:
 	rm $(TARGET_DIR)/sbin/lspci $(TARGET_DIR)/sbin/setpci $(TARGET_DIR)/usr/share/misc/pci.ids

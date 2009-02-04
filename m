From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  4 Feb 2009 23:15:52 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090204231552.571B776273@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-04 23:15:51 +0000 (Wed, 04 Feb 2009)
New Revision: 25240

Log:
u-boot: fix dependency for host mkimage

Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-02-04 23:15:48 UTC (rev 25239)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-02-04 23:15:51 UTC (rev 25240)
@@ -186,7 +186,7 @@
 	cp -dpf $(U_BOOT_DIR)/$(U_BOOT_BIN) $(BINARIES_DIR)/$(U_BOOT_TARGET_BIN)
 	(cd $(BINARIES_DIR); ln -s $(U_BOOT_TARGET_BIN) $(U_BOOT_BIN))
 
-$(U_BOOT_TOOLS):	$(U_BOOT_DIR)/tools/$(U_BOOT_TOOLS_BIN)
+$(U_BOOT_TOOLS): $(U_BOOT_DIR)/$(U_BOOT_BIN)
 	cp -dpf $(U_BOOT_DIR)/tools/$(U_BOOT_TOOLS_BIN) $(STAGING_DIR)/usr/bin/
 
 $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/$(U_BOOT_BIN)

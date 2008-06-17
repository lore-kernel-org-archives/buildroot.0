From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 17 Jun 2008 01:04:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20080617080415.94F9A3C723@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-17 01:04:15 -0700 (Tue, 17 Jun 2008)
New Revision: 22394

Log:
u-boot tools: make sure destination directory exists


Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2008-06-17 07:52:43 UTC (rev 22393)
+++ trunk/buildroot/target/u-boot/Makefile.in	2008-06-17 08:04:15 UTC (rev 22394)
@@ -124,11 +124,13 @@
 	cp -dpf $(U_BOOT_DIR)/tools/$(U_BOOT_TOOLS_BIN) $(STAGING_DIR)/usr/bin/
 
 $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/$(U_BOOT_BIN)
+	mkdir -p $(@D)
 	$(TARGET_CC) -I$(U_BOOT_DIR)/include -DUSE_HOSTCC -o $@ \
 		$(U_BOOT_DIR)/tools/mkimage.c $(U_BOOT_DIR)/tools/crc32.c
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
 $(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/$(U_BOOT_BIN)
+	mkdir -p $(@D)
 	$(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(LINUX_HEADERS_DIR)/include \
 		-DUSE_HOSTCC -o $@ \
 		$(U_BOOT_DIR)/tools/env/*.c $(U_BOOT_DIR)/tools/crc32.c

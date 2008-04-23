From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 23 Apr 2008 07:52:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20080423145236.263C63C74F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-23 07:52:35 -0700 (Wed, 23 Apr 2008)
New Revision: 21810

Log:
u-boot: don't error on existing symlink


Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2008-04-23 13:03:53 UTC (rev 21809)
+++ trunk/buildroot/target/u-boot/Makefile.in	2008-04-23 14:52:35 UTC (rev 21810)
@@ -132,7 +132,7 @@
 		-DUSE_HOSTCC -o $@ \
 		$(U_BOOT_DIR)/tools/env/*.c $(U_BOOT_DIR)/tools/crc32.c
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
-	ln -s fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
+	ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
 
 u-boot: gcc $(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_TARGET_TOOLS)
 

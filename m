From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 13 Jun 2008 06:46:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20080613134643.3DDB93C83D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-13 06:46:42 -0700 (Fri, 13 Jun 2008)
New Revision: 22323

Log:
u-boot: don't depend on gcc (not needed and not provided by ext toolchain)


Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2008-06-13 13:31:41 UTC (rev 22322)
+++ trunk/buildroot/target/u-boot/Makefile.in	2008-06-13 13:46:42 UTC (rev 22323)
@@ -135,7 +135,7 @@
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 	ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
 
-u-boot: gcc $(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_TARGET_TOOLS)
+u-boot: $(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_TARGET_TOOLS)
 
 u-boot-clean:
 	-$(MAKE) -C $(U_BOOT_DIR) clean

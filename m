From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  5 Jan 2009 16:16:33 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090105161633.713A177404@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-05 16:16:30 +0000 (Mon, 05 Jan 2009)
New Revision: 24694

Log:
u-boot: unbreak build after r24674

Disable broken autoscript handling so the build atleast completes

Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-01-05 16:12:34 UTC (rev 24693)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-01-05 16:16:30 UTC (rev 24694)
@@ -199,7 +199,7 @@
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 	ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
 
-u-boot: $(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_TOOLS) $(U_BOOT_TARGET_TOOLS) u-boot-autoscript
+u-boot: $(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_TOOLS) $(U_BOOT_TARGET_TOOLS)
 
 u-boot-autoscript: $(U_BOOT_AUTOSCRIPT).$(PROJECT)
 

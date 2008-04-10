From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 10 Apr 2008 14:02:12 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/DataFlashBoot
Message-ID: <20080410210212.DF78C3C5B0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-04-10 14:02:12 -0700 (Thu, 10 Apr 2008)
New Revision: 21694

Log:
Avoid hardwiring tftpboot

Modified:
   trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk	2008-04-10 20:39:07 UTC (rev 21693)
+++ trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk	2008-04-10 21:02:12 UTC (rev 21694)
@@ -34,7 +34,7 @@
 	mkdir -p $(BINARIES_DIR)
 	cp $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY)	$(BINARIES_DIR)/$(BOARD_NAME)-$(DATAFLASHBOOT_BINARY)
 ifneq	($(TARGET_ATMEL_COPYTO),)
-	cp $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY)	/tftpboot/$(BOARD_NAME)-$(DATAFLASHBOOT_BINARY)
+	cp $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY)	$(TARGET_ATMEL_COPYTO)/$(BOARD_NAME)-$(DATAFLASHBOOT_BINARY)
 endif
 
 #############################################################

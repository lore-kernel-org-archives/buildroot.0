From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Fri,  3 Oct 2008 00:24:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20081003072435.23341F8006@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-10-03 00:24:34 -0700 (Fri, 03 Oct 2008)
New Revision: 23580

Log:
linux: fix copy of Busybox config to target directory

This patch fixes bug report #5204. The Busybox config was not copied from the
correct place.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-10-02 15:02:38 UTC (rev 23579)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-10-03 07:24:34 UTC (rev 23580)
@@ -428,7 +428,7 @@
 
 $(TARGET_DIR)/boot/busybox.config: $(BUSYBOX_DIR)/.config
 	mkdir -p $(TARGET_DIR)/boot
-	cp -dpf .config $(TARGET_DIR)/boot/busybox.config
+	cp -dpf $(BUSYBOX_DIR)/.config $(TARGET_DIR)/boot/busybox.config
 
 /tftpboot/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
 	-mkdir -p /tftpboot

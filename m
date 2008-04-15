From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 15 Apr 2008 10:10:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080415171026.A45293C435@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-04-15 10:10:24 -0700 (Tue, 15 Apr 2008)
New Revision: 21739

Log:
Reversing bad tftpboot patch resulting in two identical targets

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-04-15 08:27:24 UTC (rev 21738)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-04-15 17:10:24 UTC (rev 21739)
@@ -230,7 +230,7 @@
 endif
 
 ifeq ($(BR2_LINUX_COPYTO_TFTPBOOT),y)
-LINUX26_TARGETS+=$(BR2_LINUX_COPYTO)/$(LINUX26_KERNEL_NAME)
+LINUX26_TARGETS+=/tftpboot/$(LINUX26_KERNEL_NAME)
 endif
 
 ifneq ($(strip $(subst ",,$(BR2_LINUX_COPYTO))),)
@@ -437,9 +437,9 @@
 	mkdir -p $(TARGET_DIR)/boot
 	cp -dpf .config $(TARGET_DIR)/boot/busybox.config
 
-$(BR2_LINUX_COPYTO)/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
-	mkdir -p $(BR2_LINUX_COPYTO)
-	cp -dpf $(LINUX26_KERNEL) $(BR2_LINUX_COPYTO)/$(LINUX26_KERNEL_NAME)
+/tftpboot/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
+	mkdir -p /tftpboot
+	cp -dpf $(LINUX26_KERNEL) /tftpboot/$(LINUX26_KERNEL_NAME)
 
 $(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
 	mkdir -p $(LINUX_COPYTO)

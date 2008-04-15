From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 15 Apr 2008 14:46:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080415214647.D2C693C53C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-04-15 14:46:47 -0700 (Tue, 15 Apr 2008)
New Revision: 21740

Log:
Allow build to complete, even if tftpboot is not writeable by user

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-04-15 17:10:24 UTC (rev 21739)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-04-15 21:46:47 UTC (rev 21740)
@@ -438,8 +438,8 @@
 	cp -dpf .config $(TARGET_DIR)/boot/busybox.config
 
 /tftpboot/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
-	mkdir -p /tftpboot
-	cp -dpf $(LINUX26_KERNEL) /tftpboot/$(LINUX26_KERNEL_NAME)
+	-mkdir -p /tftpboot
+	-cp -dpf $(LINUX26_KERNEL) /tftpboot/$(LINUX26_KERNEL_NAME)
 
 $(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
 	mkdir -p $(LINUX_COPYTO)

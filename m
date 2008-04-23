From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 23 Apr 2008 06:03:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20080423130347.A46833C738@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-23 06:03:47 -0700 (Wed, 23 Apr 2008)
New Revision: 21807

Log:
u-boot: clean: also remove mkimage from staging_dir


Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2008-04-23 10:30:03 UTC (rev 21806)
+++ trunk/buildroot/target/u-boot/Makefile.in	2008-04-23 13:03:47 UTC (rev 21807)
@@ -117,6 +117,7 @@
 
 u-boot-clean:
 	-$(MAKE) -C $(U_BOOT_DIR) clean
+	rm -f $(STAGING_DIR)/usr/bin/$(U_BOOT_TOOLS_BIN)
 
 u-boot-dirclean:
 	rm -rf $(U_BOOT_DIR)

From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Mon, 10 Nov 2008 02:45:47 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20081110104547.16BEB3C7BC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2008-11-10 02:45:46 -0800 (Mon, 10 Nov 2008)
New Revision: 23987

Log:
Download Kernel.org minor patches at the same time as full sources.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>



Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-11-10 09:51:15 UTC (rev 23986)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-11-10 10:45:46 UTC (rev 23987)
@@ -205,7 +205,7 @@
 	 $(WGET) -P $(DL_DIR) $(LINUX26_PATCH_SITE)/$(LINUX26_PATCH_SOURCE)
 endif
 
-$(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
+$(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE) $(DL_DIR)/$(LINUX26_PATCH_SOURCE)
 	rm -rf $(LINUX26_DIR)
 	@echo "*** Unpacking kernel source"
 	$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -

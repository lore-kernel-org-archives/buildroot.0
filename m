From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Mon, 10 Nov 2008 03:17:21 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20081110111721.5CA1E3C871@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2008-11-10 03:17:21 -0800 (Mon, 10 Nov 2008)
New Revision: 23989

Log:
revert 23987 until proper implementation

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-11-10 10:47:47 UTC (rev 23988)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-11-10 11:17:21 UTC (rev 23989)
@@ -205,7 +205,7 @@
 	 $(WGET) -P $(DL_DIR) $(LINUX26_PATCH_SITE)/$(LINUX26_PATCH_SOURCE)
 endif
 
-$(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE) $(DL_DIR)/$(LINUX26_PATCH_SOURCE)
+$(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
 	rm -rf $(LINUX26_DIR)
 	@echo "*** Unpacking kernel source"
 	$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -

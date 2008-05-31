From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 31 May 2008 00:27:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080531072748.877603C8B7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-05-31 00:27:47 -0700 (Sat, 31 May 2008)
New Revision: 22133

Log:
distclean: Don't delete $(IMAGE)

There is not much point in deleting $(IMAGE) as the entire binaries dir
is removed. Furthermore, $(IMAGE) is a prefix rather than a file name.


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-05-31 07:27:43 UTC (rev 22132)
+++ trunk/buildroot/Makefile	2008-05-31 07:27:47 UTC (rev 22133)
@@ -362,7 +362,7 @@
 	rm -rf $(DL_DIR)
 endif
 	rm -rf $(BUILD_DIR) $(PROJECT_BUILD_DIR) $(BINARIES_DIR) \
-	$(LINUX_KERNEL) $(IMAGE) $(BASE_DIR)/include \
+	$(LINUX_KERNEL) $(BASE_DIR)/include \
 		.config.cmd
 	$(MAKE) -C $(CONFIG) clean
 

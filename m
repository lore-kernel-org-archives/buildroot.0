From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Jun 2008 08:46:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20080618154649.BB6FB3C6C1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-18 08:46:48 -0700 (Wed, 18 Jun 2008)
New Revision: 22430

Log:
toolchain/gcc: use $(@D)


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2008-06-18 15:45:00 UTC (rev 22429)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2008-06-18 15:46:48 UTC (rev 22430)
@@ -152,7 +152,7 @@
 	mkdir -p $(TOOL_BUILD_DIR)
 	rm -rf $(GCC_DIR)
 	$(GCC_CAT) $(DL_DIR)/$(GCC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(GCC_DIR)
+	$(CONFIG_UPDATE) $(@D)
 	touch $@
 
 gcc-patched: $(GCC_DIR)/.patched

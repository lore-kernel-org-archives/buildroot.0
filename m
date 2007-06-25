From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 00:52:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070625075243.B94C3A45B4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 00:52:41 -0700 (Mon, 25 Jun 2007)
New Revision: 18908

Log:
- adjust patches of the gcc-clean target


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-06-24 17:23:54 UTC (rev 18907)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-06-25 07:52:41 UTC (rev 18908)
@@ -249,7 +249,7 @@
 	fi
 	# Strip the host binaries
 ifeq ($(GCC_STRIP_HOST_BINARIES),true)
-	-strip --strip-all -R .note -R .comment $(STAGING_DIR)/bin/*
+	-strip --strip-all -R .note -R .comment $(STAGING_DIR)/usr/bin/*
 endif
 	# Make sure we have 'cc'.
 	if [ ! -e $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc ] ; then \
@@ -320,8 +320,8 @@
 gcc-clean:
 	rm -rf $(GCC_BUILD_DIR2)
 	for prog in cpp gcc gcc-[0-9]* protoize unprotoize gcov gccbug cc; do \
-	    rm -f $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-$$prog \
-	    rm -f $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-$$prog; \
+	    rm -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-$$prog \
+	    rm -f $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-$$prog; \
 	done
 
 gcc-dirclean: gcc_initial-dirclean

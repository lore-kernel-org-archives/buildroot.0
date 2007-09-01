From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  1 Sep 2007 10:11:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070901171125.6BC4FA65C4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-01 10:11:24 -0700 (Sat, 01 Sep 2007)
New Revision: 19750

Log:
- don't try to strip the gccbug script


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-01 17:10:55 UTC (rev 19749)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-01 17:11:24 UTC (rev 19750)
@@ -291,7 +291,7 @@
 		$(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-gccbug
 	# Strip the host binaries
 ifeq ($(GCC_STRIP_HOST_BINARIES),true)
-	-strip --strip-all -R .note -R .comment $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*
+	strip --strip-all -R .note -R .comment $(filter-out -gccbug,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
 	-strip --strip-all -R .note -R .comment $(STAGING_DIR)/usr/bin/faked
 endif
 	# Make sure we have 'cc'.

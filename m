From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 02:22:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20070822092233.31F74A6110@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 02:22:32 -0700 (Wed, 22 Aug 2007)
New Revision: 19635

Log:
- drop circular dependency


Modified:
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2007-08-22 09:22:07 UTC (rev 19634)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2007-08-22 09:22:32 UTC (rev 19635)
@@ -125,7 +125,7 @@
 	#	tooldir=/usr build_tooldir=/usr install
 	#rm -f $(STAGING_DIR)/usr/bin/{ar,as,ld,nm,objdump,ranlib,strip}
 
-binutils: dependencies uclibc-configured $(BINUTILS_HOST_PREREQ) $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ld
+binutils: uclibc-configured $(BINUTILS_HOST_PREREQ) $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ld
 
 binutils-source: $(DL_DIR)/$(BINUTILS_SOURCE)
 

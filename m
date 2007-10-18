From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 18 Oct 2007 04:58:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20071018115848.6CF79A6830@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-18 04:58:47 -0700 (Thu, 18 Oct 2007)
New Revision: 20284

Log:
Fix syntax error in Makefile for Advanced Linux configuration

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2007-10-18 11:11:12 UTC (rev 20283)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2007-10-18 11:58:47 UTC (rev 20284)
@@ -252,7 +252,7 @@
 ifeq ($(BR2_KERNEL_HEADERS_PATCH_DIR),y)
 	if [ -d $(KERNEL_HEADERS_PATCH_DIR) ] ; then \
 	toolchain/patch-kernel.sh $(LINUX26_DIR) $(KERNEL_HEADERS_PATCH_DIR) \
-		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2} \
+		linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2} ; \
 	fi
 endif
 ifeq ($(BR2_PACKAGE_OPENSWAN),y)

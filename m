From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 20 Dec 2008 22:34:33 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20081220223433.C42D176CEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-12-20 22:34:33 +0000 (Sat, 20 Dec 2008)
New Revision: 24475

Log:
Revert patch, sent by mistake

Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2008-12-20 22:31:02 UTC (rev 24474)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2008-12-20 22:34:33 UTC (rev 24475)
@@ -77,8 +77,6 @@
 	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) package/openswan \
 		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
 endif
-	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers/arch/$(ARCH)/linux-$(LINUX_HEADERS_VERSION) \
-		linux-\*.patch{,.gz,.bz2}
 	touch $@
 
 $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched

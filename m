From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 19 Aug 2007 23:24:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20070820062428.0916FA45E7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-19 23:24:28 -0700 (Sun, 19 Aug 2007)
New Revision: 19587

Log:
Ensure ipmi conditional patch is applied

Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-08-20 06:23:00 UTC (rev 19586)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-08-20 06:24:28 UTC (rev 19587)
@@ -60,6 +60,10 @@
 $(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked
 	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers \
 		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
+ifeq ($(BR2_KERNEL_HEADERS_IPMI),y)
+	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers/ipmi \
+		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
+endif
 ifeq ($(BR2_KERNEL_HEADERS_LZMA),y)
 	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers/lzma \
 		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}

From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu,  2 Oct 2008 07:24:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20081002142445.56AEF3C2BE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-10-02 07:24:45 -0700 (Thu, 02 Oct 2008)
New Revision: 23577

Log:
kernel-headers: remove whitespace damage



Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2008-10-02 14:15:05 UTC (rev 23576)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2008-10-02 14:24:45 UTC (rev 23577)
@@ -48,7 +48,7 @@
 	$(WGET) -P $(DL_DIR) $(LINUX_RT_SITE)/$(LINUX_RT_SOURCE)
 endif
 
-$(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)  
+$(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
 	@echo "*** Using kernel-headers generated from kernel source"
 	rm -rf $(LINUX_HEADERS_DIR)
 	[ -d $(TOOL_BUILD_DIR) ] || $(INSTALL) -d $(TOOL_BUILD_DIR)
@@ -82,7 +82,7 @@
 $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
 	(cd $(LINUX_HEADERS_UNPACK_DIR); \
 	 $(MAKE) ARCH=$(KERNEL_ARCH) \
-	 	HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
+		HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
 		HOSTCXX="$(HOSTCXX)" \
 		INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) headers_install; \
 	)

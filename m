From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  4 Feb 2007 08:11:52 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20070204161152.14CE14864D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-04 08:11:51 -0800 (Sun, 04 Feb 2007)
New Revision: 17761

Log:
- touch $@


Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-02-04 16:09:04 UTC (rev 17760)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-02-04 16:11:51 UTC (rev 17761)
@@ -24,18 +24,18 @@
 $(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
 	rm -rf $(LINUX_HEADERS_DIR)
 	$(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(LINUX_HEADERS_UNPACK_DIR)/.unpacked
+	touch $@
 
 $(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked
 	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers \
 		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
-	touch $(LINUX_HEADERS_UNPACK_DIR)/.patched
+	touch $@
 
 $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
 	(cd $(LINUX_HEADERS_UNPACK_DIR) ; \
 	 $(MAKE) ARCH=$(KERNEL_ARCH) CC="$(HOSTCC)" \
 		INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) headers_install ; \
 	)
-	touch $(LINUX_HEADERS_DIR)/.configured
+	touch $@
 
 endif

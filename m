From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 02:20:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20070822092033.06C7EA5D27@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 02:20:33 -0700 (Wed, 22 Aug 2007)
New Revision: 19633

Log:
- use the correct host compiler


Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-08-22 07:53:18 UTC (rev 19632)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-08-22 09:20:33 UTC (rev 19633)
@@ -82,9 +82,11 @@
 	touch $@
 
 $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
-	(cd $(LINUX_HEADERS_UNPACK_DIR) ; \
-	 $(MAKE) ARCH=$(KERNEL_ARCH) CC="$(HOSTCC)" \
-		INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) headers_install ; \
+	(cd $(LINUX_HEADERS_UNPACK_DIR); \
+	 $(MAKE) ARCH=$(KERNEL_ARCH) \
+	 	HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
+		HOSTCXX="$(HOSTCXX)" \
+		INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) headers_install; \
 	)
 	touch $@
 

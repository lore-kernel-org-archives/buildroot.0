From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 13 Dec 2006 10:24:49 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20061213182449.811284857C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-13 10:24:48 -0800 (Wed, 13 Dec 2006)
New Revision: 16901

Log:
- pass the correct CC down to gcc-version.sh


Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2006-12-13 17:44:24 UTC (rev 16900)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2006-12-13 18:24:48 UTC (rev 16901)
@@ -34,7 +34,9 @@
 
 $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
 	(cd $(LINUX_HEADERS_UNPACK_DIR) ; \
-	 $(MAKE) ARCH=$(KERNEL_ARCH) INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) headers_install)
+	 $(MAKE) ARCH=$(KERNEL_ARCH) CC="$(HOSTCC)" \
+		INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) headers_install ; \
+	)
 	touch $(LINUX_HEADERS_DIR)/.configured
 
 endif

From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 21 Mar 2007 03:55:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20070321105531.41D3148090@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-21 03:55:31 -0700 (Wed, 21 Mar 2007)
New Revision: 18195

Log:
- apply openswan patches if openswan was enabled


Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-03-21 10:55:02 UTC (rev 18194)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-03-21 10:55:31 UTC (rev 18195)
@@ -30,6 +30,10 @@
 $(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked
 	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers \
 		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
+ifeq ($(BR2_PACKAGE_OPENSWAN),y)
+	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) package/openswan \
+		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
+endif
 	touch $@
 
 $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched

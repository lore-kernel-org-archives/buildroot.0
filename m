From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 29 Aug 2007 11:05:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070829180546.EC22FA470E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-29 11:05:46 -0700 (Wed, 29 Aug 2007)
New Revision: 19733

Log:
- uclibc-configured has to depend on kernel-headers


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-29 15:54:33 UTC (rev 19732)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-29 18:05:46 UTC (rev 19733)
@@ -313,7 +313,7 @@
 		oldconfig
 	touch $@
 
-$(UCLIBC_DIR)/.configured: $(UCLIBC_DIR)/.config
+$(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured $(UCLIBC_DIR)/.config
 	set -x && $(MAKE1) -C $(UCLIBC_DIR) \
 		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \

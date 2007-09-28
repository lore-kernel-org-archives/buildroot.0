From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 28 Sep 2007 15:16:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070928221647.B7A80300B3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-28 15:16:47 -0700 (Fri, 28 Sep 2007)
New Revision: 20106

Log:
Removed uclibc source dependency on host-sed

Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-28 22:15:19 UTC (rev 20105)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-28 22:16:47 UTC (rev 20106)
@@ -108,7 +108,7 @@
 UCLIBC_LOCALE_DATA=
 endif
 
-$(UCLIBC_DIR)/.unpacked: host-sed $(DL_DIR)/$(UCLIBC_SOURCE) $(UCLIBC_LOCALE_DATA)
+$(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE) $(UCLIBC_LOCALE_DATA)
 	mkdir -p $(TOOL_BUILD_DIR)
 	rm -rf $(UCLIBC_DIR)
 	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -

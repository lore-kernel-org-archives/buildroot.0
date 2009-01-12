From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 12 Jan 2009 15:01:29 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20090112150130.260B6766E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-12 15:01:28 +0000 (Mon, 12 Jan 2009)
New Revision: 24797

Log:
toolchain/uclibc: fix sparc SED handling of _V9 / _V9B

Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2009-01-12 14:36:14 UTC (rev 24796)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2009-01-12 15:01:28 UTC (rev 24797)
@@ -262,7 +262,7 @@
 		 $(UCLIBC_DIR)/.oldconfig
 	for i in V7 V8 V9 V9B; do echo "# CONFIG_SPARC_$$i is not set"; done \
 		>> $(UCLIBC_DIR)/.oldconfig
-	$(SED) 's/^.*$(UCLIBC_SPARC_TYPE).*/$(UCLIBC_SPARC_TYPE)=y/g' $(UCLIBC_DIR)/.oldconfig
+	$(SED) 's/^.*$(UCLIBC_SPARC_TYPE)[^B].*/$(UCLIBC_SPARC_TYPE)=y/g' $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(UCLIBC_TARGET_ARCH),powerpc)
 ifeq ($(BR2_powerpc_8540),y)

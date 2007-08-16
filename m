From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 15 Aug 2007 22:01:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070816050144.5E855A45B7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-15 22:01:43 -0700 (Wed, 15 Aug 2007)
New Revision: 19522

Log:
Use SED instead of ECHO when config 'program_invocation_name'

Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-15 22:35:26 UTC (rev 19521)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-16 05:01:43 UTC (rev 19522)
@@ -230,9 +230,9 @@
 	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=n,g' $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_UCLIBC_PROGRAM_INVOCATION),y)
-	echo "UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y" >> $(UCLIBC_DIR)/.oldconfig
+	$(SED) 's,^.*UCLIBC_HAS_PROGRAM_INVOCATION_NAME.*,UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y,g' $(UCLIBC_DIR)/.oldconfig
 else
-	echo "# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set" >> $(UCLIBC_DIR)/.oldconfig
+	$(SED) 's,^.*UCLIBC_HAS_PROGRAM_INVOCATION_NAME.*,UCLIBC_HAS_PROGRAM_INVOCATION_NAME=n,g' $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ("$(KERNEL_ARCH)","i386")
 	/bin/echo "# CONFIG_GENERIC_386 is not set" >> $(UCLIBC_DIR)/.oldconfig

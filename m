From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Tue,  7 Oct 2008 00:32:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20081007073241.348C1F8008@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-10-07 00:32:40 -0700 (Tue, 07 Oct 2008)
New Revision: 23615

Log:
uclibc: fix path to ARCH_CFLAGS when compiling the test suite

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-10-07 07:24:41 UTC (rev 23614)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-10-07 07:32:40 UTC (rev 23615)
@@ -585,7 +585,7 @@
 
 $(UCLIBC_DIR)/test/unistd/errno:
 	$(MAKE) -C $(UCLIBC_DIR)/test \
-	ARCH_CFLAGS=-I$(STAGING_DIR)/include \
+	ARCH_CFLAGS=-I$(STAGING_DIR)/usr/include \
 	UCLIBC_ONLY=1 TEST_INSTALLED_UCLIBC=1 compile
 
 $(TARGET_DIR)/root/uClibc/test/unistd/errno: $(UCLIBC_DIR)/test/unistd/errno

From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 27 Sep 2007 14:51:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070927215121.08F68A4682@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-27 14:51:21 -0700 (Thu, 27 Sep 2007)
New Revision: 20074

Log:
- fix ARM ABI propagation


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-27 21:32:50 UTC (rev 20073)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-27 21:51:21 UTC (rev 20074)
@@ -139,6 +139,7 @@
 	$(SED) 's/^\(CONFIG_[^_]*[_]*ARM[^=]*\)=.*/# \1 is not set/g' \
 		 $(UCLIBC_DIR)/.oldconfig
 	$(SED) 's/^.*$(UCLIBC_ARM_TYPE).*/$(UCLIBC_ARM_TYPE)=y/g' $(UCLIBC_DIR)/.oldconfig
+	$(SED) '/CONFIG_ARM_.ABI/d' $(UCLIBC_DIR)/.oldconfig
 ifeq ($(BR2_ARM_EABI),y)
 	/bin/echo "# CONFIG_ARM_OABI is not set" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "CONFIG_ARM_EABI=y" >> $(UCLIBC_DIR)/.oldconfig

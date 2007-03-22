From: andersen at uclibc.org <andersen@uclibc.org>
Date: Thu, 22 Mar 2007 09:23:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070322162343.C275448097@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-03-22 09:23:43 -0700 (Thu, 22 Mar 2007)
New Revision: 18203

Log:
install hostutils (i.e. 'ldd' and 'ldconfig') into $STAGING_DIR


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-03-22 16:14:42 UTC (rev 18202)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-03-22 16:23:43 UTC (rev 18203)
@@ -285,6 +285,12 @@
 		PREFIX=$(STAGING_DIR) \
 		HOSTCC="$(HOSTCC)" \
 		hostutils
+	install -c $(UCLIBC_DIR)/utils/ldd.host $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/ldd
+	(cd $(STAGING_DIR)/bin; ln -s ../$(REAL_GNU_TARGET_NAME)/bin/ldd $(GNU_TARGET_NAME)-ldd)
+	(cd $(STAGING_DIR)/bin; ln -s ../$(REAL_GNU_TARGET_NAME)/bin/ldd $(REAL_GNU_TARGET_NAME)-ldd)
+	install -c $(UCLIBC_DIR)/utils/ldconfig.host $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/ldconfig
+	(cd $(STAGING_DIR)/bin; ln -s ../$(REAL_GNU_TARGET_NAME)/bin/ldconfig $(GNU_TARGET_NAME)-ldconfig)
+	(cd $(STAGING_DIR)/bin; ln -s ../$(REAL_GNU_TARGET_NAME)/bin/ldconfig $(REAL_GNU_TARGET_NAME)-ldconfig)
 	touch -c $(STAGING_DIR)/lib/libc.a
 
 ifneq ($(TARGET_DIR),)

From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 13 Dec 2006 05:07:48 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20061213130748.2EB7848569@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-13 05:07:47 -0800 (Wed, 13 Dec 2006)
New Revision: 16894

Log:
install include/asm-generic if it is present


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-12-13 12:42:45 UTC (rev 16893)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-12-13 13:07:47 UTC (rev 16894)
@@ -178,6 +178,8 @@
 	if [ ! -f $(STAGING_DIR)/include/linux/version.h ] ; then \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/asm $(TOOL_BUILD_DIR)/uClibc_dev/usr/include/ ; \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/linux $(TOOL_BUILD_DIR)/uClibc_dev/usr/include/ ; \
+		[ -d $(LINUX_HEADERS_DIR)/include/asm-generic ] && \
+		cp -pLR $(LINUX_HEADERS_DIR)/include/asm-generic $(TOOL_BUILD_DIR)/uClibc_dev/usr/include/ ; \
 	fi;
 	touch $(UCLIBC_DIR)/.configured
 
@@ -210,6 +212,8 @@
 	if [ ! -f $(STAGING_DIR)/include/linux/version.h ] ; then \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/asm $(STAGING_DIR)/include/ ; \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/linux $(STAGING_DIR)/include/ ; \
+		[ -d $(LINUX_HEADERS_DIR)/include/asm-generic ] && \
+		cp -pLR $(LINUX_HEADERS_DIR)/include/asm-generic $(STAGING_DIR)/include/ ; \
 	fi;
 	# Build the host utils.  Need to add an install target...
 	$(MAKE1) -C $(UCLIBC_DIR)/utils \
@@ -276,6 +280,8 @@
 	if [ ! -f $(TARGET_DIR)/usr/include/linux/version.h ] ; then \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/asm $(TARGET_DIR)/usr/include/ ; \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/linux $(TARGET_DIR)/usr/include/ ; \
+		[ -d $(LINUX_HEADERS_DIR)/include/asm-generic ] && \
+		cp -pLR $(LINUX_HEADERS_DIR)/include/asm-generic $(TARGET_DIR)/usr/include/ ; \
 	fi;
 	touch -c $(TARGET_DIR)/usr/lib/libc.a
 

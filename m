From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Sat, 20 Oct 2007 11:09:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20071020180953.8F2C6A5E1B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-10-20 11:09:53 -0700 (Sat, 20 Oct 2007)
New Revision: 20306

Log:
'make source' command working again for gcc

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-10-20 14:54:58 UTC (rev 20305)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-10-20 18:09:53 UTC (rev 20306)
@@ -127,6 +127,7 @@
 GCC_ENABLE_CLOCALE:=--disable-clocale
 endif
 
+HOST_SOURCE+=gcc-source
 
 #############################################################
 #

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-10-20 14:54:58 UTC (rev 20305)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-10-20 18:09:53 UTC (rev 20306)
@@ -141,6 +141,8 @@
 EXTRA_GCC1_CONFIG_OPTIONS+=--without-headers
 endif
 
+HOST_SOURCE+=gcc-source
+
 $(DL_DIR)/$(GCC_SOURCE):
 	mkdir -p $(DL_DIR)
 	$(WGET) -P $(DL_DIR) $(GCC_SITE)/$(GCC_SOURCE)

From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 29 Jan 2009 19:13:54 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20090129191354.923CE76D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-29 19:13:53 +0000 (Thu, 29 Jan 2009)
New Revision: 25132

Log:
toolchain/gcc: remove unused GCC_ENABLE_CLOCALE

This variable was introduced in r17046 (add gfortran support,
2006-12-22) and wasn't used even there.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2009-01-29 17:52:39 UTC (rev 25131)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2009-01-29 19:13:53 UTC (rev 25132)
@@ -123,10 +123,6 @@
 GCC_SHARED_LIBGCC:=--disable-shared
 endif
 
-ifneq ($(BR2_ENABLE_LOCALE),y)
-GCC_ENABLE_CLOCALE:=--disable-clocale
-endif
-
 HOST_SOURCE+=gcc-source
 
 #############################################################

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-01-29 17:52:39 UTC (rev 25131)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-01-29 19:13:53 UTC (rev 25132)
@@ -133,10 +133,6 @@
 GCC_SHARED_LIBGCC:=--disable-shared
 endif
 
-ifneq ($(BR2_ENABLE_LOCALE),y)
-GCC_ENABLE_CLOCALE:=--disable-clocale
-endif
-
 ifeq ($(BR2_KERNEL_HURD),y)
 EXTRA_GCC1_CONFIG_OPTIONS+=--without-headers
 endif

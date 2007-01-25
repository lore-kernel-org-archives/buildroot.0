From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 24 Jan 2007 16:18:19 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070125001819.CA5F8485FF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-24 16:18:19 -0800 (Wed, 24 Jan 2007)
New Revision: 17516

Log:
- TODO: cleanup BR2_ARCH selection and establish BR2_CPU


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-01-25 00:00:02 UTC (rev 17515)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-01-25 00:18:19 UTC (rev 17516)
@@ -384,9 +384,10 @@
 else
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
 endif
-GCC_WITH_ARCH=--with-arch=$(BR2_ARCH)
-GCC_WITH_TUNE=--with-tune=$(BR2_ARCH)
-GCC_WITH_CPU=--with-cpu=$(BR2_ARCH)
+#XXX: FIXME: cleanup BR2_ARCH selection and establish BR2_CPU
+#GCC_WITH_ARCH=--with-arch=$(BR2_ARCH)
+#GCC_WITH_TUNE=--with-tune=$(BR2_ARCH)
+#GCC_WITH_CPU=--with-cpu=$(BR2_ARCH)
 endif
 
 $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR3)/.compiled

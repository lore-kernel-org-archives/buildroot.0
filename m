From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed,  1 Aug 2007 01:15:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20070801081545.87294A493C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-01 01:15:44 -0700 (Wed, 01 Aug 2007)
New Revision: 19376

Log:
linux-2.6.22.1 headers, makefile part

Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-08-01 08:11:48 UTC (rev 19375)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-08-01 08:15:44 UTC (rev 19376)
@@ -3,6 +3,21 @@
 # full kernel tarballs >= 2.6.19.1
 #
 #############################################################
+ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.22.1")
+VERSION:=2
+PATCHLEVEL:=6
+SUBLEVEL:=22
+EXTRAVERSION:=.1
+LOCALVERSION:=
+LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
+LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
+LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
+LINUX_HEADERS_CAT:=$(BZCAT)
+LINUX_HEADERS_UNPACK_DIR:=$(BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
+LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
+LINUX_HEADERS_IS_KERNEL=y
+endif
+
 ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.21.5")
 VERSION:=2
 PATCHLEVEL:=6

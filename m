From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 10 Jan 2008 01:30:11 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20080110093011.9AA1212C58B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-01-10 01:30:11 -0800 (Thu, 10 Jan 2008)
New Revision: 20839

Log:
Define kernelversion if ext toolchain is used

Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2008-01-10 09:29:06 UTC (rev 20838)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2008-01-10 09:30:11 UTC (rev 20839)
@@ -6,8 +6,14 @@
 # by a 'make clean' so don't put anything sacred in here...
 #
 #############################################################
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+DEFAULT_KERNEL_HEADERS:=$(strip $(subst ",, $(BR2_LINUX26_VERSION)))
+#"))
+else
 DEFAULT_KERNEL_HEADERS:=$(strip $(subst ",, $(BR2_DEFAULT_KERNEL_HEADERS)))
 #"))
+endif
+
 LINUX_HEADERS_SITE:=127.0.0.1
 LINUX_HEADERS_SOURCE:=unspecified-kernel-headers
 LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-null

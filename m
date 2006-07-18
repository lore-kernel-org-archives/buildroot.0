From: andersen@uclibc.org <andersen@uclibc.org>
Date: Tue Jul 18 17:06:07 2006
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20060719000606.9E3D348B52@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-07-18 17:06:06 -0700 (Tue, 18 Jul 2006)
New Revision: 15724

Log:
fix fallback case so dependancies work as expected


Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-07-18 23:54:31 UTC (rev 15723)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-07-19 00:06:06 UTC (rev 15724)
@@ -8,12 +8,9 @@
 #############################################################
 DEFAULT_KERNEL_HEADERS:=$(strip $(subst ",, $(BR2_DEFAULT_KERNEL_HEADERS)))
 #"
-
-ifneq ($(filter $(TARGETS),kernel-headers),)
-DEFAULT_KERNEL_HEADERS:=$(strip $(DEFAULT_KERNEL_HEADERS))
-
 LINUX_HEADERS_SITE:=127.0.0.1
 LINUX_HEADERS_SOURCE:=unspecified-kernel-headers
+LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-null
 
 ifeq ("$(strip $(DEFAULT_KERNEL_HEADERS))","2.4.25")
 VERSION:=2
@@ -180,4 +177,3 @@
 kernel-headers-dirclean:
 	rm -rf $(LINUX_HEADERS_DIR)
 
-endif

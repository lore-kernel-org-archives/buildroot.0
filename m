From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Nov 2007 06:54:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20071126145416.60507300A6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-11-26 06:54:15 -0800 (Mon, 26 Nov 2007)
New Revision: 20544

Log:
Fix for old-style kernels (broken by r20018). Check old-style versions before
including kernel-headers-new.makefile.


Added:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-old-versions.makefile

Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-old.makefile
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk


Changeset:
Copied: trunk/buildroot/toolchain/kernel-headers/kernel-headers-old-versions.makefile (from rev 20543, trunk/buildroot/toolchain/kernel-headers/kernel-headers-old.makefile)
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-old-versions.makefile	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-old-versions.makefile	2007-11-26 14:54:15 UTC (rev 20544)
@@ -0,0 +1,103 @@
+#############################################################
+#
+# Setup the kernel headers. I include a generic package of
+# kernel headers here, so you shouldn't need to include your
+# own. Be aware these kernel headers _will_ get blown away
+# by a 'make clean' so don't put anything sacred in here...
+#
+#############################################################
+ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.4.25")
+VERSION:=2
+PATCHLEVEL:=4
+SUBLEVEL:=25
+LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
+LINUX_HEADERS_SITE:=http://www.uclibc.org/downloads/toolchain
+LINUX_HEADERS_SOURCE:=linux-libc-headers-2.4.25.tar.bz2
+LINUX_HEADERS_CAT:=$(BZCAT)
+LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
+LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.4.25
+endif
+
+ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.4.27")
+VERSION:=2
+PATCHLEVEL:=4
+SUBLEVEL:=27
+LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
+LINUX_HEADERS_SITE:=http://www.uclibc.org/downloads/toolchain
+LINUX_HEADERS_CAT:=$(BZCAT)
+LINUX_HEADERS_SOURCE:=linux-libc-headers-2.4.27.tar.bz2
+LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
+LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.4.27
+endif
+
+ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.4.29")
+VERSION:=2
+PATCHLEVEL:=4
+SUBLEVEL:=29
+LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
+LINUX_HEADERS_SITE:=http://www.uclibc.org/downloads/toolchain
+LINUX_HEADERS_SOURCE:=linux-libc-headers-2.4.29.tar.bz2
+LINUX_HEADERS_CAT:=$(BZCAT)
+LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
+LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.4.29
+endif
+
+ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.4.31")
+VERSION:=2
+PATCHLEVEL:=4
+SUBLEVEL:=31
+LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
+LINUX_HEADERS_SITE:=http://www.uclibc.org/downloads/toolchain
+LINUX_HEADERS_SOURCE:=linux-libc-headers-2.4.31.tar.bz2
+LINUX_HEADERS_CAT:=$(BZCAT)
+LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
+LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.4.31
+endif
+
+ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.9")
+VERSION:=2
+PATCHLEVEL:=6
+SUBLEVEL:=9
+LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
+LINUX_HEADERS_SITE:=http://ep09.pld-linux.org/~mmazur/linux-libc-headers/
+LINUX_HEADERS_SOURCE:=linux-libc-headers-2.6.9.1.tar.bz2
+LINUX_HEADERS_CAT:=$(BZCAT)
+LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
+LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.6.9.1
+endif
+
+ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.10")
+VERSION:=2
+PATCHLEVEL:=6
+SUBLEVEL:=10
+LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
+LINUX_HEADERS_SITE:=http://ep09.pld-linux.org/~mmazur/linux-libc-headers/
+LINUX_HEADERS_SOURCE:=linux-libc-headers-2.6.10.0.tar.bz2
+LINUX_HEADERS_CAT:=$(BZCAT)
+LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
+LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.6.10.0
+endif
+
+ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.11")
+VERSION:=2
+PATCHLEVEL:=6
+SUBLEVEL:=11
+LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
+LINUX_HEADERS_SITE:=http://ep09.pld-linux.org/~mmazur/linux-libc-headers/
+LINUX_HEADERS_SOURCE:=linux-libc-headers-2.6.11.0.tar.bz2
+LINUX_HEADERS_CAT:=$(BZCAT)
+LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
+LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.6.11.0
+endif
+
+ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.12")
+VERSION:=2
+PATCHLEVEL:=6
+SUBLEVEL:=12
+LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
+LINUX_HEADERS_SITE:=http://ep09.pld-linux.org/~mmazur/linux-libc-headers/
+LINUX_HEADERS_SOURCE:=linux-libc-headers-2.6.12.0.tar.bz2
+LINUX_HEADERS_CAT:=$(BZCAT)
+LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
+LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.6.12.0
+endif

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-old.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-old.makefile	2007-11-26 13:02:21 UTC (rev 20543)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-old.makefile	2007-11-26 14:54:15 UTC (rev 20544)
@@ -6,103 +6,7 @@
 # by a 'make clean' so don't put anything sacred in here...
 #
 #############################################################
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.4.25")
-VERSION:=2
-PATCHLEVEL:=4
-SUBLEVEL:=25
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://www.uclibc.org/downloads/toolchain
-LINUX_HEADERS_SOURCE:=linux-libc-headers-2.4.25.tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.4.25
-endif
 
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.4.27")
-VERSION:=2
-PATCHLEVEL:=4
-SUBLEVEL:=27
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://www.uclibc.org/downloads/toolchain
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_SOURCE:=linux-libc-headers-2.4.27.tar.bz2
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.4.27
-endif
-
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.4.29")
-VERSION:=2
-PATCHLEVEL:=4
-SUBLEVEL:=29
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://www.uclibc.org/downloads/toolchain
-LINUX_HEADERS_SOURCE:=linux-libc-headers-2.4.29.tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.4.29
-endif
-
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.4.31")
-VERSION:=2
-PATCHLEVEL:=4
-SUBLEVEL:=31
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://www.uclibc.org/downloads/toolchain
-LINUX_HEADERS_SOURCE:=linux-libc-headers-2.4.31.tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.4.31
-endif
-
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.9")
-VERSION:=2
-PATCHLEVEL:=6
-SUBLEVEL:=9
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://ep09.pld-linux.org/~mmazur/linux-libc-headers/
-LINUX_HEADERS_SOURCE:=linux-libc-headers-2.6.9.1.tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.6.9.1
-endif
-
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.10")
-VERSION:=2
-PATCHLEVEL:=6
-SUBLEVEL:=10
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://ep09.pld-linux.org/~mmazur/linux-libc-headers/
-LINUX_HEADERS_SOURCE:=linux-libc-headers-2.6.10.0.tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.6.10.0
-endif
-
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.11")
-VERSION:=2
-PATCHLEVEL:=6
-SUBLEVEL:=11
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://ep09.pld-linux.org/~mmazur/linux-libc-headers/
-LINUX_HEADERS_SOURCE:=linux-libc-headers-2.6.11.0.tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.6.11.0
-endif
-
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.12")
-VERSION:=2
-PATCHLEVEL:=6
-SUBLEVEL:=12
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://ep09.pld-linux.org/~mmazur/linux-libc-headers/
-LINUX_HEADERS_SOURCE:=linux-libc-headers-2.6.12.0.tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.6.12.0
-endif
-
-
 # the old sanitized kernel-headers
 ifeq ($(LINUX_HEADERS_IS_KERNEL),n)
 

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2007-11-26 13:02:21 UTC (rev 20543)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2007-11-26 14:54:15 UTC (rev 20544)
@@ -24,6 +24,8 @@
 # assume old manually sanitized kernel-headers
 LINUX_HEADERS_IS_KERNEL=n
 
+# this needs to be included before kernel-headers-new to set old-style mode
+include toolchain/kernel-headers/kernel-headers-old-versions.makefile
 include toolchain/kernel-headers/kernel-headers-new.makefile
 include toolchain/kernel-headers/kernel-headers-old.makefile
 

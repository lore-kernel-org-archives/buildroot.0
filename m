From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Tue, 30 Sep 2008 00:29:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20080930072935.D889C3C5FA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-09-30 00:29:35 -0700 (Tue, 30 Sep 2008)
New Revision: 23561

Log:
uclibc: install headers after building headers in configure part

This patch will run "make headers install_headers" instead of the old "make
headers install_dev". The latter requires a cross compiler available in uClibc
versions > 0.9.29, and the cross compiler is not available at the configuration
time of uClibc.

Spotted and fixed by Bernhard Fischer.

Tested-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-09-30 01:22:25 UTC (rev 23560)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-09-30 07:29:35 UTC (rev 23561)
@@ -434,7 +434,7 @@
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		HOSTCC="$(HOSTCC)" \
-		headers install_dev
+		headers install_headers
 	# Install the kernel headers to the first stage gcc include dir
 	# if necessary
 ifeq ($(LINUX_HEADERS_IS_KERNEL),y)

From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 20 Oct 2008 11:55:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20081020185526.845123C6B6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-20 11:55:26 -0700 (Mon, 20 Oct 2008)
New Revision: 23747

Log:
toolchain/uclibc: brown paper bag fix for r23746

So much for doing one more "obvious" fix before going home -
Sorry everyone.

Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-10-20 15:23:50 UTC (rev 23746)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-10-20 18:55:26 UTC (rev 23747)
@@ -433,12 +433,9 @@
 		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
-		HOSTCC="$(HOSTCC)" \
-ifeq ($(BR2_UCLIBC_VERSION_0_9_28_3),y)
-		headers install_dev
-else
-		headers install_headers
-endif
+		HOSTCC="$(HOSTCC)" headers \
+		$(if $(BR2_UCLIBC_VERSION_0_9_28_3),install_dev,install_headers)
+
 	# Install the kernel headers to the first stage gcc include dir
 	# if necessary
 ifeq ($(LINUX_HEADERS_IS_KERNEL),y)

From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 17 Jun 2008 06:30:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20080617133035.AC6F63C786@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-17 06:30:35 -0700 (Tue, 17 Jun 2008)
New Revision: 22401

Log:
toolchain/uclibc: strip libpthread


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-06-17 13:28:37 UTC (rev 22400)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-06-17 13:30:35 UTC (rev 22401)
@@ -527,6 +527,7 @@
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
 		install_runtime
+	$(STRIPCMD) $(@D)/lib*.so*
 	touch -c $@
 
 $(TARGET_DIR)/usr/bin/ldd: $(cross_compiler)

From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 26 Sep 2007 17:18:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070927001853.9A0DBA6046@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-26 17:18:52 -0700 (Wed, 26 Sep 2007)
New Revision: 20052

Log:
Additional management of uclibc

Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-27 00:15:46 UTC (rev 20051)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-27 00:18:52 UTC (rev 20052)
@@ -445,6 +445,9 @@
 
 uclibc-oldconfig: host-sed $(UCLIBC_DIR)/.oldconfig
 
+uclibc-update:
+	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
+
 uclibc-configured: kernel-headers $(UCLIBC_DIR)/.configured
 
 uclibc-configured-source: uclibc-source

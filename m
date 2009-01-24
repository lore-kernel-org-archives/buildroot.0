From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 24 Jan 2009 06:44:18 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20090124064418.25A12769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-24 06:44:17 +0000 (Sat, 24 Jan 2009)
New Revision: 24997

Log:
toolchain/uClibc: disable UCLIBC_SUPPORT_AI_ADDRCONFIG in 0.9.30 defconfig

UCLIBC_SUPPORT_AI_ADDRCONFIG seems to have issues in 0.9.30 and cause
segfaults on some architectures, so disable it.

Reported and tracked down by "QuickX" <quickx@hotmail.com>.

Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config	2009-01-24 06:44:13 UTC (rev 24996)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.config	2009-01-24 06:44:17 UTC (rev 24997)
@@ -128,7 +128,7 @@
 # UCLIBC_HAS_FULL_RPC is not set
 # UCLIBC_HAS_REENTRANT_RPC is not set
 UCLIBC_USE_NETLINK=y
-UCLIBC_SUPPORT_AI_ADDRCONFIG=y
+# UCLIBC_SUPPORT_AI_ADDRCONFIG is not set
 # UCLIBC_HAS_BSD_RES_CLOSE is not set
 
 #

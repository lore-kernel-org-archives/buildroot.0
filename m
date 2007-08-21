From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 01:05:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070821080543.94D93A4044@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 01:05:40 -0700 (Tue, 21 Aug 2007)
New Revision: 19599

Log:
- SH endian setting (fgretief in bug #1446)


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-21 01:53:57 UTC (rev 19598)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-08-21 08:05:40 UTC (rev 19599)
@@ -73,6 +73,8 @@
 		-e 's/arm/LITTLE/' \
 		-e 's/mipsel/LITTLE/' \
 		-e 's/mips/BIG/' \
+		-e 's/sh[234]eb/BIG/' \
+		-e 's/sh[234]/LITTLE/' \
 ")
 
 ifneq ($(UCLIBC_TARGET_ENDIAN),LITTLE)

From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 10 Jan 2008 01:29:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080110092906.BFE9B12C57C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-01-10 01:29:06 -0800 (Thu, 10 Jan 2008)
New Revision: 20838

Log:
Use host ldconfig, if external toolchain is used

Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2008-01-10 09:27:25 UTC (rev 20837)
+++ trunk/buildroot/package/Makefile.in	2008-01-10 09:29:06 UTC (rev 20838)
@@ -121,7 +121,11 @@
 TARGET_RANLIB=$(TARGET_CROSS)ranlib
 TARGET_OBJCOPY=$(TARGET_CROSS)objcopy
 TARGET_OBJDUMP=$(TARGET_CROSS)objdump
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+TARGET_LDCONFIG=/sbin/ldconfig
+else
 TARGET_LDCONFIG=$(TARGET_CROSS)ldconfig
+endif
 ifeq ($(BR2_STRIP_strip),y)
 STRIP_DISCARD_ALL:=--discard-all
 STRIP_STRIP_UNNEEDED:=--strip-unneeded

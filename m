From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Jan 2009 09:36:36 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts:  test
Message-ID: <20090129093636.297FA7741D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-29 09:36:35 +0000 (Thu, 29 Jan 2009)
New Revision: 25116

Log:
run test with some knowledge of ARCH

Added:
   trunk/buildroot/scripts/test/Makefile

Modified:
   trunk/buildroot/scripts/testheader.inc


Changeset:
Added: trunk/buildroot/scripts/test/Makefile
===================================================================
--- trunk/buildroot/scripts/test/Makefile	                        (rev 0)
+++ trunk/buildroot/scripts/test/Makefile	2009-01-29 09:36:35 UTC (rev 25116)
@@ -0,0 +1,7 @@
+include .config
+
+
+ARCH:	
+	@echo	$(strip $(subst ",,$(BR2_ARCH)))
+#")))
+

Modified: trunk/buildroot/scripts/testheader.inc
===================================================================
--- trunk/buildroot/scripts/testheader.inc	2009-01-29 09:34:11 UTC (rev 25115)
+++ trunk/buildroot/scripts/testheader.inc	2009-01-29 09:36:35 UTC (rev 25116)
@@ -1,3 +1,5 @@
+ARCH=`make -f scripts/test/Makefile ARCH`
+
 function mk()
 {
 	scripts/mkpkg $1 $2 "$3"

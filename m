From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 19 Jun 2007 08:19:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070619151928.B270A485C2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-06-19 08:19:27 -0700 (Tue, 19 Jun 2007)
New Revision: 18856

Log:
Hide troublesome environment variables from sub processes
(E.G. screws up gdb, busybox, ..)


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-06-19 14:43:17 UTC (rev 18855)
+++ trunk/buildroot/Makefile	2007-06-19 15:19:27 UTC (rev 18856)
@@ -46,6 +46,13 @@
 cc-option = $(shell if $(TARGET_CC) $(TARGET_CFLAGS) $(1) -S -o /dev/null -xc /dev/null \
 	> /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
 
+#############################################################
+#
+# Hide troublesome environment variables from sub processes
+#
+#############################################################
+unexport CROSS_COMPILE
+unexport ARCH
 
 #############################################################
 #

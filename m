From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  4 Jul 2008 15:29:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080704222950.E76B63C61F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-04 15:29:50 -0700 (Fri, 04 Jul 2008)
New Revision: 22640

Log:
Add 'build with log'

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-07-04 22:23:20 UTC (rev 22639)
+++ trunk/buildroot/Makefile	2008-07-04 22:29:50 UTC (rev 22640)
@@ -475,6 +475,9 @@
 
 prepatch:	gcc-patched binutils-patched gdb-patched uclibc-patched
 
+log:
+	$(MAKE) > $(PROJECT).log 2>&1 
+
 cross: $(BASE_TARGETS)
 
 help:

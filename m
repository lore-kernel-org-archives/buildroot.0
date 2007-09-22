From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 22 Sep 2007 07:19:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070922141924.6BD20A65EF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-22 07:19:22 -0700 (Sat, 22 Sep 2007)
New Revision: 19938

Log:
- set and export VERBOSE if V= was requested


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-09-22 14:16:25 UTC (rev 19937)
+++ trunk/buildroot/Makefile	2007-09-22 14:19:22 UTC (rev 19938)
@@ -64,6 +64,9 @@
 ifeq ($(KBUILD_VERBOSE),1)
   quiet=
   Q=
+ifndef VERBOSE
+  VERBOSE=1
+endif
 else
   quiet=quiet_
   Q=@
@@ -73,7 +76,7 @@
 	else if [ -x /bin/bash ]; then echo /bin/bash; \
 	else echo sh; fi; fi)
 
-export CONFIG_SHELL quiet Q KBUILD_VERBOSE
+export CONFIG_SHELL quiet Q KBUILD_VERBOSE VERBOSE
 
 ifndef HOSTAR
 HOSTAR:=ar

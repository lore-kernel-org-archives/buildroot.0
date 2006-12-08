From: andersen at uclibc.org <andersen@uclibc.org>
Date: Thu,  7 Dec 2006 21:30:00 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ltp-testsuite
Message-ID: <20061208053000.E70F0485DC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-07 21:30:00 -0800 (Thu, 07 Dec 2006)
New Revision: 16812

Log:
sigh


Added:
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite-sh-is-not-C-code.patch


Changeset:
Added: trunk/buildroot/package/ltp-testsuite/ltp-testsuite-sh-is-not-C-code.patch
===================================================================
--- trunk/buildroot/package/ltp-testsuite/ltp-testsuite-sh-is-not-C-code.patch	2006-12-08 05:24:59 UTC (rev 16811)
+++ trunk/buildroot/package/ltp-testsuite/ltp-testsuite-sh-is-not-C-code.patch	2006-12-08 05:30:00 UTC (rev 16812)
@@ -0,0 +1,11 @@
+--- ltp-full-20061121/IDcheck.sh.orig	2006-12-07 22:31:29.000000000 -0700
++++ ltp-full-20061121/IDcheck.sh	2006-12-07 22:32:58.000000000 -0700
+@@ -85,7 +85,7 @@
+ fi
+ 
+ whoami | grep root > /dev/null
+-if [ $? == "0" ]; then
++if [ $? = "0" ]; then
+  I_AM_ROOT=1
+ fi
+ 

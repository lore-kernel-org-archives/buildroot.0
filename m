From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 28 Jan 2007 09:35:12 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot:  target
Message-ID: <20070128173512.B0099485C4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-28 09:35:11 -0800 (Sun, 28 Jan 2007)
New Revision: 17604

Log:
- make sure to add board specific targets before the final generation of the filesystems/tarballs.
  Until now, we did created the fs and only after that built/installed grub et al


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/target/Makefile.in


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-01-28 16:59:30 UTC (rev 17603)
+++ trunk/buildroot/Makefile	2007-01-28 17:35:11 UTC (rev 17604)
@@ -67,7 +67,6 @@
 # in the .config file.
 include toolchain/*/*.mk
 include package/*/*.mk
-include target/*/*.mk
 
 # target stuff is last so it can override anything else
 include target/Makefile.in

Modified: trunk/buildroot/target/Makefile.in
===================================================================
--- trunk/buildroot/target/Makefile.in	2007-01-28 16:59:30 UTC (rev 17603)
+++ trunk/buildroot/target/Makefile.in	2007-01-28 17:35:11 UTC (rev 17604)
@@ -1,3 +1,4 @@
+# make sure to put everything that is board-specific before the tarroot targets
 include target/generic/Makefile.in
 include target/device/Makefile.in
 include target/x86/Makefile.in
@@ -3,2 +4,4 @@
 include target/arm/Makefile.in
 include target/powerpc/Makefile.in
+# and finally build the filesystems/tarballs
+include target/*/*.mk

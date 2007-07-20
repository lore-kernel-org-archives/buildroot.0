From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 20 Jul 2007 05:03:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20070720120354.B63FEA686C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-20 05:03:54 -0700 (Fri, 20 Jul 2007)
New Revision: 19181

Log:
Fix Linux build if BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG is not defined

Modified:
   trunk/buildroot/target/Makefile.in


Changeset:
Modified: trunk/buildroot/target/Makefile.in
===================================================================
--- trunk/buildroot/target/Makefile.in	2007-07-20 11:36:52 UTC (rev 19180)
+++ trunk/buildroot/target/Makefile.in	2007-07-20 12:03:54 UTC (rev 19181)
@@ -18,12 +18,10 @@
 # We already did add the kernel target to TARGETS and now just pull in the rules
 # to actually build this target.
 
-ifeq	($(strip $(subst ",,$(BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG))),n)
-#"))
-include	target/linux/Makefile.in
-endif
 ifeq	($(strip $(subst ",,$(BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG))),y)
 #"))
 include	target/linux-experimental/Makefile.in
+else
+include	target/linux/Makefile.in
 endif
 

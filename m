From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  5 Oct 2007 04:03:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20071005110307.C3AF3A6083@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-10-05 04:03:07 -0700 (Fri, 05 Oct 2007)
New Revision: 20178

Log:
- comment out apparently unused? cruft (linux-experimental)


Modified:
   trunk/buildroot/target/Makefile.in


Changeset:
Modified: trunk/buildroot/target/Makefile.in
===================================================================
--- trunk/buildroot/target/Makefile.in	2007-10-05 11:02:29 UTC (rev 20177)
+++ trunk/buildroot/target/Makefile.in	2007-10-05 11:03:07 UTC (rev 20178)
@@ -17,11 +17,11 @@
 # We already did add the kernel target to TARGETS and now just pull in the rules
 # to actually build this target.
 
-ifeq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG))),y)
+#ifeq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG))),y)
 #"))
+#include target/linux/Makefile.in
+##include target/linux-experimental/Makefile.in
+#else
 include target/linux/Makefile.in
-#include target/linux-experimental/Makefile.in
-else
-include target/linux/Makefile.in
-endif
+#endif
 

From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 17 Apr 2007 10:30:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20070417173012.CE5A44860A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-04-17 10:30:12 -0700 (Tue, 17 Apr 2007)
New Revision: 18481

Log:
- strip eventual quotes


Modified:
   trunk/buildroot/target/Makefile.in


Changeset:
Modified: trunk/buildroot/target/Makefile.in
===================================================================
--- trunk/buildroot/target/Makefile.in	2007-04-17 17:24:29 UTC (rev 18480)
+++ trunk/buildroot/target/Makefile.in	2007-04-17 17:30:12 UTC (rev 18481)
@@ -1,3 +1,8 @@
+BR2_PACKAGE_LINUX_FORMAT:=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT)))
+#"))
+BR2_PACKAGE_LINUX_KCONFIG:=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_KCONFIG)))
+#"))
+
 # make sure to put everything that is board-specific before the tarroot targets
 include target/generic/Makefile.in
 

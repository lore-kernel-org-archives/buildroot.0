From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 20 Jan 2007 05:06:54 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20070120130654.DD91F48591@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-20 05:06:49 -0800 (Sat, 20 Jan 2007)
New Revision: 17396

Log:
- pass MAKE in so we can check the correct binary for it's version..


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.mk


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.mk
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.mk	2007-01-20 12:57:04 UTC (rev 17395)
+++ trunk/buildroot/toolchain/dependencies/dependencies.mk	2007-01-20 13:06:49 UTC (rev 17396)
@@ -6,7 +6,7 @@
 ######################################################################
 
 dependencies: host-sed
-	@HOSTCC="$(firstword $(HOSTCC))" $(TOPDIR)/toolchain/dependencies/dependencies.sh
+	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" $(TOPDIR)/toolchain/dependencies/dependencies.sh
 
 dependencies-source:
 

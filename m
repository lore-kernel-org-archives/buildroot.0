From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 13 Jan 2009 15:14:22 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20090113151422.3FE9F76850@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-13 15:14:21 +0000 (Tue, 13 Jan 2009)
New Revision: 24815

Log:
buildroot: mark alpha as broken

It still doesn't build with threading + shared libs disabled

Modified:
   trunk/buildroot/target/Config.in.arch


Changeset:
Modified: trunk/buildroot/target/Config.in.arch
===================================================================
--- trunk/buildroot/target/Config.in.arch	2009-01-13 15:09:18 UTC (rev 24814)
+++ trunk/buildroot/target/Config.in.arch	2009-01-13 15:14:21 UTC (rev 24815)
@@ -6,6 +6,7 @@
 
 config BR2_alpha
 	bool "alpha"
+	depends on BROKEN # no threads, shared libs, gcc psignal compile errors
 config BR2_arm
 	bool "arm"
 config BR2_armeb

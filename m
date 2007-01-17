From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 17 Jan 2007 05:05:17 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070117130517.04859485A3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-17 05:05:14 -0800 (Wed, 17 Jan 2007)
New Revision: 17341

Log:
- add ARM_IWMMXT variant since uClibc supports it


Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-01-17 12:31:15 UTC (rev 17340)
+++ trunk/buildroot/Config.in	2007-01-17 13:05:14 UTC (rev 17341)
@@ -74,6 +74,8 @@
 	bool "sa1100"
 config BR2_xscale
 	bool "xscale"
+config BR2_IWMMXT
+	bool "iwmmxt"
 endchoice
 
 config BR2_ARM_TYPE
@@ -88,6 +90,7 @@
 	default ARM_SA110	if BR2_sa110
 	default ARM_SA1100	if BR2_sa1100
 	default ARM_XSCALE	if BR2_xscale
+	default ARM_IWMMXT	if BR2_IWMMXT
 	default GENERIC_ARM	if BR2_generic_arm
 
 choice

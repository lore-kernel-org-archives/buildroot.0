From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 25 Sep 2007 14:49:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain
Message-ID: <20070925214937.C42B3A65B8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-25 14:49:37 -0700 (Tue, 25 Sep 2007)
New Revision: 20027

Log:
- fix copy'n paste error


Modified:
   trunk/buildroot/toolchain/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/Config.in	2007-09-25 21:40:04 UTC (rev 20026)
+++ trunk/buildroot/toolchain/Config.in	2007-09-25 21:49:37 UTC (rev 20027)
@@ -19,7 +19,7 @@
 
 config BR2_TOOLCHAIN_SOURCE
 	bool
-	default y if !BR2_TOOLCHAIN_EXTERNAL
+	default y if BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_EXTERNAL_SOURCE
 	default n if BR2_TOOLCHAIN_EXTERNAL
 
 source "target/device/Toolchain.in"

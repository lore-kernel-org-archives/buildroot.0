From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 22 Sep 2007 07:34:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device toolchain
Message-ID: <20070922143442.72CF6A65E7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-22 07:34:40 -0700 (Sat, 22 Sep 2007)
New Revision: 19939

Log:
- move project settings from toolchain to device


Modified:
   trunk/buildroot/target/device/Config.in
   trunk/buildroot/toolchain/Config.in


Changeset:
Modified: trunk/buildroot/target/device/Config.in
===================================================================
--- trunk/buildroot/target/device/Config.in	2007-09-22 14:19:22 UTC (rev 19938)
+++ trunk/buildroot/target/device/Config.in	2007-09-22 14:34:40 UTC (rev 19939)
@@ -1,5 +1,9 @@
 menu "Board Support Options"
 
+source "project/Config.in"
+
+comment "Preset Devices"
+
 source "target/device/AMD/Config.in"
 source "target/device/Arm/Config.in"
 source "target/device/Atmel/Config.in"

Modified: trunk/buildroot/toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/Config.in	2007-09-22 14:19:22 UTC (rev 19938)
+++ trunk/buildroot/toolchain/Config.in	2007-09-22 14:34:40 UTC (rev 19939)
@@ -18,6 +18,4 @@
 source "toolchain/Config.in.2"
 source "toolchain/external-toolchain/Config.in"
 
-source "project/Config.in"
-
 endmenu

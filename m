From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu,  7 Jun 2007 03:48:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20070607104801.B49CC48027@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-07 03:48:01 -0700 (Thu, 07 Jun 2007)
New Revision: 18765

Log:
- hide atmel target if arch is not arm nor avr32


Modified:
   trunk/buildroot/target/device/Atmel/Config.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Config.in	2007-06-06 21:05:18 UTC (rev 18764)
+++ trunk/buildroot/target/device/Atmel/Config.in	2007-06-07 10:48:01 UTC (rev 18765)
@@ -1,5 +1,9 @@
-menu "Atmel Target"
+menuconfig BR2_TARGET_ATMEL
+	bool "Atmel Target"
+	depends on BR2_arm || BR2_avr32
+	default n
 
+if BR2_TARGET_ATMEL
 comment "Add Atmel Target here"
 
-endmenu
+endif

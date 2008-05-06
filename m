From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon,  5 May 2008 18:37:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	at91bootstrap
Message-ID: <20080506013727.4612B3C67A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-05-05 18:37:26 -0700 (Mon, 05 May 2008)
New Revision: 21935

Log:
Fix dependencies in Configs

Modified:
   trunk/buildroot/target/device/Atmel/AT91_Config.in
   trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/AT91_Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/AT91_Config.in	2008-05-05 17:17:00 UTC (rev 21934)
+++ trunk/buildroot/target/device/Atmel/AT91_Config.in	2008-05-06 01:37:26 UTC (rev 21935)
@@ -12,6 +12,7 @@
 
 config	BR2_TARGET_ATMEL_ALL
 	bool "Allow all ARM targets"
+	depends BR2_arm
 	default y
 
 config	BR2_TARGET_ATMEL_NET

Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in	2008-05-05 17:17:00 UTC (rev 21934)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in	2008-05-06 01:37:26 UTC (rev 21935)
@@ -80,4 +80,5 @@
 	depends on BR2_TARGET_AT91BOOTSTRAP
 
 comment "It will be copied to $(BR2_AT91BOOTSTRAP_JUMP_ADDR)"
+	depends on BR2_TARGET_AT91BOOTSTRAP
 

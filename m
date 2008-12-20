From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 20 Dec 2008 22:23:15 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20081220222315.9048676CEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-12-20 22:23:15 +0000 (Sat, 20 Dec 2008)
New Revision: 24470

Log:
Add support for AT32AP7200

Modified:
   trunk/buildroot/target/device/Atmel/AVR32_Config.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/AVR32_Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/AVR32_Config.in	2008-12-20 22:19:38 UTC (rev 24469)
+++ trunk/buildroot/target/device/Atmel/AVR32_Config.in	2008-12-20 22:23:15 UTC (rev 24470)
@@ -32,6 +32,12 @@
 	help
 	  Atmel AT32AP7002 AVR32 based systems
 
+config BR2_TARGET_AT32AP7200
+	bool "Board support for the Atmel AT32AP7200 Microprocessor"
+	depends on BR2_TARGET_AVR32
+	help
+	  Atmel AT32AP7200 AVR32 based systems
+
 endchoice
 
 comment "Development board support"
@@ -51,6 +57,14 @@
 	help
 	  The Atmel ATSTK1000 AVR32 Development Board.
 
+config BR2_TARGET_AVR32_ATSTK1005
+	bool "Atmel ATSTK1000/5 AVR32 development board support"
+	depends on BR2_TARGET_AT32AP7200
+	select BR2_PACKAGE_LINUX
+	help
+	  The Atmel ATSTK1000 AVR32 Development Board,
+	  with the AT32AP7200 based top board
+
 config BR2_TARGET_AVR32_ATNGW100
 	bool "Atmel AVR32 network gateway board support"
 	depends on BR2_TARGET_AT32AP7000

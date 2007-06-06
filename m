From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed,  6 Jun 2007 14:05:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070606210519.2A15A4859D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-06 14:05:18 -0700 (Wed, 06 Jun 2007)
New Revision: 18764

Log:
- the at91 mirrors depend on BR2_TARGET_ATMEL which may add at91 support later on which itself will select BR2_TARGET_ATMEL


Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-06-06 20:25:16 UTC (rev 18763)
+++ trunk/buildroot/Config.in	2007-06-06 21:05:18 UTC (rev 18764)
@@ -290,7 +290,7 @@
 	  http://prdownloads.sourceforge.net/index-sf.html?download
 
 config BR2_ATMEL_MIRROR
-	depends BR2_avr32 || BR2_arm
+	depends BR2_TARGET_ATMEL && (BR2_avr32 || BR2_arm)
 	string "Atmel AVR32/AT91 download site"
 	default "ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/"
 	help
@@ -308,7 +308,7 @@
 	  Community  AT91 Linux support is through http://maxim.org.za/AT91_26.html
 
 config BR2_AT91_PATCH_MIRROR
-	depends BR2_arm
+	depends BR2_TARGET_ATMEL && BR2_arm
 	string "Atmel AT91 Linux Patch download site"
 	default "http://maxim.org.za/AT91RM9200/2.6/"
 	help

From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 29 Jul 2007 10:40:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070729174042.E896FA4659@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-29 10:40:42 -0700 (Sun, 29 Jul 2007)
New Revision: 19331

Log:
uClibc config for AVR32

Modified:
   trunk/buildroot/toolchain/uClibc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2007-07-29 17:36:45 UTC (rev 19330)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2007-07-29 17:40:42 UTC (rev 19331)
@@ -14,13 +14,15 @@
 		bool "uClibc 0.9.28"
 
 	config BR2_UCLIBC_VERSION_0_9_28_3
-		depends BR2_DEPRECATED
+		depends BR2_avr32 || BR2_DEPRECATED
 		bool "uClibc 0.9.28.3"
 
 	config BR2_UCLIBC_VERSION_0_9_29
+		depends !BR2_avr32
 		bool "uClibc 0.9.29"
 
 	config BR2_UCLIBC_VERSION_SNAPSHOT
+		depends !BR2_avr32
 		bool "daily snapshot"
 
 endchoice

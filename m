From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 29 Mar 2008 04:04:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain
Message-ID: <20080329110431.5420D3C44D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-29 04:04:30 -0700 (Sat, 29 Mar 2008)
New Revision: 21549

Log:
Remove duplication of AVR32 toolchain

Modified:
   trunk/buildroot/toolchain/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/Config.in	2008-03-29 07:40:35 UTC (rev 21548)
+++ trunk/buildroot/toolchain/Config.in	2008-03-29 11:04:30 UTC (rev 21549)
@@ -1,7 +1,8 @@
 menu "Toolchain"
 choice
 	prompt "Toolchain type"
-	default BR2_TOOLCHAIN_BUILDROOT 
+	default BR2_TOOLCHAIN_BUILDROOT if !BR2_avr32
+	default BR2_TOOLCHAIN_EXTERNAL_SOURCE if BR2_avr32
 	help
 	  Select whether to use the toolchain provided by buildroot
 	  or an external toolchain.
@@ -11,6 +12,7 @@
 
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
+	depends on !BR2_avr32
   
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External binary toolchain"

From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 16:25:18 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20090126162519.2B9DA768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-26 16:25:17 +0000 (Mon, 26 Jan 2009)
New Revision: 25056

Log:
linux/advanced: default to make menuconfig

Modified:
   trunk/buildroot/target/linux/Config.in.advanced
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2009-01-26 15:45:32 UTC (rev 25055)
+++ trunk/buildroot/target/linux/Config.in.advanced	2009-01-26 16:25:17 UTC (rev 25056)
@@ -406,7 +406,7 @@
 
 choice
 	prompt "Preferred config tool"
-	default BR2_MAKE_XCONFIG
+	default BR2_MAKE_MENUCONFIG
 	depends on BR2_PACKAGE_LINUX_USE_XCONFIG
 	help
 	  Define the preferred tool to invoke if a configuration is invalid

Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-26 15:45:32 UTC (rev 25055)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-26 16:25:17 UTC (rev 25056)
@@ -117,7 +117,7 @@
 KERNEL_CONFIG_METHOD:=$(strip $(subst ",,$(BR2_KERNEL_CONFIG_METHOD)))
 #"))
 ifeq ($(KERNEL_CONFIG_METHOD),)
-KERNEL_CONFIG_METHOD:=xconfig
+KERNEL_CONFIG_METHOD:=menuconfig
 endif
 endif
 # -----------------------------------------------------------------------------

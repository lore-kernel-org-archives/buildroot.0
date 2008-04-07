From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  7 Apr 2008 00:59:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/haserl
Message-ID: <20080407075904.3CAC23C33C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-07 00:59:03 -0700 (Mon, 07 Apr 2008)
New Revision: 21661

Log:
haserl: get rid of minor version in config names

Rename haserl config options to 0.8.x / 0.9.x so the config names
don't change every time the version is bumped (similar to busysbox package).


Modified:
   trunk/buildroot/package/haserl/Config.in


Changeset:
Modified: trunk/buildroot/package/haserl/Config.in
===================================================================
--- trunk/buildroot/package/haserl/Config.in	2008-04-07 01:45:41 UTC (rev 21660)
+++ trunk/buildroot/package/haserl/Config.in	2008-04-07 07:59:03 UTC (rev 21661)
@@ -10,18 +10,18 @@
 
 choice
 	prompt "Haserl version"
-	default BR2_PACKAGE_HASERL_VERSION_0_9_22
+	default BR2_PACKAGE_HASERL_VERSION_0_9_X
 	depends on BR2_PACKAGE_HASERL
 	help
 	  Select the older stable version, or the newer developer version
 
-config BR2_PACKAGE_HASERL_VERSION_0_8_0
-	bool	"v 0.8.0"
+config BR2_PACKAGE_HASERL_VERSION_0_8_X
+	bool	"v 0.8.x"
 	help
 	  stable version
 
-config BR2_PACKAGE_HASERL_VERSION_0_9_22
-	bool	"v 0.9.22"
+config BR2_PACKAGE_HASERL_VERSION_0_9_X
+	bool	"v 0.9.x"
 	help
 	  developer version - seems OK though
 
@@ -30,5 +30,5 @@
 
 config BR2_PACKAGE_HASERL_VERSION
 	string
-	default "0.8.0"		if BR2_PACKAGE_HASERL_VERSION_0_8_0
-	default "0.9.22"	if BR2_PACKAGE_HASERL_VERSION_0_9_22
+	default "0.8.0"		if BR2_PACKAGE_HASERL_VERSION_0_8_X
+	default "0.9.22"	if BR2_PACKAGE_HASERL_VERSION_0_9_X

From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 29 Feb 2008 05:54:21 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/haserl
Message-ID: <20080229135421.A997B12C6F5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-02-29 05:54:20 -0800 (Fri, 29 Feb 2008)
New Revision: 21143

Log:
haserl: bump version


Added:
   trunk/buildroot/package/haserl/haserl-0.9.22-susv3-legacy.patch

Removed:
   trunk/buildroot/package/haserl/haserl-0.9.21-susv3-legacy.patch

Modified:
   trunk/buildroot/package/haserl/Config.in


Changeset:
Modified: trunk/buildroot/package/haserl/Config.in
===================================================================
--- trunk/buildroot/package/haserl/Config.in	2008-02-29 07:46:19 UTC (rev 21142)
+++ trunk/buildroot/package/haserl/Config.in	2008-02-29 13:54:20 UTC (rev 21143)
@@ -10,7 +10,7 @@
 
 choice
 	prompt "Haserl version"
-	default BR2_PACKAGE_HASERL_VERSION_0_9_21
+	default BR2_PACKAGE_HASERL_VERSION_0_9_22
 	depends on BR2_PACKAGE_HASERL
 	help
 	  Select the older stable version, or the newer developer version
@@ -20,8 +20,8 @@
 	help
 	  stable version
 
-config BR2_PACKAGE_HASERL_VERSION_0_9_21
-	bool	"v 0.9.21"
+config BR2_PACKAGE_HASERL_VERSION_0_9_22
+	bool	"v 0.9.22"
 	help
 	  developer version - seems OK though
 
@@ -31,4 +31,4 @@
 config BR2_PACKAGE_HASERL_VERSION
 	string
 	default "0.8.0"		if BR2_PACKAGE_HASERL_VERSION_0_8_0
-	default "0.9.21"	if BR2_PACKAGE_HASERL_VERSION_0_9_21
+	default "0.9.22"	if BR2_PACKAGE_HASERL_VERSION_0_9_22

Deleted: trunk/buildroot/package/haserl/haserl-0.9.21-susv3-legacy.patch
===================================================================
--- trunk/buildroot/package/haserl/haserl-0.9.21-susv3-legacy.patch	2008-02-29 07:46:19 UTC (rev 21142)
+++ trunk/buildroot/package/haserl/haserl-0.9.21-susv3-legacy.patch	2008-02-29 13:54:20 UTC (rev 21143)
@@ -1,12 +0,0 @@
-diff -urN haserl-0.9.21-0rig/src/haserl.c haserl-0.9.21/src/haserl.c
---- haserl-0.9.21-0rig/src/haserl.c	2007-12-13 22:58:00.000000000 +0100
-+++ haserl-0.9.21/src/haserl.c	2007-12-13 23:00:10.000000000 +0100
-@@ -210,7 +210,7 @@
-     }
-   memcpy ((char *) (entry + strlen (prefix)), str, strlen (str));
- 
--  keylen = (size_t) (index (entry, '=') - entry);
-+  keylen = (size_t) (strchr (entry, '=') - entry);
- 
-   if (keylen <= 0)
-     {

Copied: trunk/buildroot/package/haserl/haserl-0.9.22-susv3-legacy.patch (from rev 21138, trunk/buildroot/package/haserl/haserl-0.9.21-susv3-legacy.patch)
===================================================================
--- trunk/buildroot/package/haserl/haserl-0.9.22-susv3-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/haserl/haserl-0.9.22-susv3-legacy.patch	2008-02-29 13:54:20 UTC (rev 21143)
@@ -0,0 +1,12 @@
+diff -urN haserl-0.9.21-0rig/src/haserl.c haserl-0.9.21/src/haserl.c
+--- haserl-0.9.21-0rig/src/haserl.c	2007-12-13 22:58:00.000000000 +0100
++++ haserl-0.9.21/src/haserl.c	2007-12-13 23:00:10.000000000 +0100
+@@ -210,7 +210,7 @@
+     }
+   memcpy ((char *) (entry + strlen (prefix)), str, strlen (str));
+ 
+-  keylen = (size_t) (index (entry, '=') - entry);
++  keylen = (size_t) (strchr (entry, '=') - entry);
+ 
+   if (keylen <= 0)
+     {

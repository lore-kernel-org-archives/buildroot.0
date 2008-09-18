From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 18 Sep 2008 02:22:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080918092242.108343C667@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-18 02:22:41 -0700 (Thu, 18 Sep 2008)
New Revision: 23424

Log:
Config.in: Don't special case atmel targets for image suffix

It's confusing to have different behaviour of target independent options.
As reported by HcE on IRC.

Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2008-09-18 08:42:56 UTC (rev 23423)
+++ trunk/buildroot/Config.in	2008-09-18 09:22:41 UTC (rev 23424)
@@ -126,8 +126,7 @@
 
 config BR2_ROOTFS_SUFFIX
 	string "Custom root fs suffix"
-	default "$(DATE)" if BR2_TARGET_ATMEL
-	default "" if !BR2_TARGET_ATMEL
+	default ""
 	help
 	  Add a custom string to the end of the root file system name.
 

From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 26 Jan 2009 00:12:03 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xfsprogs
Message-ID: <20090126001204.39959775D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-26 00:12:02 +0000 (Mon, 26 Jan 2009)
New Revision: 25035

Log:
Deprecate xfsprogs, no support for XFS in Buildroot

Modified:
   trunk/buildroot/package/xfsprogs/Config.in
   trunk/buildroot/package/xfsprogs/xfsprogs.mk


Changeset:
Modified: trunk/buildroot/package/xfsprogs/Config.in
===================================================================
--- trunk/buildroot/package/xfsprogs/Config.in	2009-01-25 23:51:54 UTC (rev 25034)
+++ trunk/buildroot/package/xfsprogs/Config.in	2009-01-26 00:12:02 UTC (rev 25035)
@@ -4,6 +4,7 @@
 
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
+	depends on BR2_DEPRECATED
 	help
 	  The XFS file system utilities and libraries
 

Modified: trunk/buildroot/package/xfsprogs/xfsprogs.mk
===================================================================
--- trunk/buildroot/package/xfsprogs/xfsprogs.mk	2009-01-25 23:51:54 UTC (rev 25034)
+++ trunk/buildroot/package/xfsprogs/xfsprogs.mk	2009-01-26 00:12:02 UTC (rev 25035)
@@ -46,7 +46,7 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--exec-prefix=/ \
+		--exec-prefix=/usr \
 		--libdir=/usr/lib \
 		$(XFSPROGS_CONFIG_SHARED) \
 	)

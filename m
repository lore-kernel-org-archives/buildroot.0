From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 29 Nov 2006 00:36:33 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dmraid
Message-ID: <20061129083633.5ACD448569@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-29 00:36:32 -0800 (Wed, 29 Nov 2006)
New Revision: 16711

Log:
- dmraid sources include libdevmapper.h,, which is provided by dm
  as pointed out by Pavel Roskin.


Modified:
   trunk/buildroot/package/dmraid/Config.in


Changeset:
Modified: trunk/buildroot/package/dmraid/Config.in
===================================================================
--- trunk/buildroot/package/dmraid/Config.in	2006-11-28 23:37:46 UTC (rev 16710)
+++ trunk/buildroot/package/dmraid/Config.in	2006-11-29 08:36:32 UTC (rev 16711)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DMRAID
 	bool "dmraid"
 	default n
+	select BR2_PACKAGE_DM
 	help
 	  Device-Mapper Software RAID support tool/

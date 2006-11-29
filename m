From: Pavel Roskin <proski@gnu.org>
Date: Tue, 28 Nov 2006 23:19:33 -0500
Subject: [Buildroot] [PATCH] dmraid should depend on dm
Message-ID: <1164773973.4016.79.camel@dv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dmraid sources include libdevmapper.h,, which is provided by dm

Index: package/dmraid/Config.in
===================================================================
--- package/dmraid/Config.in	(revision 16710)
+++ package/dmraid/Config.in	(working copy)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DMRAID
 	bool "dmraid"
 	default n
+	select BR2_PACKAGE_DM
 	help
 	  Device-Mapper Software RAID support tool/


-- 
Regards,
Pavel Roskin

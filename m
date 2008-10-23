From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 23 Oct 2008 08:07:34 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/x11r7/xkeyboard-config
Message-ID: <20081023150734.AFC8B3C675@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-23 08:07:34 -0700 (Thu, 23 Oct 2008)
New Revision: 23772

Log:
x11r7/xkeyboard-config: select xkbcomp

xkeyboard-config uses xkbcomp at runtime, so select it.

closes #5704.

Modified:
   trunk/buildroot/package/x11r7/xkeyboard-config/Config.in


Changeset:
Modified: trunk/buildroot/package/x11r7/xkeyboard-config/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xkeyboard-config/Config.in	2008-10-23 13:49:21 UTC (rev 23771)
+++ trunk/buildroot/package/x11r7/xkeyboard-config/Config.in	2008-10-23 15:07:34 UTC (rev 23772)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XKEYBOARD_CONFIG
 	bool "xkeyboard-config"
+	select BR2_PACKAGE_XAPP_XKBCOMP
 	help
 	  keyboard configuration database for X
 

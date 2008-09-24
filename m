From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Wed, 24 Sep 2008 06:17:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/games/lxdoom
Message-ID: <20080924131707.7856FF8008@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-09-24 06:17:07 -0700 (Wed, 24 Sep 2008)
New Revision: 23467

Log:
lxdoom: make package depend on X11 server

lxdoom depends on a X11 server to be built, this patch will only show lxdoom if
a X11 server is selected and add xserver_xorg-server to the dependency list.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/games/lxdoom/Config.in


Changeset:
Modified: trunk/buildroot/package/games/lxdoom/Config.in
===================================================================
--- trunk/buildroot/package/games/lxdoom/Config.in	2008-09-24 13:11:02 UTC (rev 23466)
+++ trunk/buildroot/package/games/lxdoom/Config.in	2008-09-24 13:17:07 UTC (rev 23467)
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_LXDOOM
 	bool "lxdoom"
+	depends on !BR2_PACKAGE_XSERVER_none
 	help
 	  This is the linux version of the popular doom game.

From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Wed, 24 Sep 2008 06:11:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/games/doom-wad
Message-ID: <20080924131102.A17EBF8008@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-09-24 06:11:02 -0700 (Wed, 24 Sep 2008)
New Revision: 23466

Log:
doom-wad: enable kconfig entry for PrBoom package and fix whitespace damage

This patch will let the user install the Doom shareware WAD file if PrBoom is
selected.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/games/doom-wad/Config.in


Changeset:
Modified: trunk/buildroot/package/games/doom-wad/Config.in
===================================================================
--- trunk/buildroot/package/games/doom-wad/Config.in	2008-09-24 13:03:22 UTC (rev 23465)
+++ trunk/buildroot/package/games/doom-wad/Config.in	2008-09-24 13:11:02 UTC (rev 23466)
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_DOOM_WAD
 	bool "shareware Doom WAD file"
-	depends on BR2_PACKAGE_LXDOOM
+	depends on BR2_PACKAGE_LXDOOM || BR2_PACKAGE_PRBOOM
 	help
-          This will install the shareware wad data file for the doom game.
+	  This will install the shareware wad data file for the doom game.
 
-          The wad file will be placed in the /usr/share/games/doom directory.
+	  The wad file will be placed in the /usr/share/games/doom directory.

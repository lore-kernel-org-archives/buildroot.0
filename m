From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Wed, 24 Sep 2008 06:38:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/games/lxdoom
Message-ID: <20080924133818.68B393C2C9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-09-24 06:38:17 -0700 (Wed, 24 Sep 2008)
New Revision: 23468

Log:
lxdoom: add dependency to a xserver in Makefile

This patch corrects the commit r23467 and replaces uclibc with
xserver_xorg-server in LXDOOM_DEPENDENCIES.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/games/lxdoom/lxdoom.mk


Changeset:
Modified: trunk/buildroot/package/games/lxdoom/lxdoom.mk
===================================================================
--- trunk/buildroot/package/games/lxdoom/lxdoom.mk	2008-09-24 13:17:07 UTC (rev 23467)
+++ trunk/buildroot/package/games/lxdoom/lxdoom.mk	2008-09-24 13:38:17 UTC (rev 23468)
@@ -15,6 +15,6 @@
 		--includedir=/usr/include --enable-shared \
 		$(DISABLE_NLS)
 
-LXDOOM_DEPENDENCIES = uclibc
+LXDOOM_DEPENDENCIES = xserver_xorg-server
 
 $(eval $(call AUTOTARGETS,package/games,lxdoom))

From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Wed, 24 Sep 2008 23:13:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl_net
Message-ID: <20080925061325.6A1273C2B9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-09-24 23:13:24 -0700 (Wed, 24 Sep 2008)
New Revision: 23477

Log:
sdl_net: fix install options for target and staging

This patch install with install-strip to the target and uses the default for
installing to staging. Makes the makefile even more compact, and also more
correct with using install-strip to get proper stripping of the installed
library.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/sdl_net/sdl_net.mk


Changeset:
Modified: trunk/buildroot/package/sdl_net/sdl_net.mk
===================================================================
--- trunk/buildroot/package/sdl_net/sdl_net.mk	2008-09-25 01:21:34 UTC (rev 23476)
+++ trunk/buildroot/package/sdl_net/sdl_net.mk	2008-09-25 06:13:24 UTC (rev 23477)
@@ -11,10 +11,8 @@
 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr
 
 SDL_NET_INSTALL_STAGING = YES
-SDL_NET_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
+SDL_NET_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 
-SDL_NET_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-
 SDL_NET_DEPENDENCIES = sdl
 
 $(eval $(call AUTOTARGETS,package,SDL_net))

From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Wed, 24 Sep 2008 05:06:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  sdl_net
Message-ID: <20080924120700.012E6F8008@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-09-24 05:06:59 -0700 (Wed, 24 Sep 2008)
New Revision: 23463

Log:
SDL_net: add new package SDL_net

This patch adds a new package SDL_net. SDL_net is a small, low-level,
cross-platform network library, that can be used with the Simple DirectMedia
Layer library (SDL).

http://www.libsdl.org/projects/SDL_net/

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Added:
   trunk/buildroot/package/sdl_net/
   trunk/buildroot/package/sdl_net/Config.in
   trunk/buildroot/package/sdl_net/sdl_net.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-09-24 12:00:57 UTC (rev 23462)
+++ trunk/buildroot/package/Config.in	2008-09-24 12:06:59 UTC (rev 23463)
@@ -320,6 +320,7 @@
 source "package/sdl/Config.in"
 source "package/sdl_image/Config.in"
 source "package/sdl_mixer/Config.in"
+source "package/sdl_net/Config.in"
 source "package/sdl_ttf/Config.in"
 source "package/tiff/Config.in"
 

Added: trunk/buildroot/package/sdl_net/Config.in
===================================================================
--- trunk/buildroot/package/sdl_net/Config.in	                        (rev 0)
+++ trunk/buildroot/package/sdl_net/Config.in	2008-09-24 12:06:59 UTC (rev 23463)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SDL_NET
+	bool "SDL_net"
+	depends on BR2_PACKAGE_SDL
+	help
+	  SDL_net is a small, low-level, cross-platform network library, that
+	  can be used with the Simple DirectMedia Layer library (SDL).
+
+	  http://www.libsdl.org/projects/SDL_net/

Added: trunk/buildroot/package/sdl_net/sdl_net.mk
===================================================================
--- trunk/buildroot/package/sdl_net/sdl_net.mk	                        (rev 0)
+++ trunk/buildroot/package/sdl_net/sdl_net.mk	2008-09-24 12:06:59 UTC (rev 23463)
@@ -0,0 +1,20 @@
+#############################################################
+#
+# SDL_net: network addon for SDL
+#
+#############################################################
+SDL_NET_VERSION:=1.2.7
+SDL_NET_SITE:=http://www.libsdl.org/projects/SDL_net/release
+
+SDL_NET_CONF_OPT = --localstatedir=/var \
+		--with-sdl-prefix=$(STAGING_DIR)/usr \
+		--with-sdl-exec-prefix=$(STAGING_DIR)/usr
+
+SDL_NET_INSTALL_STAGING = YES
+SDL_NET_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
+
+SDL_NET_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+SDL_NET_DEPENDENCIES = sdl
+
+$(eval $(call AUTOTARGETS,package,SDL_net))

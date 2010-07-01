From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 1 Jul 2010 10:02:48 +0200
Subject: [Buildroot] [git commit master 1/1] xserver_xorg-server: fix _MAKE
	typo
Message-ID: <20100701080340.772F9821E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=09b36fc0644b8aa296b33e2cce57a7111e264ab1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The variable should be XSERVER_XORG_SERVER_MAKE, not .._XSERVER_MAKE.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    3 ++-
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index ea399df..d00172b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -19,7 +19,8 @@
 	libart, libfuse, libgpg-error, libidn, liblockfile, links,
 	lmbench, lrzsz, make, module-init-tools, nbd, ncurses, netperf,
 	ntfsprogs, openssl, php, qt, quagga, sqlite, sdl, sdl_mixer,
-	sdl_ttf, squashfs, tn5250, usbutils, xkeyboard-config
+	sdl_ttf, squashfs, tn5250, usbutils, xkeyboard-config,
+	xserver_xorg-server
 
 	Removed packages: modutils, portage, rxvt
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 4aba941..ba9a3b8 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -7,7 +7,7 @@
 XSERVER_XORG_SERVER_VERSION = 1.7.5
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
-XSERVER_XORG_XSERVER_MAKE = $(MAKE1) # make install fails with parallel make
+XSERVER_XORG_SERVER_MAKE = $(MAKE1) # make install fails with parallel make
 XSERVER_XORG_SERVER_AUTORECONF = NO
 XSERVER_XORG_SERVER_LIBTOOL_PATCH = NO
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
-- 
1.7.1

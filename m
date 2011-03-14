From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Mar 2011 23:36:43 +0100
Subject: [Buildroot] [git commit master 1/1] xterm: fix dependencies
Message-ID: <20110314223657.F3C1A9003F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b05c54daf0066f29bd2542bea637f646a7fbb4d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xterm doesn't need the xserver to build.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xterm/xterm.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index ab3fc10..d5d193d 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -7,7 +7,7 @@
 XTERM_VERSION = 267
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = ftp://invisible-island.net/xterm
-XTERM_DEPENDENCIES = ncurses xserver_xorg-server xlib_libXaw
+XTERM_DEPENDENCIES = ncurses xlib_libXaw
 XTERM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 $(eval $(call AUTOTARGETS,package,xterm))
-- 
1.7.3.4

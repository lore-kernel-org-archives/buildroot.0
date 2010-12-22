From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Dec 2010 21:44:19 +0100
Subject: [Buildroot] [git commit master 1/1] xkeyboard-config: bump to 2.0
	to fix bug 2965
Message-ID: <20101222204456.C98828E25C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6ddf4702647e46a09c15bedbe99017eaa10573e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2965

For some odd reason, xkeyboard-config < 1.8 was creating a symbolic
link from /usr/share/X11/xkb/xkbcomp to the xkbcomp binary. But in
cross-compilation mode, this is absurd as the xkbcomp binary to which
the link is pointing is the one in $(HOST_DIR).

This symbolic link thing has been removed completely starting from
xkeyboard-config 1.9. See
http://cgit.freedesktop.org/xkeyboard-config/commit/?id=f413dff57e77e7b01461508f74b4e92d1dc8defd.

Therefore, we simply bump xkeyboard-config to the latest available
version, 2.0.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    3 ++-
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 846183d..26cda06 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,7 +9,7 @@
 	lsof, ltp-testsuite, lvm2, m4, memtester, mii-diag, mplayer,
 	mrouted, netplug, openssh, openssl, openvpn, pango, qt, rsync,
 	sdl_gfx, sdl_sound, sysklogd, sysvinit, udev, usbutils,
-	xlib_libX11, xz, zlib
+	xkeyboard-config, xlib_libX11, xz, zlib
 
 	New packages: dhrystone, fbgrab, lsuio, rsh-redone, whetstone,
 	xl2tp
@@ -23,6 +23,7 @@
 	#1651: Build fail caused by ccache in module-init-tools
 	#1735: [PATCH] mplayer: convert to autotools infrastructure
 	#2905: Qt: Speed up compilation, if gui-module isn't selected
+	#2965: Broken linkage to xkbcomp (blocking X server startup)
 	#2983: xlib_libX11 build failed
 
 2010.11, Released November 30th, 2010:
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index b9f1d62..f5ad44d 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -3,9 +3,9 @@
 # xkeyboard-config
 #
 #############################################################
-XKEYBOARD_CONFIG_VERSION = 1.8
+XKEYBOARD_CONFIG_VERSION = 2.0
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
-XKEYBOARD_CONFIG_SITE = http://xlibs.freedesktop.org/xkbdesc
+XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config/
 XKEYBOARD_CONFIG_AUTORECONF = NO
 XKEYBOARD_CONFIG_INSTALL_STAGING = NO
 XKEYBOARD_CONFIG_INSTALL_TARGET = YES
-- 
1.7.2.2

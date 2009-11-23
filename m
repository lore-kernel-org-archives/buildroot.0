From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 13:03:59 +0100
Subject: [Buildroot] [git commit master] xboard: needs X11 support and
	gnuchess
Message-ID: <20091123120648.455A677782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=57ea7207bc68d047a7940db69947b776a89d240b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    2 +-
 package/games/xboard/Config.in |    2 ++
 package/games/xboard/xboard.mk |    2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index f1cec36..c4779ac 100644
--- a/CHANGES
+++ b/CHANGES
@@ -30,7 +30,7 @@
 	radvd, rsync, rubix, samba, sawman, sdl, shared-mime-info, spawn-fcgi,
 	speech-tools, sqlite, squashfs, synergy, syslinux, target-binutils,
 	tcpdump, u-boot, util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
-	xdata_xcursor-themes, xstroke, zlib
+	xdata_xcursor-themes, xboard, xstroke, zlib
 
 	Removed package: mdnsresponder, mpatrol, gcc 3.4.6 + 4.0.4, vice
 
diff --git a/package/games/xboard/Config.in b/package/games/xboard/Config.in
index bb7e001..1821aa0 100644
--- a/package/games/xboard/Config.in
+++ b/package/games/xboard/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XBOARD
 	bool "xboard"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_GNUCHESS
 	help
 	  XBoard and WinBoard are graphical user interfaces for chess.
 
diff --git a/package/games/xboard/xboard.mk b/package/games/xboard/xboard.mk
index be51e99..078e37c 100644
--- a/package/games/xboard/xboard.mk
+++ b/package/games/xboard/xboard.mk
@@ -10,7 +10,7 @@ XBOARD_INSTALL_STAGING = NO
 XBOARD_INSTALL_TARGET = YES
 XBOARD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-XBOARD_DEPENDENCIES = gnuchess
+XBOARD_DEPENDENCIES = gnuchess xserver_xorg-server
 
 $(eval $(call AUTOTARGETS,package/games,xboard))
 
-- 
1.6.3.3

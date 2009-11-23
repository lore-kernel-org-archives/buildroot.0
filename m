From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 13:03:59 +0100
Subject: [Buildroot] [git commit master] magiccube4d: needs C++ and X11
	support
Message-ID: <20091123120646.E5EB577782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=93341a451ead1c9cab329d97d912f7a4cbc4a02f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                  |    6 +++---
 package/games/magiccube4d/Config.in      |    5 +++++
 package/games/magiccube4d/magiccube4d.mk |    1 +
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index a6e10ef..ba14e67 100644
--- a/CHANGES
+++ b/CHANGES
@@ -25,9 +25,9 @@
 	gst-plugins-base, gst-plugins-good, imagemagick, ipkg, iptables,
 	iw, kernel-headers, kismet, libelf, libevent, libglib2, libidn,
 	liblockfile, libmad, libpcap, libupnp, libuuid, lighttpd, ltrace,
-	lua, lzma, matchbox, mdadm, nbd, ncftp, ncurses, netkittelnet,
-	netsnmp, ntfs-3g, openntp, openssl, php, python, quagga, radvd,
-	rsync, samba, sawman, sdl, shared-mime-info, spawn-fcgi,
+	lua, lzma, magiccube4d, matchbox, mdadm, nbd, ncftp, ncurses,
+	netkittelnet, netsnmp, ntfs-3g, openntp, openssl, php, python, quagga,
+	radvd, rsync, samba, sawman, sdl, shared-mime-info, spawn-fcgi,
 	speech-tools, sqlite, squashfs, synergy, syslinux, target-binutils,
 	tcpdump, u-boot, util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
 	xdata_xcursor-themes, xstroke, zlib
diff --git a/package/games/magiccube4d/Config.in b/package/games/magiccube4d/Config.in
index ba4bceb..871c3c7 100644
--- a/package/games/magiccube4d/Config.in
+++ b/package/games/magiccube4d/Config.in
@@ -1,6 +1,11 @@
 config BR2_PACKAGE_MAGICCUBE4D
 	bool "magiccube4d"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_XORG7
 	help
 	  Another rubiks cube-like game in 4D
 
 	  http://avr32linux.org/twiki/bin/viewfile/Main
+
+comment "magiccube4d requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP && BR2_PACKAGE_XORG7
diff --git a/package/games/magiccube4d/magiccube4d.mk b/package/games/magiccube4d/magiccube4d.mk
index a92ffd2..20b4231 100644
--- a/package/games/magiccube4d/magiccube4d.mk
+++ b/package/games/magiccube4d/magiccube4d.mk
@@ -9,6 +9,7 @@ MAGICCUBE4D_SITE = http://avr32linux.org/twiki/pub/Main/MagicCube4D
 MAGICCUBE4D_INSTALL_STAGING = NO
 MAGICCUBE4D_INSTALL_TARGET = YES
 MAGICCUBE4D_INSTALL_TARGET_OPT = GAMESDIR=$(TARGET_DIR)/usr/games install
+MAGICCUBE4D_DEPENDENCIES = xserver_xorg-server
 
 $(eval $(call AUTOTARGETS,package/games,magiccube4d))
 
-- 
1.6.3.3

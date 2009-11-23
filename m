From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 13:03:59 +0100
Subject: [Buildroot] [git commit master] rubix: needs X11 support
Message-ID: <20091123120647.690F777782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2795e3d902def40679c01336c4c263df2a1a0f10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                       |    2 +-
 package/games/rubix/Config.in |    1 +
 package/games/rubix/rubix.mk  |    2 ++
 3 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index ba14e67..ff911ff 100644
--- a/CHANGES
+++ b/CHANGES
@@ -27,7 +27,7 @@
 	liblockfile, libmad, libpcap, libupnp, libuuid, lighttpd, ltrace,
 	lua, lzma, magiccube4d, matchbox, mdadm, nbd, ncftp, ncurses,
 	netkittelnet, netsnmp, ntfs-3g, openntp, openssl, php, python, quagga,
-	radvd, rsync, samba, sawman, sdl, shared-mime-info, spawn-fcgi,
+	radvd, rsync, rubix, samba, sawman, sdl, shared-mime-info, spawn-fcgi,
 	speech-tools, sqlite, squashfs, synergy, syslinux, target-binutils,
 	tcpdump, u-boot, util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
 	xdata_xcursor-themes, xstroke, zlib
diff --git a/package/games/rubix/Config.in b/package/games/rubix/Config.in
index 46dc5ec..6da8c71 100644
--- a/package/games/rubix/Config.in
+++ b/package/games/rubix/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RUBIX
 	bool "rubix"
+	depends on BR2_PACKAGE_XORG7
 	help
 	  A 3D rubiks cube game for X
 
diff --git a/package/games/rubix/rubix.mk b/package/games/rubix/rubix.mk
index d81780a..308e94b 100644
--- a/package/games/rubix/rubix.mk
+++ b/package/games/rubix/rubix.mk
@@ -12,5 +12,7 @@ RUBIX_INSTALL_TARGET_OPT = GAMESDIR=$(TARGET_DIR)/usr/games install
 
 RUBIX_MAKE_OPT = CC=$(TARGET_CC) XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB="-L$(STAGING_DIR)/usr/lib -lX11"
 
+RUBIX_DEPENDENCIES = xserver_xorg-server
+
 $(eval $(call AUTOTARGETS,package/games,rubix))
 
-- 
1.6.3.3

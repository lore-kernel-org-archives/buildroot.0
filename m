From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Jul 2010 21:06:13 +0200
Subject: [Buildroot] [git commit master 1/1] alsamixergui: needs C++ support
	for fltk
Message-ID: <20100721190651.C4C0F82DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=884c7c6b99838b409418585132732630e3c38a82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |   19 ++++++++++---------
 package/alsamixergui/Config.in |    4 ++++
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index b182077..28fc5be 100644
--- a/CHANGES
+++ b/CHANGES
@@ -14,15 +14,16 @@
 	New packages: cgilua, copas, coxpcall, ffmpeg, libsvgtiny,
 	luafilesystem, luasocket, rings, wsapi, xavante, xterm
 
-	Updated/fixed packages: alsa-lib, avahi, berkeleydb, bash, blackbox,
-	busybox, bzip2, cdrkit, cmake, dash, dhcp, dialog, diffutils,
-	distcc, dmalloc, dnsmasq, dropbear, e2fsprogs, fbv, file, flex,
-	fontconfig, gawk, gstreamer, gzip, intltool, ipsec-tools,
-	iptables, libart, libcgi, libdrm, libfuse, libgpg-error, libidn,
-	liblockfile, libpng, links, linux-fusion, lmbench, lrzsz,
-	make, module-init-tools, mysql_client, nbd, ncurses, neon,
-	netcat, netperf, ntfsprogs, openssl, php, qt, quagga, sqlite,
-	sdl, sdl_mixer, sdl_sound, sdl_ttf, squashfs, tn5250, tremor,
+	Updated/fixed packages: alsa-lib, alsamixergui, avahi,
+	berkeleydb, bash, blackbox, busybox, bzip2, cdrkit, cmake,
+	dash, dhcp, dialog, diffutils, distcc, dmalloc, dnsmasq,
+	dropbear, e2fsprogs, fbv, file, flex, fontconfig, gawk,
+	gstreamer, gzip, intltool, ipsec-tools, iptables, libart,
+	libcgi, libdrm, libfuse, libgpg-error, libidn, liblockfile,
+	libpng, links, linux-fusion, lmbench, lrzsz, make,
+	module-init-tools, mysql_client, nbd, ncurses, neon, netcat,
+	netperf, ntfsprogs, openssl, php, qt, quagga, sqlite, sdl,
+	sdl_mixer, sdl_sound, sdl_ttf, squashfs, tn5250, tremor,
 	usbutils, xkeyboard-config, xserver_xorg-server, xvkbd
 
 	Removed packages: modutils, portage, rxvt
diff --git a/package/alsamixergui/Config.in b/package/alsamixergui/Config.in
index 5a31b20..5b53e6a 100644
--- a/package/alsamixergui/Config.in
+++ b/package/alsamixergui/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_ALSAMIXERGUI
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_ALSA_LIB
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_FLTK
 	bool "alsamixergui"
 	help
 	  A nice GUI mixer for Alsa using fltk
 
 	  http://www.iua.upf.es/~mdeboer/projects/alsamixergui/
+
+comment "alsamixergui requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP && BR2_PACKAGE_XORG7 && BR2_PACKAGE_ALSA_LIB
-- 
1.7.1

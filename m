From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Jul 2010 10:02:06 +0200
Subject: [Buildroot] [git commit master 1/1] gnuchess: fix configure cache
	issue with readline
Message-ID: <20100727200331.3D7EA82A41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a731c7d6235306a6ecb29ff7848682736fde7a7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make sure readline is built before gnuchess if enabled, so it correctly
detects it and doesn't populate tgt-config.cache with invalid values.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                            |   19 ++++++++++---------
 package/games/gnuchess/gnuchess.mk |    2 ++
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2f776af..5aa39fb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -22,15 +22,16 @@
 	berkeleydb, bash, blackbox, busybox, bzip2, cdrkit, cmake,
 	dash, dhcp, dialog, diffutils, distcc, dmalloc, dnsmasq,
 	dropbear, e2fsprogs, fbv, file, flex, fontconfig, gawk, gmpc,
-	gst-plugins-base, gst-plugins-good, gstreamer, gzip, intltool,
-	ipsec-tools, iptables, iw, libart, libcgi, libdrm, libfuse,
-	libgpg-error, libidn, liblockfile, libpng, lighttpd, links,
-	linux-fusion, lmbench, lrzsz, ltrace, make, module-init-tools,
-	mplayer, mysql_client, nbd, ncurses, neon, netcat, netperf,
-	ntfsprogs, openssl, php, qt, quagga, setserial, sdl, sdl_mixer,
-	sdl_sound, sdl_ttf, sqlite, squashfs, swfdec, tftpd, thttpd,
-	tn5250, tremor, usbutils, webif, wireless_tools,
-	xkeyboard-config, xserver_xorg-server, xvkbd
+	gnuchess, gst-plugins-base, gst-plugins-good, gstreamer, gzip,
+	intltool, ipsec-tools, iptables, iw, libart, libcgi, libdrm,
+	libfuse, libgpg-error, libidn, liblockfile, libpng, lighttpd,
+	links, linux-fusion, lmbench, lrzsz, ltrace, make,
+	module-init-tools, mplayer, mysql_client, nbd, ncurses, neon,
+	netcat, netperf, ntfsprogs, openssl, php, qt, quagga,
+	setserial, sdl, sdl_mixer, sdl_sound, sdl_ttf, sqlite,
+	squashfs, swfdec, tftpd, thttpd, tn5250, tremor, usbutils,
+	webif, wireless_tools, xkeyboard-config, xserver_xorg-server,
+	xvkbd
 
 	Removed packages: modutils, portage, rxvt
 
diff --git a/package/games/gnuchess/gnuchess.mk b/package/games/gnuchess/gnuchess.mk
index d5a8dd6..8e331a4 100644
--- a/package/games/gnuchess/gnuchess.mk
+++ b/package/games/gnuchess/gnuchess.mk
@@ -7,5 +7,7 @@ GNUCHESS_VERSION = 5.07
 GNUCHESS_SOURCE = gnuchess-$(GNUCHESS_VERSION).tar.gz
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
 
+GNUCHESS_DEPENDENCIES = $(if $(BR2_PACKAGE_READLINE),readline)
+
 $(eval $(call AUTOTARGETS,package/games,gnuchess))
 
-- 
1.7.1

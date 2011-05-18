From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 May 2011 22:03:57 +0200
Subject: [Buildroot] [git commit] mplayer: fix libmad check
Message-ID: <20110518205907.486588354C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8b4f5f241071bbe71229e989b563c7817dc6da5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3757

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                               |    9 +++++----
 package/multimedia/mplayer/mplayer.mk |    2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9155e00..a15689b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -34,10 +34,10 @@
 	haserl, hostapd, icu, imagemagick, iproute2, iw, kismet, less,
 	libcap, libdnet, libglade, libglib2, libgtk2, libnl, libpng,
 	libxml2, libxml2, libxslt, lighttpd, lockfile-progs, makedevs,
-	midori, mpg123, mpc, mpd, mpfr, mtd-utils, ncurses, netsnmp,
-	openssh, openssl, openvpn, pango, pkg-config, popt, procps,
-	proftpd, qt, quagga, readline, rsync, samba, sdl, socat,
-	squashfs, squid, sudo, tslib, udev, usbutils, webkit,
+	midori, mpg123, mpc, mpd, mpfr, mplayer, mtd-utils, ncurses,
+	netsnmp, openssh, openssl, openvpn, pango, pkg-config, popt,
+	procps, proftpd, qt, quagga, readline, rsync, samba, sdl,
+	socat, squashfs, squid, sudo, tslib, udev, usbutils, webkit,
 	wpa_supplicant, xerces, xfont_font-misc-misc, xlib_libX11,
 	xlib_libXfont, xlib_xtrans, xorg-server, xterm, xz
 
@@ -59,6 +59,7 @@
 	#3571: u-boot: fw_printenv does not build
 	#3643: popt source url is not responding
 	#3733: dropbear: make zlib optional
+	#3757: Buildroot can't build mplayer with libmad
 
 2011.02, Released February 28th, 2011:
 
diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 7d45960..f735464 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -69,7 +69,7 @@ MPLAYER_DEPENDENCIES += tremor
 MPLAYER_CONF_OPTS += --disable-tremor-internal --enable-tremor
 endif
 
-ifeq ($(BR2_PACKAGE_MAD),y)
+ifeq ($(BR2_PACKAGE_LIBMAD),y)
 MPLAYER_DEPENDENCIES += libmad
 else
 MPLAYER_CONF_OPTS += --disable-mad
-- 
1.7.3.4

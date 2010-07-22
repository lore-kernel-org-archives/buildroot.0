From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Jul 2010 13:08:24 +0200
Subject: [Buildroot] [git commit master 1/1] gst-plugins-base: ensure
	<stdint.h> is used
Message-ID: <20100722110847.B283E82DFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=32d319e6f7242553c821c7a1eadfabd2719f5992
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise the build breaks with the emulation _stdint.h in gstfft.c.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |   15 ++++++++-------
 .../gst-plugins-base/gst-plugins-base.mk           |    4 +++-
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6600eee..f6388c5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -18,13 +18,14 @@
 	berkeleydb, bash, blackbox, busybox, bzip2, cdrkit, cmake,
 	dash, dhcp, dialog, diffutils, distcc, dmalloc, dnsmasq,
 	dropbear, e2fsprogs, fbv, file, flex, fontconfig, gawk,
-	gstreamer, gzip, intltool, ipsec-tools, iptables, libart,
-	libcgi, libdrm, libfuse, libgpg-error, libidn, liblockfile,
-	libpng, lighttpd, links, linux-fusion, lmbench, lrzsz, ltrace,
-	make, module-init-tools, mysql_client, nbd, ncurses, neon,
-	netcat, netperf, ntfsprogs, openssl, php, qt, quagga, sqlite,
-	sdl, sdl_mixer, sdl_sound, sdl_ttf, squashfs, tn5250, tremor,
-	usbutils, xkeyboard-config, xserver_xorg-server, xvkbd
+	gst-plugins-base, gstreamer, gzip, intltool, ipsec-tools,
+	iptables, libart, libcgi, libdrm, libfuse, libgpg-error,
+	libidn, liblockfile, libpng, lighttpd, links, linux-fusion,
+	lmbench, lrzsz, ltrace, make, module-init-tools, mysql_client,
+	nbd, ncurses, neon, netcat, netperf, ntfsprogs, openssl, php,
+	qt, quagga, sqlite, sdl, sdl_mixer, sdl_sound, sdl_ttf,
+	squashfs, tn5250, tremor, usbutils, xkeyboard-config,
+	xserver_xorg-server, xvkbd
 
 	Removed packages: modutils, portage, rxvt
 
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 5cb8cb8..91d9f1b 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -12,7 +12,9 @@ GST_PLUGINS_BASE_LIBTOOL_PATCH = NO
 # freetype is only used by examples, but if it is not found
 # and the host has a freetype-config script, then the host
 # include dirs are added to the search path causing trouble
-GST_PLUGINS_BASE_CONF_ENV = FT2_CONFIG=/bin/false
+GST_PLUGINS_BASE_CONF_ENV =
+		FT2_CONFIG=/bin/false \
+		ac_cv_header_stdint_t="stdint.h"
 
 GST_PLUGINS_BASE_CONF_OPT = \
 		--disable-examples \
-- 
1.7.1

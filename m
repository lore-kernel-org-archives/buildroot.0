From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Jul 2010 16:34:57 +0200
Subject: [Buildroot] [git commit master 1/1] gst-plugins-good: udp plugin
	needs ipv6 support
Message-ID: <20100722143544.BEF0382B81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6d249fcdface15ae236b7eb71dc84d8e3c28f417
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                       |   16 ++++++++--------
 package/multimedia/gst-plugins-good/Config.in |    4 ++++
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index 20294f5..f031cb5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -18,14 +18,14 @@
 	berkeleydb, bash, blackbox, busybox, bzip2, cdrkit, cmake,
 	dash, dhcp, dialog, diffutils, distcc, dmalloc, dnsmasq,
 	dropbear, e2fsprogs, fbv, file, flex, fontconfig, gawk,
-	gst-plugins-base, gstreamer, gzip, intltool, ipsec-tools,
-	iptables, libart, libcgi, libdrm, libfuse, libgpg-error,
-	libidn, liblockfile, libpng, lighttpd, links, linux-fusion,
-	lmbench, lrzsz, ltrace, make, module-init-tools, mplayer,
-	mysql_client, nbd, ncurses, neon, netcat, netperf, ntfsprogs,
-	openssl, php, qt, quagga, sqlite, sdl, sdl_mixer, sdl_sound,
-	sdl_ttf, squashfs, thttpd, tn5250, tremor, usbutils, webif,
-	xkeyboard-config, xserver_xorg-server, xvkbd
+	gst-plugins-base, gst-plugins-good, gstreamer, gzip, intltool,
+	ipsec-tools, iptables, libart, libcgi, libdrm, libfuse,
+	libgpg-error, libidn, liblockfile, libpng, lighttpd, links,
+	linux-fusion, lmbench, lrzsz, ltrace, make, module-init-tools,
+	mplayer, mysql_client, nbd, ncurses, neon, netcat, netperf,
+	ntfsprogs, openssl, php, qt, quagga, sqlite, sdl, sdl_mixer,
+	sdl_sound, sdl_ttf, squashfs, thttpd, tn5250, tremor,
+	usbutils, webif, xkeyboard-config, xserver_xorg-server, xvkbd
 
 	Removed packages: modutils, portage, rxvt
 
diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index a326dc9..3b37b5e 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -134,8 +134,12 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPECTRUM
 	bool "spectrum"
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_UDP
+	depends on BR2_INET_IPV6
 	bool "udp"
 
+comment "udp requires a toolchain with IPv6 support"
+	depends on !BR2_INET_IPV6
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOBOX
 	bool "videobox"
 
-- 
1.7.1

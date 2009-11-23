From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 13:03:59 +0100
Subject: [Buildroot] [git commit master] alsamixergui: depend on x11 support,
	rather than (indirectly) selecting it
Message-ID: <20091123120641.F3297777BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1620cc3e3507a92ddceb27cde5f1dca326e52e64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Packages should depend on BR2_PACKAGE_XORG7 rather than selecting it,
because:
 - X brings in a lot of dependencies, so shouldn't get implicitly enabled
 - Select doesn't check dependencies, so build breaks if XORG dependencies
   aren't met (locale/wchar)

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |   21 +++++++++++----------
 package/alsamixergui/Config.in |    1 +
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/CHANGES b/CHANGES
index c619b3f..ee33dd2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,16 +10,17 @@
 	New packages: divine, gvfs, libarchive, libmicrohttpd,
 	sdl_sound, swfdec, sysstat
 
-	Updated/fixed packages: autoconf, busybox, gcc, directfb, dnsmasq,
-	e2fsprogs, festival, gstreamer, gst-plugins-bad, gst-plugins-base,
-	gst-plugins-good, imagemagick, ipkg, iptables, iw, kernel-headers,
-	kismet, libelf, libevent, libglib2, libidn, liblockfile, libmad,
-	libpcap, libupnp, libuuid, lighttpd, ltrace, lua, lzma, matchbox,
-	mdadm, nbd, ncftp, ncurses, netkittelnet, netsnmp, ntfs-3g, openntp,
-	openssl, php, python, quagga, radvd, rsync, samba, sawman, sdl,
-	shared-mime-info, spawn-fcgi, speech-tools, sqlite, squashfs, synergy,
-	syslinux, target-binutils, tcpdump, u-boot, util-linux, valgrind,
-	vsftpd, wipe, wpa-supplicant, xdata_xcursor-themes, zlib
+	Updated/fixed packages: alsamixergui, autoconf, busybox, gcc,
+	directfb, dnsmasq, e2fsprogs, festival, gstreamer, gst-plugins-bad,
+	gst-plugins-base, gst-plugins-good, imagemagick, ipkg, iptables,
+	iw, kernel-headers, kismet, libelf, libevent, libglib2, libidn,
+	liblockfile, libmad, libpcap, libupnp, libuuid, lighttpd, ltrace,
+	lua, lzma, matchbox, mdadm, nbd, ncftp, ncurses, netkittelnet,
+	netsnmp, ntfs-3g, openntp, openssl, php, python, quagga, radvd,
+	rsync, samba, sawman, sdl, shared-mime-info, spawn-fcgi,
+	speech-tools, sqlite, squashfs, synergy, syslinux, target-binutils,
+	tcpdump, u-boot, util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
+	xdata_xcursor-themes, zlib
 
 	Removed package: mdnsresponder, mpatrol, gcc 3.4.6 + 4.0.4
 
diff --git a/package/alsamixergui/Config.in b/package/alsamixergui/Config.in
index 53b4234..c7508bb 100644
--- a/package/alsamixergui/Config.in
+++ b/package/alsamixergui/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_ALSAMIXERGUI
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_FLTK
 	bool "alsamixergui"
 	help
-- 
1.6.3.3

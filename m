From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 13:03:59 +0100
Subject: [Buildroot] [git commit master] matchbox: depend on x11 support,
	rather than selecting it
Message-ID: <20091123120641.8AE6877782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=41aaacd53da44efa97fa36035552a0f4546ab2e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Packages should depend on BR2_PACKAGE_XORG7 rather than selecting it,
because:
 - X brings in a lot of dependencies, so shouldn't get implicitly enabled
 - Select doesn't check dependencies, so build breaks if XORG dependencies
   aren't met (locale/wchar)

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |   12 ++++++------
 package/matchbox/Config.in |    2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index e6c1106..c619b3f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -14,12 +14,12 @@
 	e2fsprogs, festival, gstreamer, gst-plugins-bad, gst-plugins-base,
 	gst-plugins-good, imagemagick, ipkg, iptables, iw, kernel-headers,
 	kismet, libelf, libevent, libglib2, libidn, liblockfile, libmad,
-	libpcap, libupnp, libuuid, lighttpd, ltrace, lua, lzma, mdadm, nbd,
-	ncftp, ncurses, netkittelnet, netsnmp, ntfs-3g, openntp, openssl, php,
-	python, quagga, radvd, rsync, samba, sawman, sdl, shared-mime-info,
-	spawn-fcgi, speech-tools, sqlite, squashfs, synergy, syslinux,
-	target-binutils, tcpdump, u-boot, util-linux, valgrind, vsftpd, wipe,
-	wpa-supplicant, xdata_xcursor-themes, zlib
+	libpcap, libupnp, libuuid, lighttpd, ltrace, lua, lzma, matchbox,
+	mdadm, nbd, ncftp, ncurses, netkittelnet, netsnmp, ntfs-3g, openntp,
+	openssl, php, python, quagga, radvd, rsync, samba, sawman, sdl,
+	shared-mime-info, spawn-fcgi, speech-tools, sqlite, squashfs, synergy,
+	syslinux, target-binutils, tcpdump, u-boot, util-linux, valgrind,
+	vsftpd, wipe, wpa-supplicant, xdata_xcursor-themes, zlib
 
 	Removed package: mdnsresponder, mpatrol, gcc 3.4.6 + 4.0.4
 
diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index afa5684..f573467 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_MATCHBOX
 	bool "MatchBox Window Manager"
-	select BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
-- 
1.6.3.3

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 15:29:43 +0100
Subject: [Buildroot] [git commit master] udpcast: needs largefile support
Message-ID: <20091123143318.0D2E4777D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=57403b74f14ab5ef477067a0b006320eafe5af80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And fix Kconfig tab/spaces while we're at it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                   |    2 +-
 package/udpcast/Config.in |   32 ++++++++++++++++++--------------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/CHANGES b/CHANGES
index 40ebf17..625e764 100644
--- a/CHANGES
+++ b/CHANGES
@@ -30,7 +30,7 @@
 	ng-spice-rework, ntfs-3g, openntp, openssl, pcmanfm, php, psmisc,
 	python, quagga, radvd, rsync, rubix, samba, sawman, sdl,
 	shared-mime-info, sfdisk, spawn-fcgi, speech-tools, sqlite, squashfs,
-	synergy, syslinux, target-binutils, tcpdump, torsmo, u-boot,
+	synergy, syslinux, target-binutils, tcpdump, torsmo, u-boot, udpcast,
 	util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
 	xdata_xcursor-themes, xboard, xstroke, zlib
 
diff --git a/package/udpcast/Config.in b/package/udpcast/Config.in
index c3b0dd5..d7ccfb4 100644
--- a/package/udpcast/Config.in
+++ b/package/udpcast/Config.in
@@ -1,24 +1,28 @@
 config BR2_PACKAGE_UDPCAST
-        bool "udpcast"
-        help
-          A multicast protocol implementation which happens to
-          be very handy for imaging drives over the network.
+	bool "udpcast"
+	depends on BR2_LARGEFILE
+	help
+	  A multicast protocol implementation which happens to
+	  be very handy for imaging drives over the network.
 
-          http://www.udpcast.linux.lu/
+	  http://www.udpcast.linux.lu/
+
+comment "udpcast requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
 
 menu "udpcast tools selection"
-        depends on BR2_PACKAGE_UDPCAST
+depends on BR2_PACKAGE_UDPCAST
 
 config BR2_PACKAGE_UDPCAST_SENDER
-        bool "sender"
-        depends on BR2_PACKAGE_UDPCAST
-        help
-          The udpcast transmitter.
+	bool "sender"
+	depends on BR2_PACKAGE_UDPCAST
+	help
+	  The udpcast transmitter.
 
 config BR2_PACKAGE_UDPCAST_RECEIVER
-        bool "receiver"
-        depends on BR2_PACKAGE_UDPCAST
-        help
-          The udpcast receiver.
+	bool "receiver"
+	depends on BR2_PACKAGE_UDPCAST
+	help
+	  The udpcast receiver.
 
 endmenu
-- 
1.6.3.3

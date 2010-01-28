From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jan 2010 16:05:40 +0100
Subject: [Buildroot] [git commit master] at: fix build when host doesn't
	have sendmail
Message-ID: <20100128150634.6D44B77719@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=819e7f5b788f63bb316afea53325b045337f208a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported by Noel Vellemans.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES          |   13 +++++++------
 package/at/at.mk |    1 +
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index bfb7855..b1bc046 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,12 +4,13 @@
 
 	New packages: libcdaudio, libdvdnav, libdvdread, hostapd, tcpreplay
 
-	Updated/fixed packages: autoconf, bind, binutils, bootutils, busybox,
-	directfb, dnsmasq, e2fsprogs, gstreamer, gperf, gst-plugins-bad,
-	flex, hal, iptables, iw, jpeg, kismet, libfuse, libpcap, libungif,
-	lighttpd, mesa, mpg123, mtd-utils, neon, netstat-nat, openvpn, pcre,
-	qt, rpm, sdl, sdl_ttf, sqlite, sshfs, tremor, u-boot, usb_modeswitch,
-	usbutils, webkit, wpa_supplicant, xfsprogs
+	Updated/fixed packages: at, autoconf, bind, binutils, bootutils,
+	busybox, directfb, dnsmasq, e2fsprogs, gstreamer, gperf,
+	gst-plugins-bad, flex, hal, iptables, iw, jpeg, kismet, libfuse,
+	libpcap, libungif, lighttpd, mesa, mpg123, mtd-utils, neon,
+	netstat-nat, openvpn, pcre, qt, rpm, sdl, sdl_ttf, sqlite, sshfs,
+	tremor, u-boot, usb_modeswitch, usbutils, webkit, wpa_supplicant,
+	xfsprogs
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/at/at.mk b/package/at/at.mk
index f557a72..5b53c2c 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -38,6 +38,7 @@ $(AT_DIR)/.configured: $(AT_DIR)/.unpacked
 		--with-atspool=/var/lib/atspool \
 		--with-daemon_username=at \
 		--with-daemon_groupname=at \
+		SENDMAIL=/usr/sbin/sendmail \
 	)
 	touch $@
 
-- 
1.6.3.3

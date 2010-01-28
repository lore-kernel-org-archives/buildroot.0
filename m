From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 28 Jan 2010 17:33:03 +0100
Subject: [Buildroot] [git commit master] libxml2: bump to version 2.7.6
Message-ID: <20100128163327.BCBCA7774D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=98d5d81a1dfccdd09c29b18aac19b6331d07fabc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    8 ++++----
 package/libxml2/libxml2.mk |    4 +++-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index eff3baf..fcf5890 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,10 +7,10 @@
 	Updated/fixed packages: at, autoconf, bash, bind, binutils, bootutils,
 	busybox, directfb, dnsmasq, e2fsprogs, gstreamer, gperf,
 	gst-plugins-bad, flex, hal, iptables, iw, jpeg, kismet, libfuse,
-	libglib2, libpcap, libungif, lighttpd, mesa, mpg123, mtd-utils, neon,
-	netstat-nat, openvpn, pcre, qt, rpm, sawman, sdl, sdl_ttf, ser2net,
-	sqlite, sshfs, tremor, u-boot, usb_modeswitch, usbutils, webkit,
-	wpa_supplicant, xfsprogs
+	libglib2, libpcap, libungif, libxml2, lighttpd, mesa, mpg123,
+	mtd-utils, neon, netstat-nat, openvpn, pcre, qt, rpm, sawman, sdl,
+	sdl_ttf, ser2net, sqlite, sshfs, tremor, u-boot, usb_modeswitch,
+	usbutils, webkit, wpa_supplicant, xfsprogs
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index a554226..e598d36 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -3,11 +3,13 @@
 # libxml2
 #
 #############################################################
-LIBXML2_VERSION = 2.7.3
+LIBXML2_VERSION = 2.7.6
 LIBXML2_SOURCE = libxml2-sources-$(LIBXML2_VERSION).tar.gz
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_INSTALL_TARGET = YES
+#this is needed for version 2.7.4 and higher
+LIBXML2_LIBTOOL_PATCH = NO
 
 ifneq ($(BR2_LARGEFILE),y)
 LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
-- 
1.6.3.3

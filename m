From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 13:03:59 +0100
Subject: [Buildroot] [git commit master] package/bootutils: needs largefile
	support
Message-ID: <20091123120643.A21F577782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8fb74cdece55fe31eb87308c8c0cb99841085ad7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build fails with llseek() linker errors.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                     |    4 ++--
 package/bootutils/Config.in |    3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5245a0f..26bf3fa 100644
--- a/CHANGES
+++ b/CHANGES
@@ -20,8 +20,8 @@
 	New packages: divine, gvfs, libarchive, libmicrohttpd,
 	sdl_sound, swfdec, sysstat
 
-	Updated/fixed packages: alsamixergui, autoconf, busybox, gcc,
-	directfb, dnsmasq, e2fsprogs, festival, gstreamer, gst-plugins-bad,
+	Updated/fixed packages: alsamixergui, autoconf, bootutils, busybox,
+	gcc, directfb, dnsmasq, e2fsprogs, festival, gstreamer, gst-plugins-bad,
 	gst-plugins-base, gst-plugins-good, imagemagick, ipkg, iptables,
 	iw, kernel-headers, kismet, libelf, libevent, libglib2, libidn,
 	liblockfile, libmad, libpcap, libupnp, libuuid, lighttpd, ltrace,
diff --git a/package/bootutils/Config.in b/package/bootutils/Config.in
index c5254de..06a8fd8 100644
--- a/package/bootutils/Config.in
+++ b/package/bootutils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_BOOTUTILS
 	bool "bootutils"
+	depends on BR2_LARGEFILE
 	help
 	  BootUtils is a collection of utilities to facilitate booting of
 	  Linux 2.6-based systems. The process of finding the root volume
@@ -8,3 +9,5 @@ config BR2_PACKAGE_BOOTUTILS
 
 	  http://bootutils.pr.linuxrulz.org/
 
+comment "bootutils requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
-- 
1.6.3.3

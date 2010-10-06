From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Oct 2010 16:44:57 +0200
Subject: [Buildroot] [git commit master 1/1] directfb: bump version,
	unbreak png support
Message-ID: <20101006144718.E87718BE58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f8b8a48827c6c2aa8ab610e7552a36244d3d481b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The recent libpng bump broke png support in directfb, as it relied
on the legacy 1.2 interface. Fix it by bumping the directfb version,
and at the same time ensure that configure finds our cross-libpng-config
rather than what the host version the user might have in the path.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    6 +++---
 package/directfb/directfb.mk |    3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index c2ab972..c96bc4d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -25,9 +25,9 @@
 
 	Updated/fixed packages: acpid, alsa-lib, argus, at, autoconf,
 	automake, avahi, axel, beecrypt, berkeleydb, bind, bmon, boa,
-	bootutils, bridge-utils, bsdiff, busybox, cvs, dbus, dmraid,
-	docker, dosfstools, dropbear, e2fsprogs, expat, ezxml, fbset,
-	fconfig, ffmpeg, freetype, gadgetfs-test, gamin, gawk,
+	bootutils, bridge-utils, bsdiff, busybox, cvs, dbus, directfb,
+	dmraid, docker, dosfstools, dropbear, e2fsprogs, expat, ezxml,
+	fbset, fconfig, ffmpeg, freetype, gadgetfs-test, gamin, gawk,
 	genext2fs, gperf, gst-plugins-ugly, gtk2-themes, gtkperf,
 	gvfs, haserl, hdparm, hostapd, hwdata, ifplugd, imagemagick,
 	iperf, ipsec-tools, iproute2, iptables, iw, jpeg, kexec,
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index ccb0c5a..05d3673 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 DIRECTFB_VERSION_MAJOR:=1.4
-DIRECTFB_VERSION:=1.4.3
+DIRECTFB_VERSION:=1.4.5
 DIRECTFB_SITE:=http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_AUTORECONF = NO
@@ -104,6 +104,7 @@ endif
 ifeq ($(BR2_PACKAGE_DIRECTFB_PNG),y)
 DIRECTFB_PNG:=--enable-png
 DIRECTFB_DEP+= libpng
+DIRECTFB_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
 else
 DIRECTFB_PNG:=--disable-png
 endif
-- 
1.7.1

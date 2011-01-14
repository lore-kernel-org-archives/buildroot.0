From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Jan 2011 23:06:49 +0100
Subject: [Buildroot] [git commit master 1/1] kexec: bump to version 2.0.2 +
	change URL to match kernel.org
Message-ID: <20110114220756.A83CB8B528@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=87a5a194088f33f60176b4970526e7f6eb51de9b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3007

Changed the KEXEC_SITE to the new home of kexec. This patch also satisfies
bug #3007 created by me last month. Thanks to Gustavo for pointing out that
the easy fix was to bump kexec to 2.0.2.

Signed-of-by: Andy Kennedy <Andy.Kennedy@AdTran.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |   19 ++++++++++---------
 package/kexec/kexec.mk |    4 ++--
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index fd9da9c..bbc2d42 100644
--- a/CHANGES
+++ b/CHANGES
@@ -16,15 +16,15 @@
 	direcfb-examples, dmalloc, ed, ffmpeg, findutils, flac,
 	freetype, gdk-pixbuf, gmp, grep, gst-plugins-good, gvfs,
 	hostapd, i2c-tools, icu, input-tools, iproute2, iptables,
-	jpeg, libaio, libcap, libconfig, libglib2, libogg, libtheora,
-	libtool, libvorbis, libxml2, libxslt, linux-fusion, lsof,
-	ltp-testsuite, ltrace, lvm2, m4, makedevs, memtester, mesa3d,
-	mii-diag, mpc, mpfr, mplayer, mrouted, nano, netperf, netplug,
-	openssh, openssl, openvpn, oprofile, pango, patch, pciutils,
-	php, portmap, qt, rsync, screen, sdl_gfx, sdl_sound, sqlite,
-	squid, sstrip, sysklogd, sysvinit, tar, tslib, udev, usbutils,
-	vim, vtun, webkit, xapp_xlogo, xkeyboard-config, xlib_libX11,
-	xz, zlib
+	jpeg, kexec, libaio, libcap, libconfig, libglib2, libogg,
+	libtheora, libtool, libvorbis, libxml2, libxslt, linux-fusion,
+	lsof, ltp-testsuite, ltrace, lvm2, m4, makedevs, memtester,
+	mesa3d, mii-diag, mpc, mpfr, mplayer, mrouted, nano, netperf,
+	netplug, openssh, openssl, openvpn, oprofile, pango, patch,
+	pciutils, php, portmap, qt, rsync, screen, sdl_gfx, sdl_sound,
+	sqlite, squid, sstrip, sysklogd, sysvinit, tar, tslib, udev,
+	usbutils, vim, vtun, webkit, xapp_xlogo, xkeyboard-config,
+	xlib_libX11, xz, zlib
 
 	New packages: dhrystone, fbgrab, irda-utils, libao, lsuio,
 	rsh-redone, sdparm, vorbis-tools, whetstone, xl2tp
@@ -43,6 +43,7 @@
 	#2929: genext2fs: couldn't allocate a block (no free space)
 	#2965: Broken linkage to xkbcomp (blocking X server startup)
 	#2983: xlib_libX11 build failed
+	#3007: kexec doesn't build: Missing regdef.h file
 
 2010.11, Released November 30th, 2010:
 
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 417e94e..43a0614 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -3,9 +3,9 @@
 # kexec
 #
 #############################################################
-KEXEC_VERSION = 2.0.1
+KEXEC_VERSION = 2.0.2
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.bz2
-KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/horms/kexec-tools/
+KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 
 ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
 KEXEC_CONF_OPT += --with-zlib
-- 
1.7.2.2

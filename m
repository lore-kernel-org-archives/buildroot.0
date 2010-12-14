From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Dec 2010 01:35:41 +0100
Subject: [Buildroot] [git commit master 1/1] libtheora: bump version to 1.1.1
Message-ID: <20101214003644.6B21E82927@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fc13fc7b57844429e09bd49d84f86b54971fc487
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows to disable the build of the format specification
documentation, which was causing issues in cross-compiling mode.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                   |    4 ++--
 package/multimedia/libtheora/libtheora.mk |    5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2c08519..9905428 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,8 +5,8 @@
 
 	Updated/fixed packages: alsa-utils, at, busybox, bzip2, dbus,
 	direcfb-examples, dmalloc, cloop, cups, ffmpeg, gdk-pixbuf,
-	hostapd, i2c-tools, input-tools, libaio, libconfig, lsof,
-	ltp-testsuite, lvm2, m4, memtester, mii-diag, mplayer,
+	hostapd, i2c-tools, input-tools, libaio, libconfig, libtheora,
+	lsof, ltp-testsuite, lvm2, m4, memtester, mii-diag, mplayer,
 	mrouted, netplug, openssh, openssl, openvpn, pango, qt, rsync,
 	sdl_gfx, sdl_sound, sysklogd, sysvinit, udev, usbutils, xz,
 	zlib
diff --git a/package/multimedia/libtheora/libtheora.mk b/package/multimedia/libtheora/libtheora.mk
index 81eb83f..e572d1a 100644
--- a/package/multimedia/libtheora/libtheora.mk
+++ b/package/multimedia/libtheora/libtheora.mk
@@ -3,7 +3,7 @@
 # libtheora
 #
 #############################################################
-LIBTHEORA_VERSION = 1.0
+LIBTHEORA_VERSION = 1.1.1
 LIBTHEORA_SOURCE = libtheora-$(LIBTHEORA_VERSION).tar.bz2
 LIBTHEORA_SITE = http://downloads.xiph.org/releases/theora
 LIBTHEORA_INSTALL_STAGING = YES
@@ -12,7 +12,8 @@ LIBTHEORA_CONF_OPT = \
 		--disable-oggtest \
 		--disable-vorbistest \
 		--disable-sdltest \
-		--disable-examples
+		--disable-examples \
+		--disable-spec
 
 LIBTHEORA_DEPENDENCIES = libogg libvorbis host-pkg-config
 
-- 
1.7.2.2

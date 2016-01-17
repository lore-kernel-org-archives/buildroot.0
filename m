From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jan 2016 22:18:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/mplayer: add optional dependencies
	to libgl, libvpx and opus
Message-ID: <1453065500-26441-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mplayer links to these packages when present:

output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/mplayer | grep NEEDED | grep "opus\|vpx\|GL"
 0x0000000000000001 (NEEDED)             Shared library: [libopus.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libvpx.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libGL.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 3051afa..2082f25 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -231,9 +231,12 @@ MPLAYER_CONF_OPTS += --disable-liblzo
 endif
 
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_BZIP2),bzip2)
+MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_HAS_LIBGL),libgl)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBTHEORA),libtheora)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
+MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBVPX),libvpx)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_JPEG),jpeg)
+MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_OPUS),opus)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_XLIB_LIBX11),xlib_libX11)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_XLIB_LIBXEXT),xlib_libXext)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_XLIB_LIBXINERAMA),xlib_libXinerama)
-- 
2.7.0.rc3

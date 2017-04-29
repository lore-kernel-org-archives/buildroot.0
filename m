From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 15:28:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: remove RPi-specific
	restriction from Config.in
Message-ID: <20170429132834.21545-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Requested by Thomas:
http://lists.busybox.net/pipermail/buildroot/2017-April/190780.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index efa9196f46..c381745eef 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -28,7 +28,6 @@ config BR2_PACKAGE_KODI_GL_EGL
 	default y
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGL
-	depends on !BR2_PACKAGE_RPI_USERLAND # rpi depends on gles
 
 comment "kodi needs an OpenGL EGL with either an openGL or an OpenGL ES backend"
 	depends on !BR2_PACKAGE_KODI_GL_EGL && !BR2_PACKAGE_KODI_EGL_GLES
-- 
2.11.0

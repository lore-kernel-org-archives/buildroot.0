From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Apr 2017 17:55:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: fix typos for libva/libvdpau
	dependencies
Message-ID: <20170430155540.21997-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 6bc81338a..d7b269245 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -240,25 +240,25 @@ config BR2_PACKAGE_KODI_LIBUSB
 
 config BR2_PACKAGE_KODI_LIBVA
 	bool "va"
-	depends on BR2_PACKAGE_KODI_EGL_GL
+	depends on BR2_PACKAGE_KODI_GL_EGL
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBVA
 	help
 	  Enable libva support.
 
 comment "libva support needs X.org with an openGL backend"
-	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_KODI_EGL_GL
+	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_KODI_GL_EGL
 
 config BR2_PACKAGE_KODI_LIBVDPAU
 	bool "vdpau"
-	depends on BR2_PACKAGE_KODI_EGL_GL
+	depends on BR2_PACKAGE_KODI_GL_EGL
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBVDPAU
 	help
 	  Enable libvdpau support.
 
 comment "libvdpau support needs X.org with an openGL backend"
-	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_KODI_EGL_GL
+	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_KODI_GL_EGL
 
 config BR2_PACKAGE_KODI_UPNP
 	bool "upnp"
-- 
2.11.0

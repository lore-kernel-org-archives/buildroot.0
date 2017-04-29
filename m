From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 14:42:52 +0200
Subject: [Buildroot] [git commit] package/kodi: optimise libva/libvdpau
	dependencies
Message-ID: <20170429124308.656A982767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b556a9e06a05af9a064de138dbba7e109e1cd6db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Suggested by Thomas:
http://lists.busybox.net/pipermail/buildroot/2017-April/190703.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index fc40343..613cf48 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -241,25 +241,25 @@ config BR2_PACKAGE_KODI_LIBUSB
 
 config BR2_PACKAGE_KODI_LIBVA
 	bool "va"
-	depends on !BR2_PACKAGE_KODI_EGL_GLES
+	depends on BR2_PACKAGE_KODI_EGL_GL
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBVA
 	help
 	  Enable libva support.
 
 comment "libva support needs X.org with an openGL backend"
-	depends on !BR2_PACKAGE_XORG7 || BR2_PACKAGE_KODI_EGL_GLES
+	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_KODI_EGL_GL
 
 config BR2_PACKAGE_KODI_LIBVDPAU
 	bool "vdpau"
-	depends on !BR2_PACKAGE_KODI_EGL_GLES
+	depends on BR2_PACKAGE_KODI_EGL_GL
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBVDPAU
 	help
 	  Enable libvdpau support.
 
 comment "libvdpau support needs X.org with an openGL backend"
-	depends on !BR2_PACKAGE_XORG7 || BR2_PACKAGE_KODI_EGL_GLES
+	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_KODI_EGL_GL
 
 config BR2_PACKAGE_KODI_UPNP
 	bool "upnp"

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Apr 2017 23:04:21 +0200
Subject: [Buildroot] [git commit] package/kodi: fix typos for libva/libvdpau
	dependencies
Message-ID: <20170430210624.426F0825B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1595feb0e6defde4d890a2aaf62d158d3d04575
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 6bc8133..d7b2692 100644
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

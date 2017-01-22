From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jan 2017 17:40:07 +1100
Subject: [Buildroot] [git commit]
	package/x11r7/xdriver_xf86-video-openchrome: needs DRI
Message-ID: <20170122064025.2C8E681807@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39a7be29b38473674db27a361795829d85a51a2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/89c/89c9641553734495aa7844951dfd25fe0ec0d9f9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-video-openchrome/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-openchrome/Config.in b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
index e2bb6c4..c970b9e 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/Config.in
+++ b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME
 	bool "xf86-video-openchrome"
-	depends on BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
@@ -17,5 +17,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME
 
 	  https://www.freedesktop.org/wiki/Openchrome/
 
-comment "xf86-video-openchrome needs mesa3d"
-	depends on !BR2_PACKAGE_MESA3D
+comment "xf86-video-openchrome needs a DRI driver from mesa3d"
+	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER

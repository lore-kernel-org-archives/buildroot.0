From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Jan 2017 21:59:29 +0100
Subject: [Buildroot] [PATCH 1/1]
	package/x11r7/xdriver_xf86-video-openchrome: needs DRI
Message-ID: <20170121205929.9516-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/89c/89c9641553734495aa7844951dfd25fe0ec0d9f9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-openchrome/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-openchrome/Config.in b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
index e2bb6c490..c970b9e25 100644
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
-- 
2.11.0

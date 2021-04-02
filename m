From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  2 Apr 2021 08:09:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-ati: add
 missing dependency
Message-ID: <20210402060939.643516-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the following build failure which is raised since commit
a3aac6d84713db7e6d2683eabf965eae21ce48bf:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
  Depends on [n]: BR2_PACKAGE_MESA3D [=y] && (BR2_i386 [=n] || BR2_x86_64 [=n])
  Selected by [y]:
  - BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI [=y] && BR2_PACKAGE_XORG7 [=y] && BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR [=y] && BR2_PACKAGE_MESA3D [=y]

Fixes:
 - http://autobuild.buildroot.org/results/36773085f933ab2ee558f53a6c0ae5365077ad5e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xdriver_xf86-video-ati/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index fdf1ebd18b..1246014dca 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	bool "xf86-video-ati"
+	depends on BR2_i386 || BR2_x86_64 # DRI radeon r100 driver
 	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_RADEON
@@ -10,4 +11,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	  ATI video driver
 
 comment "xf86-video-ati needs mesa3d"
+	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_PACKAGE_MESA3D
-- 
2.30.2

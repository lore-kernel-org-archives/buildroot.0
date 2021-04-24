From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Apr 2021 16:29:04 +0200
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/x11r7/xdriver_xf86-video-ati: add missing dependency
Message-ID: <20210424140425.2AD7385F0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b47e4d3f1f554e99067a5fb3c8f63f116dbbc81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix the following build failure which is raised since commit
a3aac6d84713db7e6d2683eabf965eae21ce48bf:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
  Depends on [n]: BR2_PACKAGE_MESA3D [=y] && (BR2_i386 [=n] || BR2_x86_64 [=n])
  Selected by [y]:
  - BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI [=y] && BR2_PACKAGE_XORG7 [=y] && BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR [=y] && BR2_PACKAGE_MESA3D [=y]

Fixes:
 - http://autobuild.buildroot.org/results/36773085f933ab2ee558f53a6c0ae5365077ad5e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6aa602e783ebafad270aaaf94b4c37350d41c0a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

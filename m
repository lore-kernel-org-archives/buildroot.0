From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 22:53:39 +0200
Subject: [Buildroot] [git commit] package/xdriver_xf86-video-ati: only
	select libdrm if the DRI driver is enabled
Message-ID: <20140417210125.20ED49C80A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ecf3f78dd85539f1758ac142e4e15bf7993a04f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The xf86 radeon driver does not need libdrm, unless DRI is enabled too.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-video-ati/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index 3c0cac3..d8bb029 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	bool "xf86-video-ati"
-	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_LIBDRM_RADEON
+	select BR2_PACKAGE_LIBDRM        if BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
+	select BR2_PACKAGE_LIBDRM_RADEON if BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_GLPROTO

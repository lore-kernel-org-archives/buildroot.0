From: Lada Trimasova <Lada.Trimasova@synopsys.com>
Date: Wed, 23 Dec 2015 15:49:52 +0300
Subject: [Buildroot] [PATCH v2 2/2] Fixing xdriver_xf86-video-ati
	dependencies
In-Reply-To: <1450874992-15627-1-git-send-email-ltrimas@synopsys.com>
References: <1450874992-15627-1-git-send-email-ltrimas@synopsys.com>
Message-ID: <1450874992-15627-3-git-send-email-ltrimas@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package depends on the radeon driver from libdrm and depends on
DRI support in xserver_xorg-server, to achieve this we select the
Radeon mesa3d DRI driver.

Fixes:
http://autobuild.buildroot.net/results/9da/9da4ffdf1c4ec78ae37322e253cb769340116035

Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xdriver_xf86-video-ati/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index 191c20f..00d91bd 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	bool "xf86-video-ati"
 	depends on BR2_PACKAGE_MESA3D
-	select BR2_PACKAGE_LIBDRM        if BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
-	select BR2_PACKAGE_LIBDRM_RADEON if BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBDRM_RADEON
+	select BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_GLPROTO
-- 
2.5.0

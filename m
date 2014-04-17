From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Apr 2014 18:04:14 +0200
Subject: [Buildroot] [PATCH 02/14] package/xdriver_xf86-video-ati: only
	select libdrm if the DRI driver is enabled
In-Reply-To: <cover.1397750571.git.yann.morin.1998@free.fr>
References: <cover.1397750571.git.yann.morin.1998@free.fr>
Message-ID: <f991cdcd142a4ea94b5a2cec789cf487fa4c7b95.1397750571.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The xf86 radeon driver does not need libdrm, unless DRI is enabled too.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/x11r7/xdriver_xf86-video-ati/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.8.3.2

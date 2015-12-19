From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Dec 2015 17:53:35 +0100
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xdriver_xf86-video-nouveau:
	Fix DRI dependency
In-Reply-To: <1450544015-17658-1-git-send-email-bernd.kuhls@t-online.de>
References: <1450544015-17658-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1450544015-17658-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-nouveau/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-nouveau/Config.in b/package/x11r7/xdriver_xf86-video-nouveau/Config.in
index 7e756e2..5fe659c 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/Config.in
+++ b/package/x11r7/xdriver_xf86-video-nouveau/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NOUVEAU
 	bool "xf86-video-nouveau"
 	depends on BR2_PACKAGE_MESA3D
+	# package depends on DRI support in xserver_xorg-server
+	# libdrm locking macros use armv6+ instructions on arm
+	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_NOUVEAU
@@ -16,3 +19,4 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NOUVEAU
 
 comment "xf86-video-nouveau needs mesa3d"
 	depends on !BR2_PACKAGE_MESA3D
+	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
-- 
2.6.4

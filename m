From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  7 Apr 2013 20:50:59 -0300
Subject: [Buildroot] [PATCH] xdriver_xf86-video-intel: only available for
	i386 and x86_64
Message-ID: <1365378659-9593-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build failures on other architectures.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xdriver_xf86-video-intel/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xdriver_xf86-video-intel/Config.in b/package/x11r7/xdriver_xf86-video-intel/Config.in
index 595eae5..c972ce1 100644
--- a/package/x11r7/xdriver_xf86-video-intel/Config.in
+++ b/package/x11r7/xdriver_xf86-video-intel/Config.in
@@ -7,5 +7,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
 	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_MESA3D
+	depends on (BR2_i386 || BR2_x86_64)
 	help
 	  Intel video driver
-- 
1.8.1.5

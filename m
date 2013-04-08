From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  7 Apr 2013 21:25:59 -0300
Subject: [Buildroot] [PATCH] xdriver_xf86-video-geode: only available for
	i386 and x86_64
Message-ID: <1365380759-14946-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Builtin-video from NSC/AMD Geode x86 processors.
Fixes build failures on other architectures.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xdriver_xf86-video-geode/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xdriver_xf86-video-geode/Config.in b/package/x11r7/xdriver_xf86-video-geode/Config.in
index 2d2e5bc..2b868d0 100644
--- a/package/x11r7/xdriver_xf86-video-geode/Config.in
+++ b/package/x11r7/xdriver_xf86-video-geode/Config.in
@@ -5,5 +5,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on (BR2_i386 || BR2_x86_64)
 	help
 	  video driver for geode device
-- 
1.8.1.5

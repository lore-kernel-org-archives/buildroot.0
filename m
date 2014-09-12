From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 12 Sep 2014 17:50:00 +0200
Subject: [Buildroot] [PATCH 01/12] xdriver_xf86-video-vmware: only
	avaiblable on x86
In-Reply-To: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
Message-ID: <1410537011-29662-2-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... since BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA is only available on x86.

Fix warnings like:
  warning: (BR2_PACKAGE_XDRIVER_XF86_VIDEO_VMWARE) selects
  BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA which has unmet direct dependencies
  (BR2_PACKAGE_MESA3D && (BR2_i386 || BR2_x86_64))

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/x11r7/xdriver_xf86-video-vmware/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xdriver_xf86-video-vmware/Config.in b/package/x11r7/xdriver_xf86-video-vmware/Config.in
index 2e6b24d..a3382d7 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/Config.in
+++ b/package/x11r7/xdriver_xf86-video-vmware/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VMWARE
 	bool "xf86-video-vmware"
 	depends on BR2_PACKAGE_MESA3D
+	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
-- 
2.1.0

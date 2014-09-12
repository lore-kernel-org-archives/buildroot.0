From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Sep 2014 22:59:40 +0200
Subject: [Buildroot] [git commit] xdriver_xf86-video-vmware: only avaiblable
	on x86
Message-ID: <20140913074255.534479D688@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cf27d406181e94e479ed555c353f6d1caa08b26e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... since BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA is only available on x86.

Fix warnings like:
  warning: (BR2_PACKAGE_XDRIVER_XF86_VIDEO_VMWARE) selects
  BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA which has unmet direct dependencies
  (BR2_PACKAGE_MESA3D && (BR2_i386 || BR2_x86_64))

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xdriver_xf86-video-vmware/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 15:56:32 +0200
Subject: [Buildroot] [git commit] xdriver_xf86-video-intel: only available
	for i386 and x86_64
Message-ID: <20130411140826.3C1889B586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f5de0c465c9a15fbf63357d390510e27667e47d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build failures on other architectures.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xdriver_xf86-video-intel/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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

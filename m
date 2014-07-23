From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Wed, 23 Jul 2014 15:01:54 +0300
Subject: [Buildroot] [PATCH] rpi-userland: add missing library in .pc file
Message-ID: <1406116914-2565-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/8df/8dfb6cba6ea27af253b391cdd355a456382f17a4/

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch b/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
index 848e49d..e88f810 100644
--- a/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
+++ b/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
@@ -19,7 +19,7 @@ Index: b/interface/khronos/egl/egl.pc.in
 +Name: egl
 +Description: RasberryPi implementation of EGL
 +Version: 10
-+Libs: -L${libdir} -lEGL -lGLESv2 -lbcm_host
++Libs: -L${libdir} -lEGL -lGLESv2 -lbcm_host -lvchostif
 +Cflags: -I${includedir}/ -I${includedir}/interface/vcos/pthreads/ \
 +        -I${includedir}/interface/vmcs_host/linux/
 Index: b/interface/khronos/CMakeLists.txt
-- 
1.9.1

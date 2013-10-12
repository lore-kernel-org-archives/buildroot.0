From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Oct 2013 00:46:16 +0200
Subject: [Buildroot] [PATCH 2/2] package/rpi-userland: expose appropriate
	EGL version
In-Reply-To: <cover.1381617928.git.yann.morin.1998@free.fr>
References: <cover.1381617928.git.yann.morin.1998@free.fr>
Message-ID: <843868f55c7fddce02d5cd45525fe36bbbca5e76.1381617928.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The egl.pc file installed exposes version 1.0, while it really is a
much higher version.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Note: version 1.0 causes build failures for weston, which fails at
./configure with this error message:
    Package 'egl' has version '1.0', required version is '>= 7.10'

Do as the Collabora guys do, and expose version 10:
    http://cgit.collabora.com/git/user/pq/android-pc-files.git/tree/pkgconfig/egl.pc?h=raspberrypi
---
 package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch b/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
index d7984ff..848e49d 100644
--- a/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
+++ b/package/rpi-userland/rpi-userland-000-add-pkgconfig-files.patch
@@ -18,7 +18,7 @@ Index: b/interface/khronos/egl/egl.pc.in
 +
 +Name: egl
 +Description: RasberryPi implementation of EGL
-+Version: 1.0
++Version: 10
 +Libs: -L${libdir} -lEGL -lGLESv2 -lbcm_host
 +Cflags: -I${includedir}/ -I${includedir}/interface/vcos/pthreads/ \
 +        -I${includedir}/interface/vmcs_host/linux/
-- 
1.8.1.2

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 9 Mar 2013 22:25:41 +0100
Subject: [Buildroot] [git commit] rpi-userland: add bcm_host to egl.pc
Message-ID: <20130309212739.C40F49AF4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e1fb3f7c42817495e5b25fe0c85c655720c8d4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bcm_host is the Broadcom hardware interface library
And is currently a dependency to use the EGL functions

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../rpi-userland-add-pkgconfig-files.patch         |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/rpi-userland/rpi-userland-add-pkgconfig-files.patch b/package/rpi-userland/rpi-userland-add-pkgconfig-files.patch
index 0da9afd..4ffc2b0 100644
--- a/package/rpi-userland/rpi-userland-add-pkgconfig-files.patch
+++ b/package/rpi-userland/rpi-userland-add-pkgconfig-files.patch
@@ -9,7 +9,7 @@ Index: b/interface/khronos/egl/egl.pc.in
 ===================================================================
 --- /dev/null
 +++ b/interface/khronos/egl/egl.pc.in
-@@ -0,0 +1,10 @@
+@@ -0,0 +1,11 @@
 +prefix=@CMAKE_INSTALL_PREFIX@
 +exec_prefix=${prefix}
 +libdir=${exec_prefix}/lib
@@ -18,8 +18,9 @@ Index: b/interface/khronos/egl/egl.pc.in
 +Name: egl
 +Description: RasberryPi implementation of EGL
 +Version: 1.0
-+Libs: -L${libdir} -lEGL -lGLESv2
-+Cflags: -I${includedir}/ -I${includedir}/interface/vcos/pthreads/
++Libs: -L${libdir} -lEGL -lGLESv2 -lbcm_host
++Cflags: -I${includedir}/ -I${includedir}/interface/vcos/pthreads/ \
++        -I${includedir}/interface/vmcs_host/linux/
 Index: b/interface/khronos/CMakeLists.txt
 ===================================================================
 --- a/interface/khronos/CMakeLists.txt

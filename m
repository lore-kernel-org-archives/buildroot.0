From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Mar 2013 21:18:33 +0100
Subject: [Buildroot] [PATCH 05/32] rpi-userland: add bcm_host to egl.pc
In-Reply-To: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362687540-19440-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362687540-19440-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Floris Bos <bos@je-eigen-domein.nl>

bcm_host is the Broadcom hardware interface library
And is currently a dependency to use the EGL functions

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../rpi-userland-add-pkgconfig-files.patch         |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

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
-- 
1.7.9.5

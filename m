From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 Aug 2020 12:06:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcamera: disable werror
Message-ID: <20200816100656.979726-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will fix the following build failure:

../src/gstreamer/gstlibcameraallocator.cpp: In static member function 'static GQuark FrameWrap::getQuark()':
/home/peko/autobuild/instance-1/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib/gatomic.h:128:15: error: variable 'gapg_temp_atomic' set but not used [-Werror=unused-but-set-variable]
     gpointer *gapg_temp_atomic = (gpointer *)(atomic);                       \
               ^

Fixes:
 - http://autobuild.buildroot.org/results/c28500d4cc55fbd2bac87f2c11759ddc9163bc91

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcamera/libcamera.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 9739f715a1..34911cee79 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -15,7 +15,8 @@ LIBCAMERA_DEPENDENCIES = \
 LIBCAMERA_CONF_OPTS = \
 	-Dandroid=false \
 	-Ddocumentation=false \
-	-Dtest=false
+	-Dtest=false \
+	-Dwerror=false
 LIBCAMERA_INSTALL_STAGING = YES
 LIBCAMERA_LICENSE = \
 	LGPL-2.1+ (library), \
-- 
2.27.0

From: Brendan Heading <brendanheading@gmail.com>
Date: Sun,  2 Aug 2015 20:45:42 +0100
Subject: [Buildroot] [PATCH 1/1] packages/x11r7/libepoxy - fix compilation
	issue
Message-ID: <1438544742-3372-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/f7e/f7e6a42f53cb4ca523d2eeefde85c44770f6011e/

libepoxy expects to find EGL/eglplatform.h which is provided by
mesa3d when --enable-egl is passed.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 package/x11r7/libepoxy/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/libepoxy/Config.in b/package/x11r7/libepoxy/Config.in
index c4f5794..eb6fa85 100644
--- a/package/x11r7/libepoxy/Config.in
+++ b/package/x11r7/libepoxy/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBEPOXY
 	bool "epoxy"
 	depends on BR2_PACKAGE_MESA3D
+	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
 	  Epoxy is a library for handling OpenGL function pointer management for you.
 
-- 
2.4.3

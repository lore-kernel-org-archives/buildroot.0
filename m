From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  3 Nov 2019 09:55:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/piglit: set python executable
Message-ID: <20191103085520.9095-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this change, piglit will detect and use python from host
resulting in build failures if python-mako, python-numpy or python-six
are not installed

Fixes:
 - http://autobuild.buildroot.org/results/8d782589b6073031626fd769982a0844f3731906

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/piglit/piglit.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
index 4f95e77cfd..d4753b9f7a 100644
--- a/package/piglit/piglit.mk
+++ b/package/piglit/piglit.mk
@@ -29,7 +29,8 @@ PIGLIT_DEPENDENCIES = host-pkgconf \
 PIGLIT_CONF_OPTS += \
 	-DPIGLIT_USE_WAFFLE=ON \
 	-DPIGLIT_BUILD_CL_TESTS=OFF \
-	-DPIGLIT_BUILD_WGL_TESTS=OFF
+	-DPIGLIT_BUILD_WGL_TESTS=OFF \
+	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 # libxcb for xcb-dri2
-- 
2.23.0

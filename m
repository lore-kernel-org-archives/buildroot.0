From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:35:32 +0100
Subject: [Buildroot] [git commit] package/piglit: set python executable
Message-ID: <20191104212833.A57C88E704@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad3570e457cc6e3c0869fa486aab6b9b6af94fce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without this change, piglit will detect and use python from host
resulting in build failures if python-mako, python-numpy or python-six
are not installed

Fixes:
 - http://autobuild.buildroot.org/results/8d782589b6073031626fd769982a0844f3731906

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

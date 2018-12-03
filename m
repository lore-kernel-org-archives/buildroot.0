From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 23:07:30 +0100
Subject: [Buildroot] [git commit] package/mesa3d-headers: install OpenCL
 headers when needed
Message-ID: <20181203220540.DE6688A62B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c1336533de82a39254eebe545f03aefa6708006
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index e80e222c65..55101b2201 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -63,6 +63,10 @@ ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 MESA3D_HEADERS_DIRS += GLES GLES2
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_LIBOPENCL),y)
+MESA3D_HEADERS_DIRS += CL
+endif
+
 define MESA3D_HEADERS_BUILD_CMDS
 	$(MESA3D_HEADERS_BUILD_DRI_PC)
 endef

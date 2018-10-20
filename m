From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 00:14:34 +0200
Subject: [Buildroot] [PATCH 3/6] package/mesa3d-headers: install OpenCL
 headers when needed
In-Reply-To: <20181020221437.12687-1-thomas.petazzoni@bootlin.com>
References: <20181020221437.12687-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181020221437.12687-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index c3eaaac3d8..a337e76cea 100644
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
-- 
2.14.4

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Nov 2012 23:24:01 +0100
Subject: [Buildroot] [PATCH 03/10] mesa3d: requires host-libxml2 and
	host-python to generate some files
In-Reply-To: <cover.1353191025.git.thomas.petazzoni@free-electrons.com>
References: <cover.1353191025.git.thomas.petazzoni@free-electrons.com>
Message-ID: <92f919e81319668ae5139649ad177211e995d897.1353191025.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vellemans Noel <noel.vellemans@visionbms.com>

mesa3d now generates some C files at build time (related to the OpenGL
API) from XML files. This generation process is done using Python
scripts that require the libxml2 Python module.

Patch based on the initial work of Will Wagner (Thanks Will).

Signed-off-by: Vellemans Noel <noel.vellemans@visionbms.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/mesa3d/Config.in |    1 +
 package/x11r7/mesa3d/mesa3d.mk |    4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/mesa3d/Config.in b/package/x11r7/mesa3d/Config.in
index 47ded29..e5b426e 100644
--- a/package/x11r7/mesa3d/Config.in
+++ b/package/x11r7/mesa3d/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_DRI2PROTO
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_HOST_LIBXML2_PYTHON
 	depends on BR2_PACKAGE_XSERVER_xorg
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index 8d311e1..b16d5e6 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -28,6 +28,8 @@ MESA3D_DEPENDENCIES = \
 	xproto_dri2proto \
 	libdrm \
 	expat \
-	host-xutil_makedepend
+	host-xutil_makedepend \
+	host-libxml2 \
+	host-python
 
 $(eval $(autotools-package))
-- 
1.7.9.5

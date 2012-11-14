From: Noel vellemans <noel.vellemans@visionbms.com>
Date: Wed, 14 Nov 2012 10:10:24 +0100
Subject: [Buildroot] [PATCH 1/1] mesa3d: build with host library with python
	support
Message-ID: <1352884224-16467-1-git-send-email-noel.vellemans@visionbms.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vellemans Noel <noel.vellemans@visionbms.com>


Patch based on the initial work of Will Wagner (Thanks Will).
libxml2 host library with python support is required to build mesa3d

Signed-off-by: Vellemans Noel <noel.vellemans@visionbms.com>
---
 package/x11r7/mesa3d/Config.in |    1 +
 package/x11r7/mesa3d/mesa3d.mk |    4 +++-
 2 files changed, 4 insertions(+), 1 deletions(-)

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
index 8d311e1..24d8269 100644
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
1.7.1

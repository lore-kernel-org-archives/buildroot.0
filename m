From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 21:15:44 +0200
Subject: [Buildroot] [git commit] package/mesa3d: Add option to build OSMesa
Message-ID: <20151013191549.CA50181E7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=81537f284f62c6586d50bd5cca78c2bf1375b88c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr???? Hentschel <nerv@dawncrow.de>
Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in |    7 +++++++
 package/mesa3d/mesa3d.mk |    6 ++++++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index a658986..fdeb599 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -117,6 +117,13 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 
 endif # BR2_PACKAGE_XORG7
 
+comment "Off-screen Rendering"
+
+config BR2_PACKAGE_MESA3D_OSMESA
+	bool "OSMesa library"
+	help
+	  The OSMesa API provides functions for making off-screen renderings.
+
 if BR2_PACKAGE_MESA3D_DRIVER
 
 comment "Additional API Support"
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 84ad25e..8097575 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -110,6 +110,12 @@ endif
 
 # APIs
 
+ifeq ($(BR2_PACKAGE_MESA3D_OSMESA),y)
+MESA3D_CONF_OPTS += --enable-osmesa
+else
+MESA3D_CONF_OPTS += --disable-osmesa
+endif
+
 # Always enable OpenGL:
 #   - it is needed for GLES (mesa3d's ./configure is a bit weird)
 #   - but if no DRI driver is enabled, then libgl is not built,

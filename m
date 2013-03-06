From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Mar 2013 22:18:39 +0100
Subject: [Buildroot] [git commit] rpi-userland: provides OpenGL ES,
	EGL and OpenVG
Message-ID: <20130306212505.BFBE69AEFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=203c30796e232faaf3a7de19090657bf3e7db16a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/opengl/libegl/libegl.mk       |    4 ++++
 package/opengl/libgles/libgles.mk     |    4 ++++
 package/opengl/libopenvg/libopenvg.mk |    4 ++++
 package/rpi-userland/Config.in        |    3 +++
 4 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/opengl/libegl/libegl.mk b/package/opengl/libegl/libegl.mk
index 56cc8ac..c495496 100644
--- a/package/opengl/libegl/libegl.mk
+++ b/package/opengl/libegl/libegl.mk
@@ -6,6 +6,10 @@
 
 LIBEGL_SOURCE =
 
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+LIBEGL_DEPENDENCIES += rpi-userland
+endif
+
 ifeq ($(LIBEGL_DEPENDENCIES),y)
 define LIBEGL_CONFIGURE_CMDS
 	echo "No libEGL implementation selected. Configuration error."
diff --git a/package/opengl/libgles/libgles.mk b/package/opengl/libgles/libgles.mk
index 753f53e..f0d0eec 100644
--- a/package/opengl/libgles/libgles.mk
+++ b/package/opengl/libgles/libgles.mk
@@ -6,6 +6,10 @@
 
 LIBGLES_SOURCE =
 
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+LIBGLES_DEPENDENCIES += rpi-userland
+endif
+
 ifeq ($(LIBGLES_DEPENDENCIES),y)
 define LIBGLES_CONFIGURE_CMDS
 	echo "No libGLES implementation selected. Configuration error."
diff --git a/package/opengl/libopenvg/libopenvg.mk b/package/opengl/libopenvg/libopenvg.mk
index 2fcc99f..573fa78 100644
--- a/package/opengl/libopenvg/libopenvg.mk
+++ b/package/opengl/libopenvg/libopenvg.mk
@@ -6,6 +6,10 @@
 
 LIBOPENVG_SOURCE =
 
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+LIBOPENVG_DEPENDENCIES += rpi-userland
+endif
+
 ifeq ($(LIBOPENVG_DEPENDENCIES),y)
 define LIBOPENVG_CONFIGURE_CMDS
 	echo "No libOpenVG implementation selected. Configuration error."
diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 58ea8cb..2c35fb7 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_RPI_USERLAND
 	depends on BR2_arm
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_HAS_OPENGL_EGL
+	select BR2_PACKAGE_HAS_OPENGL_ES
+	select BR2_PACKAGE_HAS_OPENVG
 	help
 	  Raspberry Pi Userland contains the necessary library to use the
 	  VideoCore driver.

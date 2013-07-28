From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 17:08:09 +0200
Subject: [Buildroot] [git commit] opengl: add sunxi-mali as possible
	egl/gles provider
Message-ID: <20130728152108.80E6199C90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f08cad9a33c2c4549562d195d9925d97df26179
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opengl/libegl/libegl.mk   |    4 ++++
 package/opengl/libgles/libgles.mk |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/opengl/libegl/libegl.mk b/package/opengl/libegl/libegl.mk
index 84ee28c..97a4b85 100644
--- a/package/opengl/libegl/libegl.mk
+++ b/package/opengl/libegl/libegl.mk
@@ -14,6 +14,10 @@ ifeq ($(BR2_PACKAGE_TI_GFX),y)
 LIBEGL_DEPENDENCIES += ti-gfx
 endif
 
+ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
+LIBEGL_DEPENDENCIES += sunxi-mali
+endif
+
 ifeq ($(LIBEGL_DEPENDENCIES),)
 define LIBEGL_CONFIGURE_CMDS
 	echo "No libEGL implementation selected. Configuration error."
diff --git a/package/opengl/libgles/libgles.mk b/package/opengl/libgles/libgles.mk
index 1b62a19..2945496 100644
--- a/package/opengl/libgles/libgles.mk
+++ b/package/opengl/libgles/libgles.mk
@@ -14,6 +14,10 @@ ifeq ($(BR2_PACKAGE_TI_GFX),y)
 LIBGLES_DEPENDENCIES += ti-gfx
 endif
 
+ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
+LIBGLES_DEPENDENCIES += sunxi-mali
+endif
+
 ifeq ($(LIBGLES_DEPENDENCIES),)
 define LIBGLES_CONFIGURE_CMDS
 	echo "No libGLES implementation selected. Configuration error."

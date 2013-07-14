From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sun, 14 Jul 2013 00:10:32 -0500
Subject: [Buildroot] [RFC 3/3] opengl: add sunxi-mali as possible egl/gles
	provider
In-Reply-To: <1373778632-16531-1-git-send-email-spenser@gillilanding.com>
References: <1373778632-16531-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373778632-16531-4-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/opengl/libegl/libegl.mk   | 4 ++++
 package/opengl/libgles/libgles.mk | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/opengl/libegl/libegl.mk b/package/opengl/libegl/libegl.mk
index bd8040d..f00f6d1 100644
--- a/package/opengl/libegl/libegl.mk
+++ b/package/opengl/libegl/libegl.mk
@@ -10,6 +10,10 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 LIBEGL_DEPENDENCIES += rpi-userland
 endif
 
+ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
+LIBEGL_DEPENDENCIES += sunxi-mali
+endif
+
 ifeq ($(LIBEGL_DEPENDENCIES),)
 define LIBEGL_CONFIGURE_CMDS
 	echo "No libEGL implementation selected. Configuration error."
diff --git a/package/opengl/libgles/libgles.mk b/package/opengl/libgles/libgles.mk
index a0048a7..ec06d57 100644
--- a/package/opengl/libgles/libgles.mk
+++ b/package/opengl/libgles/libgles.mk
@@ -10,6 +10,10 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 LIBGLES_DEPENDENCIES += rpi-userland
 endif
 
+ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
+LIBGLES_DEPENDENCIES += sunxi-mali
+endif
+
 ifeq ($(LIBGLES_DEPENDENCIES),)
 define LIBGLES_CONFIGURE_CMDS
 	echo "No libGLES implementation selected. Configuration error."
-- 
1.8.1.2

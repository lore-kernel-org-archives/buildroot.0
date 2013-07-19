From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 19 Jul 2013 18:37:53 -0500
Subject: [Buildroot] [PATCH 3/4] opengl: add sunxi-mali as possible egl/gles
	provider
In-Reply-To: <1374277074-14455-1-git-send-email-spenser@gillilanding.com>
References: <1374277074-14455-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1374277074-14455-4-git-send-email-spenser@gillilanding.com>
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
index 00e1f19..5943a3a 100644
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
index d2fe11b..715d91a 100644
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
-- 
1.8.1.2

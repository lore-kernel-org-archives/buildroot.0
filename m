From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Tue, 15 Jun 2021 21:45:36 +0200
Subject: [Buildroot] [PATCH] package/cegui: disable Python SWIG extension
 modules when OpenGL renderer is disabled
Message-ID: <20210615194536.265246-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those modules need OpenGL renderer so disable them when it's missing.

Fixes:
 - http://autobuild.buildroot.net/results/592/592fcffb226c8b44ada5fa3cdb8ab15c627f29dc/
 - http://autobuild.buildroot.net/results/9ad/9ad768b7e2a3c59833e03986c245f2f4b5d25dcd/

  and more...

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/cegui/cegui.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 747ebbb953..c5ff45818e 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -38,7 +38,8 @@ CEGUI_CONF_OPTS += -DCEGUI_USE_EPOXY=ON -DCEGUI_USE_GLEW=OFF \
 else
 CEGUI_CONF_OPTS += -DCEGUI_USE_EPOXY=OFF -DCEGUI_USE_GLEW=OFF \
 	-DCEGUI_BUILD_RENDERER_OPENGL=OFF \
-	-DCEGUI_BUILD_RENDERER_OPENGL3=OFF
+	-DCEGUI_BUILD_RENDERER_OPENGL3=OFF \
+	-DCEGUI_BUILD_PYTHON_MODULES_SWIG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_EXPAT),y)
-- 
2.32.0

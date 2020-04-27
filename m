From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 22:11:33 +0200
Subject: [Buildroot] [git commit] package/cegui: disable ogre support
Message-ID: <20200427195650.B20899092E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b48e419af0bd3786580151d26b8a9b11441c1db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot's ogre version isn't compatible with current (v0-8-7) cegui
therefore disable support for that. It will be restored when upstream will
switch to the new version.

Fixes:
  - http://autobuild.buildroot.net/results/8ee717ac4d596fc0af274037841ac4ed6862ddaa/

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cegui/cegui.mk | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 434201b1f8..673340194a 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -10,7 +10,8 @@ CEGUI_LICENSE = MIT
 CEGUI_LICENSE_FILES = COPYING
 CEGUI_INSTALL_STAGING = YES
 CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
-		   -DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF
+		   -DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF \
+		   -DCEGUI_BUILD_RENDERER_OGRE=OFF
 CEGUI_DEPENDENCIES = glm \
 		$(if $(BR2_PACKAGE_LIBGLFW),libglfw) \
 		$(if $(BR2_PACKAGE_HAS_LIBGL),libgl) \
@@ -25,13 +26,6 @@ else
 CEGUI_CONF_OPTS += -DCEGUI_USE_EPOXY=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OGRE),y)
-CEGUI_DEPENDENCIES += ogre
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_RENDERER_OGRE=ON
-else
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_RENDERER_OGRE=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_EXPAT),y)
 CEGUI_DEPENDENCIES += expat
 CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_EXPAT=ON

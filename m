From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Thu, 18 Feb 2021 18:59:05 +0100
Subject: [Buildroot] [PATCH] package/cegui: override first _CONF_OPTS
 instead of appending
Message-ID: <20210218175905.9837-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During the package update, there was a mistake
and we appended the options to the first CONF_OPTS
variable instead of overriding it.
Fix that by removing an append-assignment.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/cegui/cegui.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 23919e0151..0596d6566b 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -9,7 +9,7 @@ CEGUI_SITE = $(call github,cegui,cegui,v$(CEGUI_VERSION))
 CEGUI_LICENSE = MIT
 CEGUI_LICENSE_FILES = COPYING
 CEGUI_INSTALL_STAGING = YES
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
+CEGUI_CONF_OPTS = -DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
 	-DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF \
 	-DCEGUI_BUILD_RENDERER_OGRE=OFF
 CEGUI_DEPENDENCIES = glm \
-- 
2.30.1

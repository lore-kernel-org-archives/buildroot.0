From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 May 2020 22:35:56 +0200
Subject: [Buildroot] [git commit] package/cegui: remove tinyxml2 dependency
Message-ID: <20200513201957.788D1918A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a07a9d32167c4cbec8ecffa06ed8bf859065c893
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove tinyxml2 dependency as tinyxml2 is not a part of version 0.8.7.

Indeed, tinyxml2 has been added in September 2016 with
https://github.com/cegui/cegui/commit/49b3fd9d6f0d7555198379514b155bcd61daef67
whereas version 0.8.7 has been released in April 2016

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cegui/cegui.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 9640a15116..6158ef129c 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -83,13 +83,6 @@ else
 CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_TINYXML2),y)
-CEGUI_DEPENDENCIES += tinyxml2
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML2=ON
-else
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML2=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_LIBFREEIMAGE),y)
 CEGUI_DEPENDENCIES += libfreeimage
 CEGUI_CONF_OPTS += -DCEGUI_BUILD_IMAGECODEC_FREEIMAGE=ON

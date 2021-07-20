From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 20:26:19 +0200
Subject: [Buildroot] [git commit] package/cegui: disable Python SWIG
 extension modules unconditionally
Message-ID: <20210720175219.24450884C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=804d3ef55e157e3e3e7de69295fb9ea1446b44da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It seems that Python SWIG extension module(s) are not compatible with
buildroot's SWIG version so disable them unconditionally to fix
the following build errors:

Fixes:
 - http://autobuild.buildroot.net/results/f80/f80ebdcbde08c13eddec9fadc39b9c2bd4b83e94//

  and more...

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cegui/cegui.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 747ebbb953..127d3b0fad 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -16,7 +16,8 @@ CEGUI_CONF_OPTS = \
 	-DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
 	-DCEGUI_USE_FRIBIDI=OFF \
 	-DCEGUI_SAMPLES_ENABLED=OFF \
-	-DCEGUI_BUILD_APPLICATION_TEMPLATES=OFF
+	-DCEGUI_BUILD_APPLICATION_TEMPLATES=OFF \
+	-DCEGUI_BUILD_PYTHON_MODULES_SWIG=OFF
 CEGUI_DEPENDENCIES = glm \
 	$(if $(BR2_PACKAGE_LIBGLFW),libglfw) \
 	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl) \

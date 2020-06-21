From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sun, 21 Jun 2020 15:18:32 +0200
Subject: [Buildroot] [PATCH v2] package/cegui: select libglu when libgl is
 detected
Message-ID: <20200621131832.1036346-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/1a8/1a866e8722fe111297e4a99b376cf9975ee92ace

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Reviewed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Changes v1 -> v2:
	- added reviewed by Bernd Kuhls
 package/cegui/Config.in | 1 +
 package/cegui/cegui.mk  | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/cegui/Config.in b/package/cegui/Config.in
index f917be0cc5..0c7932098c 100644
--- a/package/cegui/Config.in
+++ b/package/cegui/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_CEGUI
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GLM
+	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Crazy Eddie's GUI System is a free library providing windowing
diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 0e3d015948..4aaa065818 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -16,7 +16,8 @@ CEGUI_DEPENDENCIES = glm \
 		$(if $(BR2_PACKAGE_HAS_LIBGL),libgl) \
 		$(if $(BR2_PACKAGE_HAS_LIBGLES),libgles) \
 		$(if $(BR2_PACKAGE_LIBGLEW),libglew) \
-		$(if $(BR2_PACKAGE_LIBICONV),libiconv)
+		$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
+		$(if $(BR2_PACKAGE_LIBGLU),libglu)
 
 ifeq ($(BR2_PACKAGE_LIBEPOXY)$(BR2_PACKAGE_LIBGLEW),y)
 CEGUI_DEPENDENCIES += libepoxy
-- 
2.27.0

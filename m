From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Tue, 28 Apr 2020 21:58:43 +0200
Subject: [Buildroot] [PATCH 1/2] package/cegui: force libglew when libepoxy
 is also enabled
Message-ID: <20200428195844.48124-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cegui doesn't allow to have enabled both opengl libraries so disable
libepoxy when both are enabled.

Fixes:
  - http://autobuild.buildroot.net/results/2881bbcc2dcfcaa5ed663817ff39f7574430ba5a/build-end.log

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/cegui/cegui.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 434201b1f8..0e3d015948 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -18,7 +18,7 @@ CEGUI_DEPENDENCIES = glm \
 		$(if $(BR2_PACKAGE_LIBGLEW),libglew) \
 		$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
-ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
+ifeq ($(BR2_PACKAGE_LIBEPOXY)$(BR2_PACKAGE_LIBGLEW),y)
 CEGUI_DEPENDENCIES += libepoxy
 CEGUI_CONF_OPTS += -DCEGUI_USE_EPOXY=ON
 else
-- 
2.26.2

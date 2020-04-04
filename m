From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Apr 2020 14:10:18 +0200
Subject: [Buildroot] [PATCH 06/22] boot/swupdate: don't specify .config to
 munge
In-Reply-To: <cover.1586002215.git.yann.morin.1998@free.fr>
References: <cover.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <212dfb3901eac9b0f651ab5beed80576b1986f39.1586002215.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/swupdate/swupdate.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 237a44e233..a472232470 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -77,7 +77,7 @@ ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER):$(BR2_STATIC_LIBS),y:)
 SWUPDATE_DEPENDENCIES += luainterpreter host-pkgconf
 # defines the base name for the pkg-config file ("lua" or "luajit")
 define SWUPDATE_SET_LUA_VERSION
-	$(call KCONFIG_SET_OPT,CONFIG_LUAPKG,$(BR2_PACKAGE_PROVIDES_LUAINTERPRETER),$(SWUPDATE_BUILD_CONFIG))
+	$(call KCONFIG_SET_OPT,CONFIG_LUAPKG,$(BR2_PACKAGE_PROVIDES_LUAINTERPRETER))
 endef
 SWUPDATE_MAKE_ENV += HAVE_LUA=y
 else
@@ -152,7 +152,7 @@ SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 
 ifeq ($(BR2_STATIC_LIBS),y)
 define SWUPDATE_PREFER_STATIC
-	$(call KCONFIG_ENABLE_OPT,CONFIG_STATIC,$(SWUPDATE_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_STATIC)
 endef
 endif
 
-- 
2.20.1

From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  8 Jun 2019 23:18:27 +0200
Subject: [Buildroot] [Lua 2/2] package/orbit: remove it
In-Reply-To: <20190608211827.7731-1-francois.perrad@gadz.org>
References: <20190608211827.7731-1-francois.perrad@gadz.org>
Message-ID: <20190608211827.7731-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 Config.in.legacy         |  6 ++++++
 DEVELOPERS               |  1 -
 package/Config.in        |  1 -
 package/orbit/Config.in  | 15 ---------------
 package/orbit/orbit.hash |  4 ----
 package/orbit/orbit.mk   | 14 --------------
 6 files changed, 6 insertions(+), 35 deletions(-)
 delete mode 100644 package/orbit/Config.in
 delete mode 100644 package/orbit/orbit.hash
 delete mode 100644 package/orbit/orbit.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 744b1ca4d..42656b5a0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -152,6 +152,12 @@ config BR2_PACKAGE_LUA_MSGPACK_NATIVE
 	help
 	  The lua-msgpack-native package was removed.
 
+config BR2_PACKAGE_ORBIT
+	bool "orbit package removed"
+	select BR2_LEGACY
+	help
+	  The orbit package was removed.
+
 comment "Legacy options removed in 2019.05"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR
diff --git a/DEVELOPERS b/DEVELOPERS
index e36f1c410..83bdb48d8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -236,7 +236,6 @@ F:	package/luaexpatutils/
 F:	package/luaposix/
 F:	package/luasec/
 F:	package/lua-ev/
-F:	package/orbit/
 
 N:	Bartosz Bilas <b.bilas@grinn-global.com>
 F:	package/qt5/qt5scxml/
diff --git a/package/Config.in b/package/Config.in
index 29cfc11c3..0ad92820b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -654,7 +654,6 @@ menu "Lua libraries/modules"
 	source "package/luv/Config.in"
 	source "package/luvi/Config.in"
 	source "package/lzlib/Config.in"
-	source "package/orbit/Config.in"
 	source "package/rings/Config.in"
 	source "package/turbolua/Config.in"
 	source "package/wsapi/Config.in"
diff --git a/package/orbit/Config.in b/package/orbit/Config.in
deleted file mode 100644
index 7b6e9a43f..000000000
--- a/package/orbit/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-config BR2_PACKAGE_ORBIT
-	bool "orbit"
-	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
-	select BR2_PACKAGE_LPEG # runtime
-	select BR2_PACKAGE_LUAFILESYSTEM # runtime
-	select BR2_PACKAGE_WSAPI_XAVANTE # runtime
-	help
-	  An MVC web framework for Lua. The design is inspired by
-	  lightweight Ruby frameworks such as Camping
-
-	  http://keplerproject.github.com/orbit
-
-comment "orbit needs a Lua 5.1 interpreter"
-	depends on !BR2_PACKAGE_LUA_5_1
-	depends on !BR2_PACKAGE_LUAJIT
diff --git a/package/orbit/orbit.hash b/package/orbit/orbit.hash
deleted file mode 100644
index eb427b63b..000000000
--- a/package/orbit/orbit.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# computed by luarocks/buildroot
-sha256 91e3c514d5b86918db83666c8889635bb2d50c71d1ab3aeb69c6469c9424089b  orbit-2.2.4-1.src.rock
-sha256 dd7d37caed0f4ee994e9e64ea4ab292dce549bb609412c84fc47ed079275ae98  orbit/doc/us/license.html
-sha256 140134369c1f041abf7d8cd39a5b0c42f8b5e827695ce7c1ef5ca8f0911a0246  orbit/doc/us/license.md
diff --git a/package/orbit/orbit.mk b/package/orbit/orbit.mk
deleted file mode 100644
index 5cf7ac643..000000000
--- a/package/orbit/orbit.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# orbit
-#
-################################################################################
-
-ORBIT_VERSION = 2.2.4-1
-ORBIT_SUBDIR = orbit
-ORBIT_LICENSE = MIT
-ORBIT_LICENSE_FILES = \
-	$(ORBIT_SUBDIR)/doc/us/license.html \
-	$(ORBIT_SUBDIR)/doc/us/license.md
-
-$(eval $(luarocks-package))
-- 
2.20.1

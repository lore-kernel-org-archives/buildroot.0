From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 24 Sep 2017 18:18:57 +0200
Subject: [Buildroot] [PATCH 4/6] lua-compat53: new package
In-Reply-To: <20170924161859.10994-1-francois.perrad@gadz.org>
References: <20170924161859.10994-1-francois.perrad@gadz.org>
Message-ID: <20170924161859.10994-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                      |  1 +
 package/lua-compat53/Config.in         |  8 ++++++++
 package/lua-compat53/lua-compat53.hash |  2 ++
 package/lua-compat53/lua-compat53.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/lua-compat53/Config.in
 create mode 100644 package/lua-compat53/lua-compat53.hash
 create mode 100644 package/lua-compat53/lua-compat53.mk

diff --git a/package/Config.in b/package/Config.in
index 393bdcf4f..b4dc699a9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -574,6 +574,7 @@ menu "Lua libraries/modules"
 	source "package/lua-cjson/Config.in"
 	source "package/lua-coat/Config.in"
 	source "package/lua-coatpersistent/Config.in"
+	source "package/lua-compat53/Config.in"
 	source "package/lua-cqueues/Config.in"
 	source "package/lua-csnappy/Config.in"
 	source "package/lua-curl/Config.in"
diff --git a/package/lua-compat53/Config.in b/package/lua-compat53/Config.in
new file mode 100644
index 000000000..7ab3d740f
--- /dev/null
+++ b/package/lua-compat53/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LUA_COMPAT53
+	bool "lua-compat53"
+	depends on !BR2_PACKAGE_LUA_5_3
+	help
+	  Compatibility module providing Lua-5.3-style APIs for Lua 5.2
+	  and 5.1
+
+	  https://github.com/keplerproject/lua-compat-5.3
diff --git a/package/lua-compat53/lua-compat53.hash b/package/lua-compat53/lua-compat53.hash
new file mode 100644
index 000000000..7f1e1bb22
--- /dev/null
+++ b/package/lua-compat53/lua-compat53.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 fd0117156f59d1cb3824d5cca63be84c72cb5519b714377545433be3bb31afdf  compat53-0.5-1.src.rock
diff --git a/package/lua-compat53/lua-compat53.mk b/package/lua-compat53/lua-compat53.mk
new file mode 100644
index 000000000..969f81639
--- /dev/null
+++ b/package/lua-compat53/lua-compat53.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-compat53
+#
+################################################################################
+
+LUA_COMPAT53_VERSION_UPSTREAM = 0.5
+LUA_COMPAT53_VERSION = $(LUA_COMPAT53_VERSION_UPSTREAM)-1
+LUA_COMPAT53_NAME_UPSTREAM = compat53
+LUA_COMPAT53_SUBDIR = lua-compat-5.3-$(LUA_COMPAT53_VERSION_UPSTREAM)
+LUA_COMPAT53_LICENSE = MIT
+LUA_COMPAT53_LICENSE_FILES = $(LUA_COMPAT53_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))
-- 
2.11.0

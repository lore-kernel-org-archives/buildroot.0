From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 14 Jan 2020 17:37:57 +0100
Subject: [Buildroot] [PATCH 2/2] package/lua-livr-extra: new package
In-Reply-To: <20200114163757.29642-1-francois.perrad@gadz.org>
References: <20200114163757.29642-1-francois.perrad@gadz.org>
Message-ID: <20200114163757.29642-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                          |  1 +
 package/lua-livr-extra/Config.in           |  7 +++++++
 package/lua-livr-extra/lua-livr-extra.hash |  3 +++
 package/lua-livr-extra/lua-livr-extra.mk   | 12 ++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/lua-livr-extra/Config.in
 create mode 100644 package/lua-livr-extra/lua-livr-extra.hash
 create mode 100644 package/lua-livr-extra/lua-livr-extra.mk

diff --git a/package/Config.in b/package/Config.in
index e18bf40cd..916c6b430 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -635,6 +635,7 @@ menu "Lua libraries/modules"
 	source "package/lua-http/Config.in"
 	source "package/lua-iconv/Config.in"
 	source "package/lua-livr/Config.in"
+	source "package/lua-livr-extra/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
 	source "package/lua-lunitx/Config.in"
 	source "package/lua-markdown/Config.in"
diff --git a/package/lua-livr-extra/Config.in b/package/lua-livr-extra/Config.in
new file mode 100644
index 000000000..085062292
--- /dev/null
+++ b/package/lua-livr-extra/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUA_LIVR_EXTRA
+	bool "lua-livr-extra"
+	select BR2_PACKAGE_LUA_LIVR # runtime
+	help
+	  more LIVR rules.
+
+	  https://fperrad.frama.io/lua-LIVR-extra
diff --git a/package/lua-livr-extra/lua-livr-extra.hash b/package/lua-livr-extra/lua-livr-extra.hash
new file mode 100644
index 000000000..cb7cf898b
--- /dev/null
+++ b/package/lua-livr-extra/lua-livr-extra.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256 42fef357db3e05e32112ddebcd4296f040a825dfac77ff2fa03aedbdcdaac729  lua-livr-extra-0.1.1-1.src.rock
+sha256 96751dc604608ecf2357d1599bc2d2e9f56382793a6c218dc98d460759adbf07  lua-LIVR-extra-0.1.1/COPYRIGHT
diff --git a/package/lua-livr-extra/lua-livr-extra.mk b/package/lua-livr-extra/lua-livr-extra.mk
new file mode 100644
index 000000000..0a6378dbf
--- /dev/null
+++ b/package/lua-livr-extra/lua-livr-extra.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# lua-livr-extra
+#
+################################################################################
+
+LUA_LIVR_EXTRA_VERSION = 0.1.1-1
+LUA_LIVR_EXTRA_NAME_UPSTREAM = lua-LIVR-extra
+LUA_LIVR_EXTRA_LICENSE = MIT
+LUA_LIVR_EXTRA_LICENSE_FILES = $(LUA_LIVR_EXTRA_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
-- 
2.20.1

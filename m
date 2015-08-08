From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:39 -0000
Subject: [Buildroot] [git commit branch/next] lua-iconv: new package
Message-ID: <20150808105631.3D4477FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07f92eeb108d94a7018740c109093838e67f15ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/lua-iconv/Config.in    |    7 +++++++
 package/lua-iconv/lua-iconv.mk |   14 ++++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c5769d6..9dbb284 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -481,6 +481,7 @@ menu "Lua libraries/modules"
 	source "package/lua-coatpersistent/Config.in"
 	source "package/lua-csnappy/Config.in"
 	source "package/lua-ev/Config.in"
+	source "package/lua-iconv/Config.in"
 	source "package/lua-messagepack/Config.in"
 	source "package/lua-msgpack-native/Config.in"
 	source "package/lua-periphery/Config.in"
diff --git a/package/lua-iconv/Config.in b/package/lua-iconv/Config.in
new file mode 100644
index 0000000..e76019d
--- /dev/null
+++ b/package/lua-iconv/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUA_ICONV
+	bool "lua-iconv"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  Lua binding to the POSIX 'iconv' library
+
+	  http://ittner.github.io/lua-iconv/
diff --git a/package/lua-iconv/lua-iconv.mk b/package/lua-iconv/lua-iconv.mk
new file mode 100644
index 0000000..f0afa2b
--- /dev/null
+++ b/package/lua-iconv/lua-iconv.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-iconv
+#
+################################################################################
+
+LUA_ICONV_VERSION_UPSTREAM = 7
+LUA_ICONV_VERSION = $(LUA_ICONV_VERSION_UPSTREAM)-1
+LUA_ICONV_SUBDIR  = lua-iconv-$(LUA_ICONV_VERSION_UPSTREAM)
+LUA_ICONV_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+LUA_ICONV_LICENSE = MIT
+LUA_ICONV_LICENSE_FILES = $(LUA_ICONV_SUBDIR)/COPYING
+
+$(eval $(luarocks-package))

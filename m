From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Oct 2017 22:15:23 +0200
Subject: [Buildroot] [git commit] lua-basexx: new package
Message-ID: <20171003200831.8054880444@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9c6f24727e2c1ab0b9d46f2bc2452316551895e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |  1 +
 package/lua-basexx/Config.in       |  8 ++++++++
 package/lua-basexx/lua-basexx.hash |  2 ++
 package/lua-basexx/lua-basexx.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 44a73d1..031413b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -575,6 +575,7 @@ menu "Lua libraries/modules"
 	source "package/lpty/Config.in"
 	source "package/lrandom/Config.in"
 	source "package/lsqlite3/Config.in"
+	source "package/lua-basexx/Config.in"
 	source "package/lua-bit32/Config.in"
 	source "package/lua-cjson/Config.in"
 	source "package/lua-coat/Config.in"
diff --git a/package/lua-basexx/Config.in b/package/lua-basexx/Config.in
new file mode 100644
index 0000000..2f3bb1d
--- /dev/null
+++ b/package/lua-basexx/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LUA_BASEXX
+	bool "lua-basexx"
+	help
+	  A Lua library which provides base2(bitfield), base16(hex),
+	  base32(crockford/rfc), base64(rfc/url), base85(z85) decoding
+	  and encoding.
+
+	  https://github.com/aiq/basexx
diff --git a/package/lua-basexx/lua-basexx.hash b/package/lua-basexx/lua-basexx.hash
new file mode 100644
index 0000000..91c428c
--- /dev/null
+++ b/package/lua-basexx/lua-basexx.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 ff5379b1f5b396103b8bb589ab3dd94d0a727c8e7a48dcfe1c73e2f07af6a8df  basexx-0.4.0-1.src.rock
diff --git a/package/lua-basexx/lua-basexx.mk b/package/lua-basexx/lua-basexx.mk
new file mode 100644
index 0000000..bfdc1e2
--- /dev/null
+++ b/package/lua-basexx/lua-basexx.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-basexx
+#
+################################################################################
+
+LUA_BASEXX_VERSION_UPSTREAM =0.4.0
+LUA_BASEXX_VERSION = $(LUA_BASEXX_VERSION_UPSTREAM)-1
+LUA_BASEXX_NAME_UPSTREAM = basexx
+LUA_BASEXX_SUBDIR = basexx-$(LUA_BASEXX_VERSION_UPSTREAM)
+LUA_BASEXX_LICENSE = MIT
+LUA_BASEXX_LICENSE_FILES = $(LUA_BASEXX_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))

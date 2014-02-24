From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 Feb 2014 08:34:54 +0100
Subject: [Buildroot] [PATCH 18/24] lua-coatpersistent: new package
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393227301-14874-19-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                                |    1 +
 package/lua-coatpersistent/Config.in             |    8 ++++++++
 package/lua-coatpersistent/lua-coatpersistent.mk |   13 +++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/lua-coatpersistent/Config.in
 create mode 100644 package/lua-coatpersistent/lua-coatpersistent.mk

diff --git a/package/Config.in b/package/Config.in
index c494d64..3ed5f34 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -376,6 +376,7 @@ source "package/lpeg/Config.in"
 source "package/lrandom/Config.in"
 source "package/lua-cjson/Config.in"
 source "package/lua-coat/Config.in"
+source "package/lua-coatpersistent/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-iconv/Config.in"
 source "package/lua-msgpack-native/Config.in"
diff --git a/package/lua-coatpersistent/Config.in b/package/lua-coatpersistent/Config.in
new file mode 100644
index 0000000..581f927
--- /dev/null
+++ b/package/lua-coatpersistent/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LUA_COATPERSISTENT
+	bool "lua-coatpersistent"
+	select BR2_PACKAGE_DADO
+	select BR2_PACKAGE_LUA_COAT
+	help
+	  an ORM for lua-Coat
+
+	  http://fperrad.github.io/lua-CoatPersistent/
diff --git a/package/lua-coatpersistent/lua-coatpersistent.mk b/package/lua-coatpersistent/lua-coatpersistent.mk
new file mode 100644
index 0000000..3dc9861
--- /dev/null
+++ b/package/lua-coatpersistent/lua-coatpersistent.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-coatpersistent
+#
+################################################################################
+
+LUA_COATPERSISTENT_VERSION_UPSTREAM = 0.2.0
+LUA_COATPERSISTENT_VERSION = $(LUA_COATPERSISTENT_VERSION_UPSTREAM)-1
+LUA_COATPERSISTENT_SUBDIR  = lua-CoatPersistent-$(LUA_COATPERSISTENT_VERSION_UPSTREAM)
+LUA_COATPERSISTENT_LICENSE = MIT
+LUA_COATPERSISTENT_LICENSE_FILES = $(LUA_COATPERSISTENT_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
-- 
1.7.9.5

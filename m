From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 16:21:19 +0100
Subject: [Buildroot] [git commit] lua-coatpersistent: new package
Message-ID: <20140301152148.A919C903EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30c7e8d2b960b243275328ba3024303cb74e6f95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: mention that dependencies are run-time dependencies, adjust
help text.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |    1 +
 package/lua-coatpersistent/Config.in             |    9 +++++++++
 package/lua-coatpersistent/lua-coatpersistent.mk |   13 +++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2470313..3b143c5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -379,6 +379,7 @@ source "package/lpeg/Config.in"
 source "package/lrandom/Config.in"
 source "package/lua-cjson/Config.in"
 source "package/lua-coat/Config.in"
+source "package/lua-coatpersistent/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-msgpack-native/Config.in"
 source "package/lua-testmore/Config.in"
diff --git a/package/lua-coatpersistent/Config.in b/package/lua-coatpersistent/Config.in
new file mode 100644
index 0000000..86cddda
--- /dev/null
+++ b/package/lua-coatpersistent/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LUA_COATPERSISTENT
+	bool "lua-coatpersistent"
+	# run-time dependencies
+	select BR2_PACKAGE_DADO
+	select BR2_PACKAGE_LUA_COAT
+	help
+	  An ORM for lua-Coat.
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

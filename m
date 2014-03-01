From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 16:17:21 +0100
Subject: [Buildroot] [git commit] lua-testmore: new package
Message-ID: <20140301151858.27F4C903EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=410ffd77f40f712129ea61b369e634ee84302068
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/lua-testmore/Config.in       |    6 ++++++
 package/lua-testmore/lua-testmore.mk |   13 +++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 684d756..0085e85 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -380,6 +380,7 @@ source "package/lrandom/Config.in"
 source "package/lua-cjson/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-msgpack-native/Config.in"
+source "package/lua-testmore/Config.in"
 source "package/luasql-sqlite3/Config.in"
 source "package/luabitop/Config.in"
 source "package/luacrypto/Config.in"
diff --git a/package/lua-testmore/Config.in b/package/lua-testmore/Config.in
new file mode 100644
index 0000000..61dea3a
--- /dev/null
+++ b/package/lua-testmore/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_TESTMORE
+	bool "lua-testmore"
+	help
+	  an Unit Testing Framework.
+
+	  http://fperrad.github.io/lua-TestMore/
diff --git a/package/lua-testmore/lua-testmore.mk b/package/lua-testmore/lua-testmore.mk
new file mode 100644
index 0000000..fcbb170
--- /dev/null
+++ b/package/lua-testmore/lua-testmore.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-testmore
+#
+################################################################################
+
+LUA_TESTMORE_VERSION_UPSTREAM = 0.3.1
+LUA_TESTMORE_VERSION = $(LUA_TESTMORE_VERSION_UPSTREAM)-1
+LUA_TESTMORE_SUBDIR  = lua-TestMore-$(LUA_TESTMORE_VERSION_UPSTREAM)
+LUA_TESTMORE_LICENSE = MIT
+LUA_TESTMORE_LICENSE_FILES = $(LUA_TESTMORE_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))

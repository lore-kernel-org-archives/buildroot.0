From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 16:33:37 +0100
Subject: [Buildroot] [git commit] lua-csnappy: new package
Message-ID: <20140301153351.794499041B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6cfb8fabe841c93dbd49678eb0655767e0799dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |    1 +
 package/lua-csnappy/Config.in      |    8 ++++++++
 package/lua-csnappy/lua-csnappy.mk |   13 +++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index cc407e1..43c8292 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -380,6 +380,7 @@ source "package/lrandom/Config.in"
 source "package/lua-cjson/Config.in"
 source "package/lua-coat/Config.in"
 source "package/lua-coatpersistent/Config.in"
+source "package/lua-csnappy/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-messagepack/Config.in"
 source "package/lua-msgpack-native/Config.in"
diff --git a/package/lua-csnappy/Config.in b/package/lua-csnappy/Config.in
new file mode 100644
index 0000000..0562277
--- /dev/null
+++ b/package/lua-csnappy/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LUA_CSNAPPY
+	bool "lua-csnappy"
+	help
+	  lua-csnappy is a binding of the csnappy library
+	  which implements the Google's Snappy (de)compressor.
+
+	  http://fperrad.github.io/lua-csnappy/
+
diff --git a/package/lua-csnappy/lua-csnappy.mk b/package/lua-csnappy/lua-csnappy.mk
new file mode 100644
index 0000000..07aaf77
--- /dev/null
+++ b/package/lua-csnappy/lua-csnappy.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-csnappy
+#
+################################################################################
+
+LUA_CSNAPPY_VERSION_UPSTREAM = 0.1.1
+LUA_CSNAPPY_VERSION = $(LUA_CSNAPPY_VERSION_UPSTREAM)-1
+LUA_CSNAPPY_SUBDIR  = lua-csnappy-$(LUA_CSNAPPY_VERSION_UPSTREAM)
+LUA_CSNAPPY_LICENSE = BSD-3c
+LUA_CSNAPPY_LICENSE_FILES = $(LUA_CSNAPPY_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))

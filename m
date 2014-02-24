From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 Feb 2014 08:34:56 +0100
Subject: [Buildroot] [PATCH 20/24] lua-csnappy: new package
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393227301-14874-21-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                  |    1 +
 package/lua-csnappy/Config.in      |    8 ++++++++
 package/lua-csnappy/lua-csnappy.mk |   13 +++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/lua-csnappy/Config.in
 create mode 100644 package/lua-csnappy/lua-csnappy.mk

diff --git a/package/Config.in b/package/Config.in
index 4e32d25..9c34e58 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -377,6 +377,7 @@ source "package/lrandom/Config.in"
 source "package/lua-cjson/Config.in"
 source "package/lua-coat/Config.in"
 source "package/lua-coatpersistent/Config.in"
+source "package/lua-csnappy/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-iconv/Config.in"
 source "package/lua-messagepack/Config.in"
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
-- 
1.7.9.5

From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 Feb 2014 08:34:57 +0100
Subject: [Buildroot] [PATCH 21/24] lzlib: new package
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393227301-14874-22-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in       |    1 +
 package/lzlib/Config.in |    9 +++++++++
 package/lzlib/lzlib.mk  |   12 ++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/lzlib/Config.in
 create mode 100644 package/lzlib/lzlib.mk

diff --git a/package/Config.in b/package/Config.in
index 9c34e58..fa3c729 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -394,6 +394,7 @@ source "package/lualogging/Config.in"
 source "package/luaposix/Config.in"
 source "package/luasec/Config.in"
 source "package/luasocket/Config.in"
+source "package/lzlib/Config.in"
 source "package/orbit/Config.in"
 source "package/rings/Config.in"
 source "package/wsapi/Config.in"
diff --git a/package/lzlib/Config.in b/package/lzlib/Config.in
new file mode 100644
index 0000000..fc94342
--- /dev/null
+++ b/package/lzlib/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LZLIB
+	bool "lzlib"
+	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	help
+	  This package provides a library to access zlib library functions
+	  and also to read/write gzip files using an interface similar to the base io package.
+
+	  http://luaforge.net/projects/lzlib/
diff --git a/package/lzlib/lzlib.mk b/package/lzlib/lzlib.mk
new file mode 100644
index 0000000..24208ba
--- /dev/null
+++ b/package/lzlib/lzlib.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# lzlib
+#
+#############################################################
+
+LZLIB_VERSION = 0.4.work3-1
+LZLIB_SUBDIR  = lzlib-0.4-work3
+LZLIB_DEPENDENCIES = zlib
+LZLIB_LICENSE = MIT
+
+$(eval $(luarocks-package))
-- 
1.7.9.5

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 16:51:39 +0100
Subject: [Buildroot] [git commit] lzlib: new package
Message-ID: <20140301155229.BFE3C972C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d05f5c983a0ccfac7a52f85054f1120db0281d65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: reformat Config.in help text to have a reasonable width of
the text.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       |    1 +
 package/lzlib/Config.in |   10 ++++++++++
 package/lzlib/lzlib.mk  |   12 ++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 43c8292..bfc6f58 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -396,6 +396,7 @@ source "package/lualogging/Config.in"
 source "package/luaposix/Config.in"
 source "package/luasec/Config.in"
 source "package/luasocket/Config.in"
+source "package/lzlib/Config.in"
 source "package/orbit/Config.in"
 source "package/rings/Config.in"
 source "package/wsapi/Config.in"
diff --git a/package/lzlib/Config.in b/package/lzlib/Config.in
new file mode 100644
index 0000000..d2b4818
--- /dev/null
+++ b/package/lzlib/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LZLIB
+	bool "lzlib"
+	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	help
+	  This package provides a library to access zlib library
+	  functions and also to read/write gzip files using an
+	  interface similar to the base io package.
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

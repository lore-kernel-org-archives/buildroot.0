From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 16:52:54 +0100
Subject: [Buildroot] [git commit] lunit: new package
Message-ID: <20140301155345.BD3E4972C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe465fb61f1298864534dcd3d675e4b25e0039fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       |    1 +
 package/lunit/Config.in |   10 ++++++++++
 package/lunit/lunit.mk  |   13 +++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index bfc6f58..410971d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -396,6 +396,7 @@ source "package/lualogging/Config.in"
 source "package/luaposix/Config.in"
 source "package/luasec/Config.in"
 source "package/luasocket/Config.in"
+source "package/lunit/Config.in"
 source "package/lzlib/Config.in"
 source "package/orbit/Config.in"
 source "package/rings/Config.in"
diff --git a/package/lunit/Config.in b/package/lunit/Config.in
new file mode 100644
index 0000000..b3620ef
--- /dev/null
+++ b/package/lunit/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LUNIT
+	bool "lunit"
+	depends on !BR2_PACKAGE_LUA_5_2
+	help
+	  A unit testing framework for Lua.
+
+	  http://www.mroth.net/lunit/
+
+comment "lunit needs a Lua 5.1 interpreter"
+	depends on BR2_PACKAGE_LUA_5_2
diff --git a/package/lunit/lunit.mk b/package/lunit/lunit.mk
new file mode 100644
index 0000000..1b5f43c
--- /dev/null
+++ b/package/lunit/lunit.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# lunit
+#
+#############################################################
+
+LUNIT_VERSION_UPSTREAM = 0.5
+LUNIT_VERSION = $(LUNIT_VERSION_UPSTREAM)-2
+LUNIT_SUBDIR  = lunit-$(LUNIT_VERSION_UPSTREAM)
+LUNIT_LICENSE = MIT
+LUNIT_LICENSE_FILES = $(LUNIT_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))

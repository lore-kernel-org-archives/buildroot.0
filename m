From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 16:05:29 +0100
Subject: [Buildroot] [git commit] luajson: new package
Message-ID: <20140301150603.5A7DE903C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8ac059cb32d30f75ae3ad631b9d66303d7ec031
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: explicitly mention that lpeg is a run-time dependency, and
simplify the version specification. Both comments were made by
Arnout.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/luajson/Config.in  |    9 +++++++++
 package/luajson/luajson.mk |   12 ++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index eb39b94..cc44228 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -384,6 +384,7 @@ source "package/luacrypto/Config.in"
 source "package/luaexpat/Config.in"
 source "package/luaexpatutils/Config.in"
 source "package/luafilesystem/Config.in"
+source "package/luajson/Config.in"
 source "package/luaposix/Config.in"
 source "package/luasec/Config.in"
 source "package/luasocket/Config.in"
diff --git a/package/luajson/Config.in b/package/luajson/Config.in
new file mode 100644
index 0000000..c04aa7f
--- /dev/null
+++ b/package/luajson/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LUAJSON
+	bool "luajson"
+	# run-time dependency
+	select BR2_PACKAGE_LPEG
+	help
+	  LuaJSON is a customizable JSON decoder/encoder
+	  using LPEG for parsing.
+
+	  http://github.com/harningt/luajson
diff --git a/package/luajson/luajson.mk b/package/luajson/luajson.mk
new file mode 100644
index 0000000..3a4f81d
--- /dev/null
+++ b/package/luajson/luajson.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# luajson
+#
+################################################################################
+
+LUAJSON_VERSION = 1.3.2-1
+LUAJSON_SUBDIR  = luajson
+LUAJSON_LICENSE = MIT
+LUAJSON_LICENSE_FILES = $(LUAJSON_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))

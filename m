From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 15:39:57 +0100
Subject: [Buildroot] [git commit] lpeg: new package
Message-ID: <20140301144013.B976283493@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=792c2779a3c7535754d690a287696c05fbeb27c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in      |    1 +
 package/lpeg/Config.in |    8 ++++++++
 package/lpeg/lpeg.mk   |   10 ++++++++++
 3 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ab91719..705ff5a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -373,6 +373,7 @@ source "package/copas/Config.in"
 source "package/coxpcall/Config.in"
 source "package/lbase64/Config.in"
 source "package/ljsyscall/Config.in"
+source "package/lpeg/Config.in"
 source "package/lua-cjson/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-msgpack-native/Config.in"
diff --git a/package/lpeg/Config.in b/package/lpeg/Config.in
new file mode 100644
index 0000000..da54d61
--- /dev/null
+++ b/package/lpeg/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LPEG
+	bool "lpeg"
+	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	help
+	  LPeg is a new pattern-matching library for Lua,
+	  based on Parsing Expression Grammars (PEGs).
+
+	  http://www.inf.puc-rio.br/~roberto/lpeg/lpeg.html
diff --git a/package/lpeg/lpeg.mk b/package/lpeg/lpeg.mk
new file mode 100644
index 0000000..a9759e5
--- /dev/null
+++ b/package/lpeg/lpeg.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# lpeg
+#
+################################################################################
+
+LPEG_VERSION = 0.12-1
+LPEG_LICENSE = MIT
+
+$(eval $(luarocks-package))

From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 Feb 2014 08:34:45 +0100
Subject: [Buildroot] [PATCH 09/24] lpeg: new package
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393227301-14874-10-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in      |    1 +
 package/lpeg/Config.in |    8 ++++++++
 package/lpeg/lpeg.mk   |   10 ++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/lpeg/Config.in
 create mode 100644 package/lpeg/lpeg.mk

diff --git a/package/Config.in b/package/Config.in
index edff553..a7df716 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -370,6 +370,7 @@ source "package/coxpcall/Config.in"
 source "package/lbase64/Config.in"
 source "package/ljlinenoise/Config.in"
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
-- 
1.7.9.5

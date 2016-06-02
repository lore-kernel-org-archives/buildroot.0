From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu,  2 Jun 2016 17:05:53 +0200
Subject: [Buildroot] [PATCH] package/argparse: new package
Message-ID: <20160602150553.28323-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/Config.in              |  1 +
 package/argparse/Config.in     | 11 +++++++++++
 package/argparse/argparse.hash |  2 ++
 package/argparse/argparse.mk   | 13 +++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/argparse/Config.in
 create mode 100644 package/argparse/argparse.hash
 create mode 100644 package/argparse/argparse.mk

diff --git a/package/Config.in b/package/Config.in
index ae74f17..b7ad54a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -506,6 +506,7 @@ endif
 if BR2_PACKAGE_HAS_LUAINTERPRETER && !BR2_STATIC_LIBS
 # lua modules are dynamically loaded, so not available on static builds
 menu "Lua libraries/modules"
+	source "package/argparse/Config.in"
 	source "package/cgilua/Config.in"
 	source "package/copas/Config.in"
 	source "package/cosmo/Config.in"
diff --git a/package/argparse/Config.in b/package/argparse/Config.in
new file mode 100644
index 0000000..c7ed7ae
--- /dev/null
+++ b/package/argparse/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_ARGPARSE
+	bool "argparse"
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	help
+	  Argparse is a feature-rich command line parser for Lua
+	  inspired by argparse for Python. Argparse supports positional
+	  arguments, options, flags, optional arguments, subcommands
+	  and more. Argparse automatically generates usage, help and
+	  error messages.
+
+	  https://github.com/mpeterv/argparse
diff --git a/package/argparse/argparse.hash b/package/argparse/argparse.hash
new file mode 100644
index 0000000..a4746bc
--- /dev/null
+++ b/package/argparse/argparse.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	e00e5637c937d7bfca96025f2c598ba4fffe9eb818d69952e77b4c08167a6be3  argparse-0.5.0-1.src.rock
diff --git a/package/argparse/argparse.mk b/package/argparse/argparse.mk
new file mode 100644
index 0000000..095f0a3
--- /dev/null
+++ b/package/argparse/argparse.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# argparse
+#
+################################################################################
+
+ARGPARSE_VERSION_UPSTREAM = 0.5.0
+ARGPARSE_VERSION = $(ARGPARSE_VERSION_UPSTREAM)-1
+ARGPARSE_SUBDIR = argparse
+ARGPARSE_LICENSE = MIT
+ARGPARSE_LICENSE_FILES = $(ARGPARSE_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))
-- 
2.8.3

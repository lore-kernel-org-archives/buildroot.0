From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 24 Sep 2017 18:18:54 +0200
Subject: [Buildroot] [PATCH 1/6] lpeg-patterns: new package
Message-ID: <20170924161859.10994-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                        |  1 +
 package/lpeg-patterns/Config.in          |  8 ++++++++
 package/lpeg-patterns/lpeg-patterns.hash |  2 ++
 package/lpeg-patterns/lpeg-patterns.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/lpeg-patterns/Config.in
 create mode 100644 package/lpeg-patterns/lpeg-patterns.hash
 create mode 100644 package/lpeg-patterns/lpeg-patterns.mk

diff --git a/package/Config.in b/package/Config.in
index c8392eb69..217209bed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -566,6 +566,7 @@ menu "Lua libraries/modules"
 	source "package/ljlinenoise/Config.in"
 	source "package/ljsyscall/Config.in"
 	source "package/lpeg/Config.in"
+	source "package/lpeg-patterns/Config.in"
 	source "package/lpty/Config.in"
 	source "package/lrandom/Config.in"
 	source "package/lsqlite3/Config.in"
diff --git a/package/lpeg-patterns/Config.in b/package/lpeg-patterns/Config.in
new file mode 100644
index 000000000..3309e4a69
--- /dev/null
+++ b/package/lpeg-patterns/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LPEG_PATTERNS
+	bool "lpeg-patterns"
+	# These are runtime dependencies
+	select BR2_PACKAGE_LPEG
+	help
+	  a collection of LPEG patterns.
+
+	  https://github.com/daurnimator/lpeg_patterns
diff --git a/package/lpeg-patterns/lpeg-patterns.hash b/package/lpeg-patterns/lpeg-patterns.hash
new file mode 100644
index 000000000..f779466df
--- /dev/null
+++ b/package/lpeg-patterns/lpeg-patterns.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 82c8eddee52069e5ae821b68cb9e295ab5767a47d07545a4ca36ac1e81066086  lpeg_patterns-0.4-0.src.rock
diff --git a/package/lpeg-patterns/lpeg-patterns.mk b/package/lpeg-patterns/lpeg-patterns.mk
new file mode 100644
index 000000000..68bfe7361
--- /dev/null
+++ b/package/lpeg-patterns/lpeg-patterns.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lpeg-patterns
+#
+################################################################################
+
+LPEG_PATTERNS_VERSION = 0.4-0
+LPEG_PATTERNS_NAME_UPSTREAM = lpeg_patterns
+LPEG_PATTERNS_ROCKSPEC = $(LPEG_PATTERNS_NAME_UPSTREAM)-$(LPEG_PATTERNS_VERSION).rockspec
+LPEG_PATTERNS_SOURCE = $(LPEG_PATTERNS_NAME_UPSTREAM)-$(LPEG_PATTERNS_VERSION).src.rock
+LPEG_PATTERNS_LICENSE = MIT
+LPEG_PATTERNS_LICENSE_FILES = $(LPEG_PATTERNS_SUBDIR)/LICENSE.md
+
+$(eval $(luarocks-package))
-- 
2.11.0

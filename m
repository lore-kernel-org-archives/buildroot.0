From: Ismael Luceno <ismael@iodev.co.uk>
Date: Thu,  4 Mar 2021 14:40:49 +0100
Subject: [Buildroot] [PATCH] package/mawk: new package
Message-ID: <20210304134049.9317-1-ismael@iodev.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Interpreter for the AWK Programming Language.

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/mawk/Config.in |  6 ++++++
 package/mawk/mawk.hash |  2 ++
 package/mawk/mawk.mk   | 13 +++++++++++++
 5 files changed, 23 insertions(+)
 create mode 100644 package/mawk/Config.in
 create mode 100644 package/mawk/mawk.hash
 create mode 100644 package/mawk/mawk.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0c48236da402..02b3dd23814c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1122,6 +1122,7 @@ F:	package/exempi/
 
 N:	Ismael Luceno <ismael@iodev.co.uk>
 F:	package/axel/
+F:	package/mawk/
 
 N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/amarula/
diff --git a/package/Config.in b/package/Config.in
index 5304ab141c0f..ddfa671c2a46 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -178,6 +178,7 @@ menu "Development tools"
 	source "package/jq/Config.in"
 	source "package/libtool/Config.in"
 	source "package/make/Config.in"
+	source "package/mawk/Config.in"
 	source "package/patch/Config.in"
 	source "package/pkgconf/Config.in"
 	source "package/ripgrep/Config.in"
diff --git a/package/mawk/Config.in b/package/mawk/Config.in
new file mode 100644
index 000000000000..80118b3f6d52
--- /dev/null
+++ b/package/mawk/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_MAWK
+	bool "mawk"
+	help
+	  Interpreter for the AWK Programming Language.
+
+	  http://invisible-island.net/mawk/mawk.html
diff --git a/package/mawk/mawk.hash b/package/mawk/mawk.hash
new file mode 100644
index 000000000000..69761f77df57
--- /dev/null
+++ b/package/mawk/mawk.hash
@@ -0,0 +1,2 @@
+sha256  7fd4cd1e1fae9290fe089171181bbc6291dfd9bca939ca804f0ddb851c8b8237  mawk-1.3.4-20200120.tgz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mawk/mawk.mk b/package/mawk/mawk.mk
new file mode 100644
index 000000000000..c4a486215d5d
--- /dev/null
+++ b/package/mawk/mawk.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# mawk
+#
+################################################################################
+
+MAWK_VERSION = 1.3.4-20200120
+MAWK_SITE = https://invisible-mirror.net/archives/mawk
+MAWK_SOURCE = mawk-$(MAWK_VERSION).tgz
+MAWK_LICENSE = GPL-2.0
+MAWK_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.30.1

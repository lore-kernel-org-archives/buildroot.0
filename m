From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Sep 2019 17:36:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/utf8proc: new package
Message-ID: <20190929153603.25695-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for subversion 1.12.x:
https://github.com/apache/subversion/commit/472355d1597d7c1c64f20f72ed391fd34c0a8fb0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/utf8proc/Config.in     |  6 ++++++
 package/utf8proc/utf8proc.hash |  3 +++
 package/utf8proc/utf8proc.mk   | 14 ++++++++++++++
 5 files changed, 25 insertions(+)
 create mode 100644 package/utf8proc/Config.in
 create mode 100644 package/utf8proc/utf8proc.hash
 create mode 100644 package/utf8proc/utf8proc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 50d860d3ff..33a6cf11d5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -424,6 +424,7 @@ F:	package/tor/
 F:	package/transmission/
 F:	package/tvheadend/
 F:	package/unixodbc/
+F:	package/utf8proc/
 F:	package/vdr/
 F:	package/vdr-plugin-vnsiserver/
 F:	package/vlc/
diff --git a/package/Config.in b/package/Config.in
index 361b9ffadf..fee1f57e4e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1822,6 +1822,7 @@ menu "Text and terminal handling"
 	source "package/readline/Config.in"
 	source "package/slang/Config.in"
 	source "package/tclap/Config.in"
+	source "package/utf8proc/Config.in"
 endmenu
 
 endmenu
diff --git a/package/utf8proc/Config.in b/package/utf8proc/Config.in
new file mode 100644
index 0000000000..43b507389d
--- /dev/null
+++ b/package/utf8proc/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_UTF8PROC
+	bool "utf8proc"
+	help
+	  A clean C library for processing UTF-8 Unicode data.
+
+	  https://juliastrings.github.io/utf8proc
diff --git a/package/utf8proc/utf8proc.hash b/package/utf8proc/utf8proc.hash
new file mode 100644
index 0000000000..da85a3c7cc
--- /dev/null
+++ b/package/utf8proc/utf8proc.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 b2e5d547c1d94762a6d03a7e05cea46092aab68636460ff8648f1295e2cdfbd7  utf8proc-2.4.0.tar.gz
+sha256 6acb7a86aca74317c6b4dddc2eadeb53bededb95a94a48c3fcd517f4473a653d  LICENSE.md
diff --git a/package/utf8proc/utf8proc.mk b/package/utf8proc/utf8proc.mk
new file mode 100644
index 0000000000..2d60387e70
--- /dev/null
+++ b/package/utf8proc/utf8proc.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# utf8proc
+#
+################################################################################
+
+UTF8PROC_VERSION = 2.4.0
+UTF8PROC_SITE = $(call github,JuliaStrings,utf8proc,v$(UTF8PROC_VERSION))
+UTF8PROC_LICENSE = MIT
+UTF8PROC_LICENSE_FILES = LICENSE.md
+UTF8PROC_INSTALL_STAGING = YES
+UTF8PROC_SUPPORTS_IN_SOURCE_BUILD = NO
+
+$(eval $(cmake-package))
-- 
2.20.1

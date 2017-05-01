From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon,  1 May 2017 12:37:20 -0500
Subject: [Buildroot] [PATCH 1/1] libcsv: new package
Message-ID: <1493660240-45710-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: David Graziano <david.graziano@rockwellcollins.com>

libcsv is a small, simple and fast CSV library written in pure
ANSI C89 that can read and write CSV data.

Signed-off-by: David Graziano <david.graziano@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in          |  1 +
 package/libcsv/Config.in   | 10 ++++++++++
 package/libcsv/libcsv.hash |  2 ++
 package/libcsv/libcsv.mk   | 15 +++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/libcsv/Config.in
 create mode 100644 package/libcsv/libcsv.hash
 create mode 100644 package/libcsv/libcsv.mk

diff --git a/package/Config.in b/package/Config.in
index bfcfb73..e3b6682 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1367,6 +1367,7 @@ menu "Other"
 	source "package/libcofi/Config.in"
 	source "package/libcroco/Config.in"
 	source "package/libcrossguid/Config.in"
+	source "package/libcsv/Config.in"
 	source "package/libdaemon/Config.in"
 	source "package/libee/Config.in"
 	source "package/libev/Config.in"
diff --git a/package/libcsv/Config.in b/package/libcsv/Config.in
new file mode 100644
index 0000000..eaa6115
--- /dev/null
+++ b/package/libcsv/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBCSV
+	bool "libcsv"
+	help
+	  libcsv is a small, simple and fast CSV library written in pure
+	  ANSI C89 that can read and write CSV data. It provides a
+	  straight-forward interface using callback functions to handle
+	  parsed fields and rows and can parse improperly formatted CSV
+	  files.
+
+	  https://sourceforge.net/projects/libcsv/
diff --git a/package/libcsv/libcsv.hash b/package/libcsv/libcsv.hash
new file mode 100644
index 0000000..e35c44f
--- /dev/null
+++ b/package/libcsv/libcsv.hash
@@ -0,0 +1,2 @@
+#locally computed
+sha256 d9c0431cb803ceb9896ce74f683e6e5a0954e96ae1d9e4028d6e0f967bebd7e4  libcsv-3.0.3.tar.gz
diff --git a/package/libcsv/libcsv.mk b/package/libcsv/libcsv.mk
new file mode 100644
index 0000000..cfb4088
--- /dev/null
+++ b/package/libcsv/libcsv.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libcsv
+#
+################################################################################
+
+LIBCSV_VERSION = 3.0.3
+LIBCSV_SITE = http://sourceforge.net/projects/libcsv/files
+LIBCSV_SOURCE = libcsv-$(LIBCSV_VERSION).tar.gz
+LIBCSV_LICENSE = LGPLv2.1+
+LIBCSV_LICENSE_FILES = COPYING.LESSER
+LIBCSV_INSTALL_STAGING = YES
+
+$(eval $(host-autotools-package))
+$(eval $(autotools-package))
-- 
1.9.1

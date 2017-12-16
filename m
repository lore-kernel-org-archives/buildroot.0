From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sun, 17 Dec 2017 00:52:59 +0100
Subject: [Buildroot] [PATCH 1/3] add new package proj
Message-ID: <1513468381-8875-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/Config.in      |  1 +
 package/proj/Config.in | 13 +++++++++++++
 package/proj/proj.hash |  2 ++
 package/proj/proj.mk   | 13 +++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/proj/Config.in
 create mode 100644 package/proj/proj.hash
 create mode 100644 package/proj/proj.mk

diff --git a/package/Config.in b/package/Config.in
index e7435eb..1423147 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1594,6 +1594,7 @@ menu "Miscellaneous"
 	source "package/linux-syscall-support/Config.in"
 	source "package/mcrypt/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
+	source "package/proj/Config.in"
 	source "package/qemu/Config.in"
 	source "package/qpdf/Config.in"
 	source "package/shared-mime-info/Config.in"
diff --git a/package/proj/Config.in b/package/proj/Config.in
new file mode 100644
index 0000000..0dd92cc
--- /dev/null
+++ b/package/proj/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PROJ
+	bool "proj"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  proj.4 is a standard UNIX filter function which converts geographic 
+	  longitude and latitude coordinates into cartesian coordinates
+	  (and vice versa), and it is a C API for software developers to include
+	  coordinate transformation in their own software.
+
+	  http://proj4.org/
+
+comment "proj needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/proj/proj.hash b/package/proj/proj.hash
new file mode 100644
index 0000000..5b1d28d
--- /dev/null
+++ b/package/proj/proj.hash
@@ -0,0 +1,2 @@
+# Fetched from http://download.osgeo.org/proj/proj-4.9.3.tar.gz.md5
+md5 d598336ca834742735137c5674b214a1 proj-4.9.3.tar.gz
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
new file mode 100644
index 0000000..6a00c5c
--- /dev/null
+++ b/package/proj/proj.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# proj
+#
+################################################################################
+
+PROJ_VERSION = 4.9.3
+PROJ_SOURCE = proj-$(PROJ_VERSION).tar.gz
+PROJ_SITE = http://download.osgeo.org/proj
+PROJ_LICENSE = MIT
+PROJ_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
-- 
2.7.4

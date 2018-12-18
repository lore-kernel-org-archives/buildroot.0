From: averyanovin at gmail.com <averyanovin@gmail.com>
Date: Tue, 18 Dec 2018 21:11:02 +0300
Subject: [Buildroot] [PATCH 1/1] exempi: new package
Message-ID: <20181218181102.28596-1-averyanovin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ilya Averyanov <averyanovin@gmail.com>

Signed-off-by: Ilya Averyanov <averyanovin@gmail.com>
---
 package/Config.in          |  1 +
 package/exempi/Config.in   |  5 +++++
 package/exempi/exempi.hash |  2 ++
 package/exempi/exempi.mk   | 16 ++++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/exempi/Config.in
 create mode 100644 package/exempi/exempi.hash
 create mode 100644 package/exempi/exempi.mk

diff --git a/package/Config.in b/package/Config.in
index c3e069134e..a739fe22e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1247,6 +1247,7 @@ menu "Graphics"
 	source "package/cairomm/Config.in"
 	source "package/chipmunk/Config.in"
 	source "package/exiv2/Config.in"
+	source "package/exempi/Config.in"
 	source "package/fltk/Config.in"
 	source "package/fontconfig/Config.in"
 	source "package/freetype/Config.in"
diff --git a/package/exempi/Config.in b/package/exempi/Config.in
new file mode 100644
index 0000000000..299ee5c482
--- /dev/null
+++ b/package/exempi/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_EXEMPI
+    bool "exempi"
+    help
+        Exempi is an implementation of XMP. Version 2.x is based on Adobe XMP SDK.
+        http://libopenraw.freedesktop.org/wiki/Exempi
diff --git a/package/exempi/exempi.hash b/package/exempi/exempi.hash
new file mode 100644
index 0000000000..65535228e0
--- /dev/null
+++ b/package/exempi/exempi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 406185feb88e84ea1d4b4251370be2991205790d7113a7e28e192ff46a4f221e  exempi-2.4.5.tar.bz2
diff --git a/package/exempi/exempi.mk b/package/exempi/exempi.mk
new file mode 100644
index 0000000000..44774db6c3
--- /dev/null
+++ b/package/exempi/exempi.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# exempi
+#
+################################################################################
+
+EXEMPI_VERSION = 2.4.5
+EXEMPI_SOURCE = exempi-$(EXEMPI_VERSION).tar.bz2
+EXEMPI_SITE = https://libopenraw.freedesktop.org/download
+EXEMPI_INSTALL_STAGING = YES
+EXEMPI_CONF_OPTS = --enable-unittest=no
+EXEMPI_DEPENDENCIES = host-pkgconf
+EXEMPI_LICENSE = BSD-3-Clause
+EXEMPI_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.19.1

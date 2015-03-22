From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 22 Mar 2015 23:12:49 +0200
Subject: [Buildroot] [PATCH v2 5/8] package/openjpeg: New package openjpeg
	1.5.2
In-Reply-To: <1427058772-1105-1-git-send-email-olivier.schonken@gmail.com>
References: <1427058772-1105-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1427058772-1105-6-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is needed by Poppler.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/Config.in              |  1 +
 package/openjpeg/Config.in     |  6 ++++++
 package/openjpeg/openjpeg.hash |  2 ++
 package/openjpeg/openjpeg.mk   | 15 +++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/openjpeg/Config.in
 create mode 100644 package/openjpeg/openjpeg.hash
 create mode 100644 package/openjpeg/openjpeg.mk

diff --git a/package/Config.in b/package/Config.in
index 93fde92..e9f362d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -739,6 +739,7 @@ menu "Graphics"
 	source "package/libvips/Config.in"
 	source "package/opencv/Config.in"
 	source "package/opengl/Config.in"
+	source "package/openjpeg/Config.in"
 	source "package/pango/Config.in"
 	source "package/pixman/Config.in"
 	source "package/poppler/Config.in"
diff --git a/package/openjpeg/Config.in b/package/openjpeg/Config.in
new file mode 100644
index 0000000..3fa7553
--- /dev/null
+++ b/package/openjpeg/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_OPENJPEG
+	bool "openjpeg"
+	help
+	  The OpenJPEG library is an open-source JPEG 2000 codec written in C
+
+          http://www.openjpeg.org
diff --git a/package/openjpeg/openjpeg.hash b/package/openjpeg/openjpeg.hash
new file mode 100644
index 0000000..a8695c1
--- /dev/null
+++ b/package/openjpeg/openjpeg.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	15df7b194a5d8dba0052cd21c17a4dc761149a770a907d73fffb972078c28a87  openjpeg-1.5.2.tar.gz
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
new file mode 100644
index 0000000..195a80b
--- /dev/null
+++ b/package/openjpeg/openjpeg.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# openjpeg
+#
+################################################################################
+
+OPENJPEG_VERSION = 1.5.2
+OPENJPEG_SITE = http://downloads.sourceforge.net/project/openjpeg
+OPENJPEG_LICENSE = BSD-2c
+OPENJPEG_LICENSE_FILES = LICENSE
+#Autoreconf needed to create configure
+OPENJPEG_AUTORECONF = YES
+OPENJPEG_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.9.1

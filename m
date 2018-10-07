From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun,  7 Oct 2018 11:17:01 +0200
Subject: [Buildroot] [PATCH v2] xapian: new package
Message-ID: <1538903821-5952-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
Change v1 -> v2
- Fixed warnings reported by check-package script.

 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/xapian/Config.in   | 14 ++++++++++++++
 package/xapian/xapian.hash |  3 +++
 package/xapian/xapian.mk   | 14 ++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/xapian/Config.in
 create mode 100644 package/xapian/xapian.hash
 create mode 100644 package/xapian/xapian.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 74bc703..dbb55c8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -886,6 +886,7 @@ F:	package/leptonica/
 F:	package/ocrad/
 F:	package/tesseract-ocr/
 F:	package/webp/
+F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@micronovasrl.com>
 F:	package/sunxi-mali-mainline/
diff --git a/package/Config.in b/package/Config.in
index 17627ad..80823e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1657,6 +1657,7 @@ endif
 	source "package/tinycbor/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
+	source "package/xapian/Config.in"
 endmenu
 
 menu "Security"
diff --git a/package/xapian/Config.in b/package/xapian/Config.in
new file mode 100644
index 0000000..6d5551d
--- /dev/null
+++ b/package/xapian/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_XAPIAN
+	bool "xapian"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_ZLIB
+	help
+	  Xapian is an open Source search engine Library
+	  It is a highly adaptable toolkit which allows developers
+	  to easily add advanced indexing and search facilities to
+	  their own applications.
+	  It has built-in support for several families of weighting
+	  models and supports a rich set of boolean query operators.
+
+	  https://xapian.org/
diff --git a/package/xapian/xapian.hash b/package/xapian/xapian.hash
new file mode 100644
index 0000000..4fd0dd1
--- /dev/null
+++ b/package/xapian/xapian.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256 13f08a0b649c7afa804fa0e85678d693fd6069dd394c9b9e7d41973d74a3b5d3 xapian-core-1.4.7.tar.xz
+sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42 COPYING
diff --git a/package/xapian/xapian.mk b/package/xapian/xapian.mk
new file mode 100644
index 0000000..63f9119
--- /dev/null
+++ b/package/xapian/xapian.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xapian
+#
+################################################################################
+
+XAPIAN_VERSION = 1.4.7
+XAPIAN_SOURCE = xapian-core-$(XAPIAN_VERSION).tar.xz
+XAPIAN_SITE = https://oligarchy.co.uk/xapian/$(XAPIAN_VERSION)
+XAPIAN_LICENSE = GPL-2.0+
+XAPIAN_LICENSE_FILES = COPYING
+XAPIAN_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.7.4

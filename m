From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 13 Jan 2016 16:18:10 +0100
Subject: [Buildroot] [PATCH] python-html5lib: new package
Message-ID: <1452698290-18275-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                            |  1 +
 package/python-html5lib/Config.in            |  6 ++++++
 package/python-html5lib/python-html5lib.hash |  3 +++
 package/python-html5lib/python-html5lib.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-html5lib/Config.in
 create mode 100644 package/python-html5lib/python-html5lib.hash
 create mode 100644 package/python-html5lib/python-html5lib.mk

diff --git a/package/Config.in b/package/Config.in
index 06ed4a8..89b23db 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -638,6 +638,7 @@ menu "External python modules"
 	source "package/python-flask/Config.in"
 	source "package/python-flup/Config.in"
 	source "package/python-gobject/Config.in"
+	source "package/python-html5lib/Config.in"
 	source "package/python-httplib2/Config.in"
 	source "package/python-id3/Config.in"
 	source "package/python-idna/Config.in"
diff --git a/package/python-html5lib/Config.in b/package/python-html5lib/Config.in
new file mode 100644
index 0000000..c3e9f2a
--- /dev/null
+++ b/package/python-html5lib/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_HTML5LIB
+	bool "python-html5lib"
+	help
+	  HTML parser based on the WHATWG HTML specification.
+
+	  https://github.com/html5lib/html5lib-python
diff --git a/package/python-html5lib/python-html5lib.hash b/package/python-html5lib/python-html5lib.hash
new file mode 100644
index 0000000..0ec712a
--- /dev/null
+++ b/package/python-html5lib/python-html5lib.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=ef43cb05e9e799f25d65d1135838a96f, sha256 locally computed
+md5     ef43cb05e9e799f25d65d1135838a96f  html5lib-0.9999999.tar.gz
+sha256  2612a191a8d5842bfa057e41ba50bbb9dcb722419d2408c78cff4758d0754868  html5lib-0.9999999.tar.gz
diff --git a/package/python-html5lib/python-html5lib.mk b/package/python-html5lib/python-html5lib.mk
new file mode 100644
index 0000000..93eef9a
--- /dev/null
+++ b/package/python-html5lib/python-html5lib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-html5lib
+#
+################################################################################
+
+PYTHON_HTML5LIB_VERSION = 0.9999999
+PYTHON_HTML5LIB_SOURCE = html5lib-$(PYTHON_HTML5LIB_VERSION).tar.gz
+PYTHON_HTML5LIB_SITE = https://pypi.python.org/packages/source/h/html5lib
+PYTHON_HTML5LIB_LICENSE = MIT
+PYTHON_HTML5LIB_LICENSE_FILES = LICENSE
+PYTHON_HTML5LIB_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.1.4

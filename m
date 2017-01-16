From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 16 Jan 2017 16:46:20 +0100
Subject: [Buildroot] [PATCH 3/3] python-markdown2: new package
In-Reply-To: <20170116154620.27358-1-yegorslists@googlemail.com>
References: <20170116154620.27358-1-yegorslists@googlemail.com>
Message-ID: <20170116154620.27358-3-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                              |  1 +
 package/python-markdown2/Config.in             |  6 ++++++
 package/python-markdown2/python-markdown2.hash |  2 ++
 package/python-markdown2/python-markdown2.mk   | 13 +++++++++++++
 4 files changed, 22 insertions(+)
 create mode 100644 package/python-markdown2/Config.in
 create mode 100644 package/python-markdown2/python-markdown2.hash
 create mode 100644 package/python-markdown2/python-markdown2.mk

diff --git a/package/Config.in b/package/Config.in
index e03b003fa..0d2701215 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -714,6 +714,7 @@ menu "External python modules"
 	source "package/python-mad/Config.in"
 	source "package/python-mako/Config.in"
 	source "package/python-markdown/Config.in"
+	source "package/python-markdown2/Config.in"
 	source "package/python-markupsafe/Config.in"
 	source "package/python-mbstrdecoder/Config.in"
 	source "package/python-meld3/Config.in"
diff --git a/package/python-markdown2/Config.in b/package/python-markdown2/Config.in
new file mode 100644
index 000000000..8fe233249
--- /dev/null
+++ b/package/python-markdown2/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_MARKDOWN2
+	bool "python-markdown2"
+	help
+	  A fast and complete Python implementation of Markdown.
+
+	  https://github.com/trentm/python-markdown2
diff --git a/package/python-markdown2/python-markdown2.hash b/package/python-markdown2/python-markdown2.hash
new file mode 100644
index 000000000..17ae7d901
--- /dev/null
+++ b/package/python-markdown2/python-markdown2.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	07e077f5d4aa5f1e2f061f9f94d9e22f9ea266411b8c557b9164fc0e6dff0595  python-markdown2-2.3.2.tar.gz
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
new file mode 100644
index 000000000..1e343b43f
--- /dev/null
+++ b/package/python-markdown2/python-markdown2.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-markdown2
+#
+################################################################################
+
+PYTHON_MARKDOWN2_VERSION = 2.3.2
+PYTHON_MARKDOWN2_SITE = $(call github,trentm,python-markdown2,$(PYTHON_MARKDOWN2_VERSION))
+PYTHON_MARKDOWN2_SETUP_TYPE = distutils
+PYTHON_MARKDOWN2_LICENSE = MIT
+PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.11.0

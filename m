From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  5 Jul 2017 15:47:39 +0200
Subject: [Buildroot] [PATCH 1/4] python-hyperframe: new package
Message-ID: <20170705134742.9178-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                |  1 +
 package/python-hyperframe/Config.in              |  6 ++++++
 package/python-hyperframe/python-hyperframe.hash |  3 +++
 package/python-hyperframe/python-hyperframe.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-hyperframe/Config.in
 create mode 100644 package/python-hyperframe/python-hyperframe.hash
 create mode 100644 package/python-hyperframe/python-hyperframe.mk

diff --git a/package/Config.in b/package/Config.in
index 46c78a0121..b72a24bcbe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -742,6 +742,7 @@ menu "External python modules"
 	source "package/python-html5lib/Config.in"
 	source "package/python-httplib2/Config.in"
 	source "package/python-humanize/Config.in"
+	source "package/python-hyperframe/Config.in"
 	source "package/python-id3/Config.in"
 	source "package/python-idna/Config.in"
 	source "package/python-incremental/Config.in"
diff --git a/package/python-hyperframe/Config.in b/package/python-hyperframe/Config.in
new file mode 100644
index 0000000000..f3318a20e2
--- /dev/null
+++ b/package/python-hyperframe/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_HYPERFRAME
+	bool "python-hyperframe"
+	help
+	  HTTP/2 framing layer for Python.
+
+	  http://hyper.rtfd.org
diff --git a/package/python-hyperframe/python-hyperframe.hash b/package/python-hyperframe/python-hyperframe.hash
new file mode 100644
index 0000000000..e6139374ec
--- /dev/null
+++ b/package/python-hyperframe/python-hyperframe.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/hyperframe/json, sha256 locally computed
+md5	c2aa71dd091836e72d2c6784d1dd1591  hyperframe-5.1.0.tar.gz
+sha256	a25944539db36d6a2e47689e7915dcee562b3f8d10c6cdfa0d53c91ed692fb04  hyperframe-5.1.0.tar.gz
diff --git a/package/python-hyperframe/python-hyperframe.mk b/package/python-hyperframe/python-hyperframe.mk
new file mode 100644
index 0000000000..8d0688f6bd
--- /dev/null
+++ b/package/python-hyperframe/python-hyperframe.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-hyperframe
+#
+################################################################################
+
+PYTHON_HYPERFRAME_VERSION = 5.1.0
+PYTHON_HYPERFRAME_SOURCE = hyperframe-$(PYTHON_HYPERFRAME_VERSION).tar.gz
+PYTHON_HYPERFRAME_SITE = https://pypi.python.org/packages/a4/59/dddaddc73b4d53e9649850998e23b6daca80817c5442465a12423235d20b
+PYTHON_HYPERFRAME_SETUP_TYPE = setuptools
+PYTHON_HYPERFRAME_LICENSE = MIT
+PYTHON_HYPERFRAME_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0

From: Guillaume William Bres <guillaume.bressaix@gmail.com>
Date: Wed, 7 Oct 2015 11:52:59 -0600
Subject: [Buildroot] [PATCH 2/2] Add new package PyQtGraph
In-Reply-To: <1444240379-22896-1-git-send-email-guillaume.bressaix@gmail.com>
References: <1444240379-22896-1-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <1444240379-22896-3-git-send-email-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/python-pyqtgraph/Config.in             |   14 ++++++++++++++
 package/python-pyqtgraph/python-pyqtgraph.hash |    5 +++++
 package/python-pyqtgraph/python-pyqtgraph.mk   |   15 +++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/python-pyqtgraph/Config.in
 create mode 100644 package/python-pyqtgraph/python-pyqtgraph.hash
 create mode 100644 package/python-pyqtgraph/python-pyqtgraph.mk

diff --git a/package/python-pyqtgraph/Config.in b/package/python-pyqtgraph/Config.in
new file mode 100644
index 0000000..14619e3
--- /dev/null
+++ b/package/python-pyqtgraph/Config.in
@@ -0,0 +1,14 @@
+comment "PyQtGraph requires a GLibc Toolchain w/ WCHAR and C++."
+	depends on BR2_PACKAGE_PYTHON_PYQT
+
+config BR2_PACKAGE_PYTHON_PYQTGRAPH
+	bool "python-pyqtgraph"
+	depends on BR2_PACKAGE_PYTHON_PYQT
+	select BR2_PACKAGE_PYTHON_PYEXPAT
+	select BR2_PACKAGE_QT_SVG
+	select BR2_PACKAGE_PYTHON_NUMPY
+	help
+	  PyQtGraph is a pure Python graphics and GUI library built on PyQt4, PySide and Numpy. 
+	  Official website:
+
+	  http://www.pyqtgraph.org/
diff --git a/package/python-pyqtgraph/python-pyqtgraph.hash b/package/python-pyqtgraph/python-pyqtgraph.hash
new file mode 100644
index 0000000..0a43fbc
--- /dev/null
+++ b/package/python-pyqtgraph/python-pyqtgraph.hash
@@ -0,0 +1,5 @@
+# From http://www.pyqtgraph.org/downloads/pyqtgraph-0.9.10.tar.gz 
+md5 6e2efa185b6b9227dfe16fefd921a8ec  pyqtgraph-0.9.10.tar.gz
+
+# Locally calculated:
+sha256 4c0589774e3c8b0c374931397cf6356b9cc99a790215d1917bb7f015c6f0729a  pyqtgraph-0.9.10.tar.gz
diff --git a/package/python-pyqtgraph/python-pyqtgraph.mk b/package/python-pyqtgraph/python-pyqtgraph.mk
new file mode 100644
index 0000000..dbc3598
--- /dev/null
+++ b/package/python-pyqtgraph/python-pyqtgraph.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pyqtgraph
+#
+################################################################################
+
+PYTHON_PYQTGRAPH_VERSION = 0.9.10
+PYTHON_PYQTGRAPH_SOURCE = pyqtgraph-$(PYTHON_PYQTGRAPH_VERSION).tar.gz
+PYTHON_PYQTGRAPH_SITE = http://www.pyqtgraph.org/downloads
+PYTHON_PYQTGRAPH_LICENSE = MIT
+PYTHON_PYQTGRAPH_LICENSE_FILES = COPYING
+PYTHON_PYQTGRAPH_SETUP_TYPE = distutils
+PYTHON_PYQTGRAPH_DEPENDENCIES = python-pyqt
+
+$(eval $(python-package))
-- 
1.7.10.4

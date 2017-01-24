From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 22:56:30 +1300
Subject: [Buildroot] [git commit] python-pytablereader: new package
Message-ID: <20170124095724.F0CF57FB3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20e1d5d3122d1e9fab7a50f89fbff646b96be9dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                     |  1 +
 package/python-pytablereader/Config.in                | 19 +++++++++++++++++++
 .../python-pytablereader/python-pytablereader.hash    |  3 +++
 package/python-pytablereader/python-pytablereader.mk  | 14 ++++++++++++++
 4 files changed, 37 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 809c995..2bcb5d2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -773,6 +773,7 @@ menu "External python modules"
 	source "package/python-pysnmp-apps/Config.in"
 	source "package/python-pysnmp-mibs/Config.in"
 	source "package/python-pysocks/Config.in"
+	source "package/python-pytablereader/Config.in"
 	source "package/python-pytablewriter/Config.in"
 	source "package/python-pytrie/Config.in"
 	source "package/python-pytz/Config.in"
diff --git a/package/python-pytablereader/Config.in b/package/python-pytablereader/Config.in
new file mode 100644
index 0000000..050ff65
--- /dev/null
+++ b/package/python-pytablereader/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_PYTHON_PYTABLEREADER
+	bool "python-pytablereader"
+	select BR2_PACKAGE_PYTHON_BEAUTIFULSOUP4 # runtime
+	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
+	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
+	select BR2_PACKAGE_PYTHON_LOGBOOK # runtime
+	select BR2_PACKAGE_PYTHON_MARKDOWN2 # runtime
+	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
+	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
+	select BR2_PACKAGE_PYTHON_PATHPY # runtime
+	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_XLRD # runtime
+	help
+	  A python library to load structured table data from
+	  files/URL with various data formats:
+	  CSV/Excel/HTML/JSON/LTSV/Markdown/TSV.
+
+	  https://github.com/thombashi/pytablereader
diff --git a/package/python-pytablereader/python-pytablereader.hash b/package/python-pytablereader/python-pytablereader.hash
new file mode 100644
index 0000000..7d1438a
--- /dev/null
+++ b/package/python-pytablereader/python-pytablereader.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/pytablereader/json, sha256 locally computed
+md5	ae95462a1a982186d1307ee0d6e275e2  pytablereader-0.8.8.tar.gz
+sha256	6ba95dc699d2c7ab7bc4b3f0224a17404255d110a3ece8ba12217d650aa7de79  pytablereader-0.8.8.tar.gz
diff --git a/package/python-pytablereader/python-pytablereader.mk b/package/python-pytablereader/python-pytablereader.mk
new file mode 100644
index 0000000..2b6f2d4
--- /dev/null
+++ b/package/python-pytablereader/python-pytablereader.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pytablereader
+#
+################################################################################
+
+PYTHON_PYTABLEREADER_VERSION = 0.8.8
+PYTHON_PYTABLEREADER_SOURCE = pytablereader-$(PYTHON_PYTABLEREADER_VERSION).tar.gz
+PYTHON_PYTABLEREADER_SITE = https://pypi.python.org/packages/05/0c/7801617e60ce0d9b4cc57cb542cc431a95b9f43ac1ac14030017163da29d
+PYTHON_PYTABLEREADER_SETUP_TYPE = setuptools
+PYTHON_PYTABLEREADER_LICENSE = MIT
+PYTHON_PYTABLEREADER_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

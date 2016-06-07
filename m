From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 13:12:32 +0200
Subject: [Buildroot] [git commit] python-xlsxwriter: new package
Message-ID: <20160607111301.ED2FF81EB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=297b07d88ab0dfaaadbdecc814d458f8cbc6237e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |  1 +
 package/python-xlsxwriter/Config.in              |  8 ++++++++
 package/python-xlsxwriter/python-xlsxwriter.hash |  4 ++++
 package/python-xlsxwriter/python-xlsxwriter.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 9f6e0d9..46d7977 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -765,6 +765,7 @@ menu "External python modules"
 	source "package/python-werkzeug/Config.in"
 	source "package/python-ws4py/Config.in"
 	source "package/python-wsaccel/Config.in"
+	source "package/python-xlsxwriter/Config.in"
 	source "package/python-zope-interface/Config.in"
 endmenu
 endif
diff --git a/package/python-xlsxwriter/Config.in b/package/python-xlsxwriter/Config.in
new file mode 100644
index 0000000..3641bd0
--- /dev/null
+++ b/package/python-xlsxwriter/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_XLSXWRITER
+	bool "python-xlsxwriter"
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
+	help
+	  A Python module for creating Excel XLSX files.
+
+	  https://github.com/jmcnamara/XlsxWriter
diff --git a/package/python-xlsxwriter/python-xlsxwriter.hash b/package/python-xlsxwriter/python-xlsxwriter.hash
new file mode 100644
index 0000000..69bfc6f
--- /dev/null
+++ b/package/python-xlsxwriter/python-xlsxwriter.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/XlsxWriter/json
+md5	545c938f279abcfd7f11e705012302fe  XlsxWriter-0.8.9.tar.gz
+# sha256 locally computed
+sha256	cb90c5283b88af72549adf82f203d15623a0f4faeae29b6a20733e187dfde882  XlsxWriter-0.8.9.tar.gz
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
new file mode 100644
index 0000000..af911cc
--- /dev/null
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-xlsxwriter
+#
+################################################################################
+
+PYTHON_XLSXWRITER_VERSION = 0.8.9
+PYTHON_XLSXWRITER_SOURCE = XlsxWriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
+PYTHON_XLSXWRITER_SITE = https://pypi.python.org/packages/2a/de/4ee20ac103417662865e0e3acde859b002c13f52af0d50a2664d3eca5897
+PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
+PYTHON_XLSXWRITER_LICENSE = BSD-2c
+PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))

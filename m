From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jun 2016 22:52:48 +0200
Subject: [Buildroot] [git commit] python-pytablewriter: new package
Message-ID: <20160620205603.48C1881D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ba8c959239499fd4abd74c90d1f8100252b3fc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                      |  1 +
 package/python-pytablewriter/Config.in                 | 13 +++++++++++++
 package/python-pytablewriter/python-pytablewriter.hash |  4 ++++
 package/python-pytablewriter/python-pytablewriter.mk   | 14 ++++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index aa1da13..ce71afb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -758,6 +758,7 @@ menu "External python modules"
 	source "package/python-six/Config.in"
 	source "package/python-smbus-cffi/Config.in"
 	source "package/python-spidev/Config.in"
+	source "package/python-pytablewriter/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-treq/Config.in"
diff --git a/package/python-pytablewriter/Config.in b/package/python-pytablewriter/Config.in
new file mode 100644
index 0000000..6c19745
--- /dev/null
+++ b/package/python-pytablewriter/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_PYTABLEWRITER
+	bool "python-pytablewriter"
+	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
+	select BR2_PACKAGE_PYTHON_DOMINATE # runtime
+	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_XLSXWRITER # runtime
+	help
+	  pytablewriter is a python library to write a table in various
+	  formats: CSV, HTML, JavaScript, JSON, Markdown, Excel, Pandas,
+	  Python, reStructuredText.
+
+	  https://github.com/thombashi/pytablewriter
diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
new file mode 100644
index 0000000..8684fca
--- /dev/null
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/pytablewriter/json
+md5	173ec08d6e0ded5219abaa1cb906ce62  pytablewriter-0.1.6.tar.gz
+# sha256 calculated by scanpypi
+sha256	7faee0d52b13048d89157a82c38a8fa19512df625572dd918b2f43944c034d2d  pytablewriter-0.1.6.tar.gz
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
new file mode 100644
index 0000000..879102c
--- /dev/null
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pytablewriter
+#
+################################################################################
+
+PYTHON_PYTABLEWRITER_VERSION = 0.1.6
+PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
+PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/da/34/394aeb8850d17a5e93ab931bc9fda1fbf598fe14e443be040c04f92cd1e3
+PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
+PYTHON_PYTABLEWRITER_LICENSE = MIT
+PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

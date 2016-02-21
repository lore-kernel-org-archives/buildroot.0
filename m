From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 23:28:12 +0100
Subject: [Buildroot] [git commit branch/next] python-iniparse: new package
Message-ID: <20160221222828.59C6980AE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=699a992f9b0f1f98583e87b564145c2606f695f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |  1 +
 package/python-iniparse/Config.in            | 11 +++++++++++
 package/python-iniparse/python-iniparse.hash |  4 ++++
 package/python-iniparse/python-iniparse.mk   | 14 ++++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 23fd62c..ba50199 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -656,6 +656,7 @@ menu "External python modules"
 	source "package/python-httplib2/Config.in"
 	source "package/python-id3/Config.in"
 	source "package/python-idna/Config.in"
+	source "package/python-iniparse/Config.in"
 	source "package/python-ipaddr/Config.in"
 	source "package/python-ipaddress/Config.in"
 	source "package/python-ipy/Config.in"
diff --git a/package/python-iniparse/Config.in b/package/python-iniparse/Config.in
new file mode 100644
index 0000000..65c1064
--- /dev/null
+++ b/package/python-iniparse/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_INIPARSE
+	bool "python-iniparse"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  iniparse is an INI parser for Python which is API compatible
+	  with the standard library's ConfigParser, preserves
+	  structure of INI files (order of sections & options,
+	  indentation, comments, and blank lines are preserved when
+	  data is updated), and is more convenient to use.
+
+	  https://pypi.python.org/pypi/iniparse
diff --git a/package/python-iniparse/python-iniparse.hash b/package/python-iniparse/python-iniparse.hash
new file mode 100644
index 0000000..d7d8e93
--- /dev/null
+++ b/package/python-iniparse/python-iniparse.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=5e573e9e9733d97623881ce9bbe5eca6, sha256 locally computed
+md5 5e573e9e9733d97623881ce9bbe5eca6 iniparse-0.4.tar.gz
+sha256 abc1ee12d2cfb2506109072d6c21e40b6c75a3fe90a9c924327d80bc0d99c054  iniparse-0.4.tar.gz
+
diff --git a/package/python-iniparse/python-iniparse.mk b/package/python-iniparse/python-iniparse.mk
new file mode 100644
index 0000000..b00e0c4
--- /dev/null
+++ b/package/python-iniparse/python-iniparse.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-iniparse
+#
+################################################################################
+
+PYTHON_INIPARSE_VERSION = 0.4
+PYTHON_INIPARSE_SOURCE = iniparse-$(PYTHON_INIPARSE_VERSION).tar.gz
+PYTHON_INIPARSE_SITE = https://pypi.python.org/packages/source/i/iniparse
+PYTHON_INIPARSE_LICENSE = Python software foundation license v2, MIT
+PYTHON_INIPARSE_LICENSE_FILES = LICENSE-PSF LICENSE
+PYTHON_INIPARSE_SETUP_TYPE = distutils
+
+$(eval $(python-package))

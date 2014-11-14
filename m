From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Nov 2014 16:00:36 +0100
Subject: [Buildroot] [git commit branch/next] package: add python-jinja2
Message-ID: <20141114180459.1D12AB2486@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b534b5aaca63fd0c981ea421999bcd4b562fecda
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                        |    1 +
 package/python-jinja2/Config.in          |    8 ++++++++
 package/python-jinja2/python-jinja2.hash |    3 +++
 package/python-jinja2/python-jinja2.mk   |   14 ++++++++++++++
 4 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ace08e0..4e89447 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -493,6 +493,7 @@ menu "external python modules"
 	source "package/python-id3/Config.in"
 	source "package/python-ipy/Config.in"
 	source "package/python-ipython/Config.in"
+	source "package/python-jinja2/Config.in"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-keyring/Config.in"
 	source "package/python-libconfig/Config.in"
diff --git a/package/python-jinja2/Config.in b/package/python-jinja2/Config.in
new file mode 100644
index 0000000..1d9131a
--- /dev/null
+++ b/package/python-jinja2/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_JINJA2
+	bool "python-jinja2"
+	help
+	  Jinja2 is a template engine written in pure Python. It
+	  provides a Django inspired non-XML syntax but supports
+	  inline expressions and an optional sandboxed environment.
+
+	  http://jinja.pocoo.org/
diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
new file mode 100644
index 0000000..6e8c160
--- /dev/null
+++ b/package/python-jinja2/python-jinja2.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b9dffd2f3b43d673802fe857c8445b1a, sha256 locally computed
+md5	b9dffd2f3b43d673802fe857c8445b1a  Jinja2-2.7.3.tar.gz
+sha256	2e24ac5d004db5714976a04ac0e80c6df6e47e98c354cb2c0d82f8879d4f8fdb  Jinja2-2.7.3.tar.gz
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
new file mode 100644
index 0000000..49625e3
--- /dev/null
+++ b/package/python-jinja2/python-jinja2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-jinja2
+#
+################################################################################
+
+PYTHON_JINJA2_VERSION = 2.7.3
+PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
+PYTHON_JINJA2_SITE = http://pypi.python.org/packages/source/J/Jinja2
+PYTHON_JINJA2_SETUP_TYPE = setuptools
+PYTHON_JINJA2_LICENSE = BSD-3c
+PYTHON_JINJA2_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Feb 2015 00:07:36 +0100
Subject: [Buildroot] [git commit] python-six: new package
Message-ID: <20150131230757.377CD804A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96bc60efa4e81bf552d88e215d7821129bba84b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                  |    1 +
 package/python-six/Config.in       |    9 +++++++++
 package/python-six/python-six.hash |    2 ++
 package/python-six/python-six.mk   |   14 ++++++++++++++
 4 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d140721..095126d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -547,6 +547,7 @@ menu "external python modules"
 	source "package/python-serial/Config.in"
 	source "package/python-setuptools/Config.in"
 	source "package/python-simplejson/Config.in"
+	source "package/python-six/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-twisted/Config.in"
diff --git a/package/python-six/Config.in b/package/python-six/Config.in
new file mode 100644
index 0000000..0a8b69a
--- /dev/null
+++ b/package/python-six/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_SIX
+	bool "python-six"
+	help
+	  Six is a Python 2 and 3 compatibility library. It provides
+	  utility functions for smoothing over the differences between
+	  the Python versions with the goal of writing Python code that
+	  is compatible on both Python versions.
+
+	  http://pythonhosted.org/six
diff --git a/package/python-six/python-six.hash b/package/python-six/python-six.hash
new file mode 100644
index 0000000..6121a08
--- /dev/null
+++ b/package/python-six/python-six.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  e24052411fc4fbd1f672635537c3fc2330d9481b18c0317695b46259512c91d5  six-1.9.0.tar.gz
diff --git a/package/python-six/python-six.mk b/package/python-six/python-six.mk
new file mode 100644
index 0000000..08fe5de
--- /dev/null
+++ b/package/python-six/python-six.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-six
+#
+################################################################################
+
+PYTHON_SIX_VERSION = 1.9.0
+PYTHON_SIX_SOURCE = six-$(PYTHON_SIX_VERSION).tar.gz
+PYTHON_SIX_SITE = https://pypi.python.org/packages/source/s/six/
+PYTHON_SIX_SETUP_TYPE = setuptools
+PYTHON_SIX_LICENSE = MIT
+PYTHON_SIX_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

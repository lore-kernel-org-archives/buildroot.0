From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Nov 2014 15:15:10 +0100
Subject: [Buildroot] [git commit branch/next] package: add python-werkzeug
Message-ID: <20141114180459.13A3AB2486@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=deb7dcd48707f4e65774b45d7fbaf21b5dc58ec0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                            |    1 +
 package/python-werkzeug/Config.in            |    7 +++++++
 package/python-werkzeug/python-werkzeug.hash |    3 +++
 package/python-werkzeug/python-werkzeug.mk   |   14 ++++++++++++++
 4 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 28cf703..ace08e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -523,6 +523,7 @@ menu "external python modules"
 	source "package/python-tornado/Config.in"
 	source "package/python-urwid/Config.in"
 	source "package/python-versiontools/Config.in"
+	source "package/python-werkzeug/Config.in"
 endmenu
 endif
 	source "package/ruby/Config.in"
diff --git a/package/python-werkzeug/Config.in b/package/python-werkzeug/Config.in
new file mode 100644
index 0000000..2097d6e
--- /dev/null
+++ b/package/python-werkzeug/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_WERKZEUG
+	bool "python-werkzeug"
+	help
+	  Werkzeug is a WSGI utility library for Python. It's widely
+	  used and BSD licensed.
+
+	  http://werkzeug.pocoo.org/
diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
new file mode 100644
index 0000000..38f622a
--- /dev/null
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f7afcadc03b0f2267bdc156c34586043, sha256 locally computed
+md5	f7afcadc03b0f2267bdc156c34586043  Werkzeug-0.9.6.tar.gz
+sha256	7f11e7e2e73eb22677cac1b11113eb6106f66cedef13d140e83cf6563c90b79c  Werkzeug-0.9.6.tar.gz
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
new file mode 100644
index 0000000..8902d17
--- /dev/null
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-werkzeug
+#
+################################################################################
+
+PYTHON_WERKZEUG_VERSION = 0.9.6
+PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
+PYTHON_WERKZEUG_SITE = http://pypi.python.org/packages/source/W/Werkzeug
+PYTHON_WERKZEUG_SETUP_TYPE = setuptools
+PYTHON_WERKZEUG_LICENSE = BSD-3c
+PYTHON_WERKZEUG_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

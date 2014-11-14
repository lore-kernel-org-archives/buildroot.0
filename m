From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Nov 2014 19:00:11 +0100
Subject: [Buildroot] [git commit branch/next] package: add python-flask
Message-ID: <20141114180459.3437FB24FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=541d9452237ba5fc00a42a0a7e4019518d7ec4ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                      |    1 +
 package/python-flask/Config.in         |   10 ++++++++++
 package/python-flask/python-flask.hash |    3 +++
 package/python-flask/python-flask.mk   |   15 +++++++++++++++
 4 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ba97db7..3e5ad39 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -489,6 +489,7 @@ menu "external python modules"
 	source "package/python-daemon/Config.in"
 	source "package/python-dialog/Config.in"
 	source "package/python-dpkt/Config.in"
+	source "package/python-flask/Config.in"
 	source "package/python-flup/Config.in"
 	source "package/python-id3/Config.in"
 	source "package/python-ipy/Config.in"
diff --git a/package/python-flask/Config.in b/package/python-flask/Config.in
new file mode 100644
index 0000000..4a955c4
--- /dev/null
+++ b/package/python-flask/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_FLASK
+	bool "python-flask"
+	select BR2_PACKAGE_PYTHON_WERKZEUG
+	select BR2_PACKAGE_PYTHON_JINJA2
+	select BR2_PACKAGE_PYTHON_ITSDANGEROUS
+	help
+	  Flask is a microframework for Python based on Werkzeug,
+	  Jinja 2 and good intentions.
+
+	  http://flask.pocoo.org/
diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
new file mode 100644
index 0000000..55d0a5c
--- /dev/null
+++ b/package/python-flask/python-flask.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=378670fe456957eb3c27ddaef60b2b24, sha256 locally computed
+md5	378670fe456957eb3c27ddaef60b2b24  Flask-0.10.1.tar.gz
+sha256	4c83829ff83d408b5e1d4995472265411d2c414112298f2eb4b359d9e4563373  Flask-0.10.1.tar.gz
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
new file mode 100644
index 0000000..d7e3d1f
--- /dev/null
+++ b/package/python-flask/python-flask.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-flask
+#
+################################################################################
+
+PYTHON_FLASK_VERSION = 0.10.1
+PYTHON_FLASK_SOURCE = Flask-$(PYTHON_FLASK_VERSION).tar.gz
+PYTHON_FLASK_SITE = http://pypi.python.org/packages/source/F/Flask
+PYTHON_FLASK_SETUP_TYPE = setuptools
+PYTHON_FLASK_LICENSE = BSD-3c
+PYTHON_FLASK_LICENSE_FILES = LICENSE
+PYTHON_FLASH_DEPENDENCIES = python-werkzeug python-jinja2 python-itsdangerous
+
+$(eval $(python-package))

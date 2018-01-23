From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 22 Jan 2018 22:17:27 -0600
Subject: [Buildroot] [PATCH 1/2] python-flask-cors: new package
Message-ID: <1516681048-16580-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A Flask extension for handling Cross Origin Resource
Sharing (CORS), making cross-origin AJAX possible.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in                                |  1 +
 package/python-flask-cors/Config.in              | 10 ++++++++++
 package/python-flask-cors/python-flask-cors.hash |  3 +++
 package/python-flask-cors/python-flask-cors.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-flask-cors/Config.in
 create mode 100644 package/python-flask-cors/python-flask-cors.hash
 create mode 100644 package/python-flask-cors/python-flask-cors.mk

diff --git a/package/Config.in b/package/Config.in
index 00451f5..25aa095 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -771,6 +771,7 @@ menu "External python modules"
 	source "package/python-enum34/Config.in"
 	source "package/python-flask/Config.in"
 	source "package/python-flask-babel/Config.in"
+	source "package/python-flask-cors/Config.in"
 	source "package/python-flask-jsonrpc/Config.in"
 	source "package/python-flask-login/Config.in"
 	source "package/python-flup/Config.in"
diff --git a/package/python-flask-cors/Config.in b/package/python-flask-cors/Config.in
new file mode 100644
index 0000000..46e629c
--- /dev/null
+++ b/package/python-flask-cors/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_FLASK_CORS
+	bool "python-flask-cors"
+	# runtime dependency
+	select BR2_PACKAGE_PYTHON_FLASK
+	help
+	  Flask-Cors provides a Flask extension for handling
+	  Cross Origin Resource Sharing (CORS), making
+	  cross-origin AJAX possible.
+
+	  https://github.com/corydolphin/flask-cors
diff --git a/package/python-flask-cors/python-flask-cors.hash b/package/python-flask-cors/python-flask-cors.hash
new file mode 100644
index 0000000..089d1ca
--- /dev/null
+++ b/package/python-flask-cors/python-flask-cors.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/Flask-Cors, sha256 locally computed
+md5 ddc12bdf8fa19a4ce1504ab9d0b0a8bc Flask-Cors-3.0.3.tar.gz
+sha256 62ebc5ad80dc21ca0ea9f57466c2c74e24a62274af890b391790c260eb7b754b  Flask-Cors-3.0.3.tar.gz
diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
new file mode 100644
index 0000000..1270065
--- /dev/null
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-flask-cors
+#
+################################################################################
+
+PYTHON_FLASK_CORS_VERSION = 3.0.3
+PYTHON_FLASK_CORS_SOURCE = Flask-Cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
+PYTHON_FLASK_CORS_SITE = https://pypi.python.org/packages/64/e8/e6bcf79dcad7b7c10f8c8c35d78b5710f2ddcd8ed38e607dd6a4853ab8a8
+PYTHON_FLASK_CORS_LICENSE = MIT
+PYTHON_FLASK_CORS_LICENSE_FILES = LICENSE
+PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
1.9.1

From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 23 Jan 2018 08:25:16 -0600
Subject: [Buildroot] [PATCH v2] python-flask-cors: new package
Message-ID: <1516717516-8143-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A Flask extension for handling Cross Origin Resource
Sharing (CORS), making cross-origin AJAX possible.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
--
Changes v1 -> v2
[Yegor
 - Use scanpypi to generate package
 - Consolidate DEVELOPERS addition into this patch
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-flask-cors/Config.in              |  8 ++++++++
 package/python-flask-cors/python-flask-cors.hash |  4 ++++
 package/python-flask-cors/python-flask-cors.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-flask-cors/Config.in
 create mode 100644 package/python-flask-cors/python-flask-cors.hash
 create mode 100644 package/python-flask-cors/python-flask-cors.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 73c0231..1db5503 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1171,6 +1171,7 @@ F:	package/policycoreutils/
 F:	package/proftpd/
 F:	package/protobuf-c/
 F:	package/protobuf/
+F:	package/python-flask-cors/
 F:	package/python-ipy/
 F:	package/python-posix-ipc/
 F:	package/python-pypcap/
diff --git a/package/Config.in b/package/Config.in
index 00451f5..9a6b199 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -770,6 +770,7 @@ menu "External python modules"
 	source "package/python-enum/Config.in"
 	source "package/python-enum34/Config.in"
 	source "package/python-flask/Config.in"
+	source "package/python-flask-cors/Config.in"
 	source "package/python-flask-babel/Config.in"
 	source "package/python-flask-jsonrpc/Config.in"
 	source "package/python-flask-login/Config.in"
diff --git a/package/python-flask-cors/Config.in b/package/python-flask-cors/Config.in
new file mode 100644
index 0000000..e2e8479
--- /dev/null
+++ b/package/python-flask-cors/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_FLASK_CORS
+	bool "python-flask-cors"
+	select BR2_PACKAGE_PYTHON_FLASK # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  A Flask extension adding a decorator for CORS support.
+
+	  https://github.com/corydolphin/flask-cors
diff --git a/package/python-flask-cors/python-flask-cors.hash b/package/python-flask-cors/python-flask-cors.hash
new file mode 100644
index 0000000..5a8256e
--- /dev/null
+++ b/package/python-flask-cors/python-flask-cors.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/flask-cors/json, sha256 locally computed
+md5	ddc12bdf8fa19a4ce1504ab9d0b0a8bc  Flask-Cors-3.0.3.tar.gz
+sha256	62ebc5ad80dc21ca0ea9f57466c2c74e24a62274af890b391790c260eb7b754b  Flask-Cors-3.0.3.tar.gz
+sha256	6e1a1bdc54834c1e0740cbce5d5f6f2cae1c846fd2a7f482b11649594fafbd5d  LICENSE
diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
new file mode 100644
index 0000000..6d5900b
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
+PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
+PYTHON_FLASK_CORS_LICENSE = MIT
+PYTHON_FLASK_CORS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
1.9.1

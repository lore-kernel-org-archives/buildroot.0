From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  8 Mar 2021 20:59:12 +0100
Subject: [Buildroot] [PATCH v1 4/4] package/python-flask-wtf: new package
In-Reply-To: <20210308195912.10749-1-ps.report@gmx.net>
References: <20210308195912.10749-1-ps.report@gmx.net>
Message-ID: <20210308195912.10749-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-flask-wtf/Config.in             |  9 +++++++++
 package/python-flask-wtf/python-flask-wtf.hash |  6 ++++++
 package/python-flask-wtf/python-flask-wtf.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/python-flask-wtf/Config.in
 create mode 100644 package/python-flask-wtf/python-flask-wtf.hash
 create mode 100644 package/python-flask-wtf/python-flask-wtf.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f7f8587d1b..6a1335128d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2106,6 +2106,7 @@ F:	package/libuev/
 F:	package/log4cplus/
 F:	package/postgresql/
 F:	package/python-colorzero/
+F:	package/python-flask-wtf/
 F:	package/python-gpiozero/
 F:	package/qt5/
 F:	package/quotatool/
diff --git a/package/Config.in b/package/Config.in
index 992e46a319..1a7d54d12f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -988,6 +988,7 @@ menu "External python modules"
 	source "package/python-flask-jsonrpc/Config.in"
 	source "package/python-flask-login/Config.in"
 	source "package/python-flask-sqlalchemy/Config.in"
+	source "package/python-flask-wtf/Config.in"
 	source "package/python-flatbuffers/Config.in"
 	source "package/python-flup/Config.in"
 	source "package/python-frozenlist/Config.in"
diff --git a/package/python-flask-wtf/Config.in b/package/python-flask-wtf/Config.in
new file mode 100644
index 0000000000..bb15489956
--- /dev/null
+++ b/package/python-flask-wtf/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_FLASK_WTF
+	bool "python-flask-wtf"
+	select BR2_PACKAGE_PYTHON_FLASK # runtime
+	select BR2_PACKAGE_PYTHON_ITSDANGEROUS # runtime
+	select BR2_PACKAGE_PYTHON_WTFORMS # runtime
+	help
+	  Simple integration of Flask and WTForms.
+
+	  https://github.com/lepture/flask-wtf
diff --git a/package/python-flask-wtf/python-flask-wtf.hash b/package/python-flask-wtf/python-flask-wtf.hash
new file mode 100644
index 0000000000..cff3661824
--- /dev/null
+++ b/package/python-flask-wtf/python-flask-wtf.hash
@@ -0,0 +1,6 @@
+# From https://pypi.org/project/Flask-WTF/#copy-hash-modal-d090dbe5-8665-4c96-a565-57134e470a60
+md5  1b60b7dd1245b0d0173c21123717af61  Flask-WTF-0.14.3.tar.gz
+sha256  d417e3a0008b5ba583da1763e4db0f55a1269d9dd91dcc3eb3c026d3c5dbd720  Flask-WTF-0.14.3.tar.gz
+
+# License files
+sha256  a075f8d98acfdb05dd98716242b9e2c1b3ab98722926b3c4cf6c916ac14e8350  LICENSE
diff --git a/package/python-flask-wtf/python-flask-wtf.mk b/package/python-flask-wtf/python-flask-wtf.mk
new file mode 100644
index 0000000000..a334e3c052
--- /dev/null
+++ b/package/python-flask-wtf/python-flask-wtf.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-flask-wtf
+#
+################################################################################
+
+PYTHON_FLASK_WTF_VERSION = 0.14.3
+PYTHON_FLASK_WTF_SOURCE = Flask-WTF-$(PYTHON_FLASK_WTF_VERSION).tar.gz
+PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/2e/f4/3d9e1905ffad67e20ef4f5963d711e8e29ab9439120d7ffec3d2922020e3
+PYTHON_FLASK_WTF_LICENSE = BSD-3-Clause
+PYTHON_FLASK_WTF_LICENSE_FILES = LICENSE
+PYTHON_FLASK_WTF_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.30.1

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 18:09:55 +0100
Subject: [Buildroot] [git commit] package/python-flask-wtf: new package
Message-ID: <20210314164744.65E9881539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62b59d6027219e476fdf1a05ce06b8eb97e8b87c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-flask-wtf/Config.in             |  9 +++++++++
 package/python-flask-wtf/python-flask-wtf.hash |  6 ++++++
 package/python-flask-wtf/python-flask-wtf.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ad6bd1f241..1358971782 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2104,6 +2104,7 @@ F:	package/libuev/
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

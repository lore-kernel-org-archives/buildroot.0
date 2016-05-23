From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 14:04:11 +0200
Subject: [Buildroot] [git commit branch/next] python-flask-login: new package
Message-ID: <20160523120415.9065781744@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4946b1956790618fb31ded9970d10a88ba77b545
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 package/python-flask-login/Config.in               |  8 ++++++++
 package/python-flask-login/python-flask-login.hash |  3 +++
 package/python-flask-login/python-flask-login.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 8668612..e64e058 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -659,6 +659,7 @@ menu "External python modules"
 	source "package/python-enum34/Config.in"
 	source "package/python-flask/Config.in"
 	source "package/python-flask-jsonrpc/Config.in"
+	source "package/python-flask-login/Config.in"
 	source "package/python-flup/Config.in"
 	source "package/python-gobject/Config.in"
 	source "package/python-html5lib/Config.in"
diff --git a/package/python-flask-login/Config.in b/package/python-flask-login/Config.in
new file mode 100644
index 0000000..88c413e
--- /dev/null
+++ b/package/python-flask-login/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_FLASK_LOGIN
+	bool "python-flask-login"
+	# runtime dependency
+	select BR2_PACKAGE_PYTHON_FLASK
+	help
+	  Flask-Login provides user session management for Flask.
+
+	  https://github.com/maxcountryman/flask-login
diff --git a/package/python-flask-login/python-flask-login.hash b/package/python-flask-login/python-flask-login.hash
new file mode 100644
index 0000000..c488a35
--- /dev/null
+++ b/package/python-flask-login/python-flask-login.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/Flask-Login/0.3.2, sha256 locally computed:
+md5    d95c2275d3e1c755145910077366dc45                                 Flask-Login-0.3.2.tar.gz
+sha256 e72eff5c35e5a31db1aeca1db5d2501be702674ea88e8f223b5d2b11644beee6 Flask-Login-0.3.2.tar.gz
diff --git a/package/python-flask-login/python-flask-login.mk b/package/python-flask-login/python-flask-login.mk
new file mode 100644
index 0000000..aa6d8e3
--- /dev/null
+++ b/package/python-flask-login/python-flask-login.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-flask-login
+#
+################################################################################
+
+PYTHON_FLASK_LOGIN_VERSION = 0.3.2
+PYTHON_FLASK_LOGIN_SOURCE = Flask-Login-$(PYTHON_FLASK_LOGIN_VERSION).tar.gz
+PYTHON_FLASK_LOGIN_SITE = http://pypi.python.org/packages/source/F/Flask-Login
+PYTHON_FLASK_LOGIN_LICENSE = MIT
+PYTHON_FLASK_LOGIN_LICENSE_FILES = LICENSE
+PYTHON_FLASK_LOGIN_SETUP_TYPE = setuptools
+
+$(eval $(python-package))

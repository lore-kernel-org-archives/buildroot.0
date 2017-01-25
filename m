From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 14:13:10 +1300
Subject: [Buildroot] [git commit] python-flask-babel: new package
Message-ID: <20170125011321.16BF17FB4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a72acb3adb6a6705d5fc64d9521e95e872b0e95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Flask-Babel is an extension to Flask that adds i18n and l10n support
to any Flask application with the help of babel, pytz and
speaklater. It has builtin support for date formatting with timezone
support as well as a very simple and friendly interface to gettext
translations.

Signed-off-by: Lionel Flandrin <lionel@svkt.org>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 package/python-flask-babel/Config.in               | 12 ++++++++++++
 package/python-flask-babel/python-flask-babel.hash |  3 +++
 package/python-flask-babel/python-flask-babel.mk   | 14 ++++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 4df2361..434f406 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -687,6 +687,7 @@ menu "External python modules"
 	source "package/python-enum/Config.in"
 	source "package/python-enum34/Config.in"
 	source "package/python-flask/Config.in"
+	source "package/python-flask-babel/Config.in"
 	source "package/python-flask-jsonrpc/Config.in"
 	source "package/python-flask-login/Config.in"
 	source "package/python-flup/Config.in"
diff --git a/package/python-flask-babel/Config.in b/package/python-flask-babel/Config.in
new file mode 100644
index 0000000..61fd2c0
--- /dev/null
+++ b/package/python-flask-babel/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_FLASK_BABEL
+	bool "python-flask-babel"
+	select BR2_PACKAGE_PYTHON_FLASK # runtime
+	select BR2_PACKAGE_PYTHON_BABEL # runtime
+	help
+	  Flask-Babel is an extension to Flask that adds i18n and l10n
+	  support to any Flask application with the help of babel,
+	  pytz and speaklater. It has builtin support for date
+	  formatting with timezone support as well as a very simple
+	  and friendly interface to gettext translations.
+
+	  https://pythonhosted.org/Flask-Babel/
diff --git a/package/python-flask-babel/python-flask-babel.hash b/package/python-flask-babel/python-flask-babel.hash
new file mode 100644
index 0000000..c4420e4
--- /dev/null
+++ b/package/python-flask-babel/python-flask-babel.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/Flask-Babel/json, sha256 locally computed
+md5	658e84a20ddc545a7612144fe2c758d3  Flask-Babel-0.11.1.tar.gz
+sha256	d29b36c399e42e98bc9401c8c1c159f2befcb8c12a2a2a87ec49ad7623036899  Flask-Babel-0.11.1.tar.gz
diff --git a/package/python-flask-babel/python-flask-babel.mk b/package/python-flask-babel/python-flask-babel.mk
new file mode 100644
index 0000000..35d34d1
--- /dev/null
+++ b/package/python-flask-babel/python-flask-babel.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-flask-babel
+#
+################################################################################
+
+PYTHON_FLASK_BABEL_VERSION = 0.11.1
+PYTHON_FLASK_BABEL_SOURCE = Flask-Babel-$(PYTHON_FLASK_BABEL_VERSION).tar.gz
+PYTHON_FLASK_BABEL_SITE = https://pypi.python.org/packages/47/96/6013d4091fb4238e27e918aec4929f082942fa8c9489ae3aad2f18de4b5b
+PYTHON_FLASK_BABEL_LICENSE = BSD-3c
+PYTHON_FLASK_BABEL_SETUP_TYPE = setuptools
+PYTHON_FLASK_BABEL_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 19 Oct 2019 19:14:35 +0200
Subject: [Buildroot] [git commit] package/python-flask-babel: bump to
 version 0.12.0
Message-ID: <20191019171204.D1016826DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f73e744fa8dd958a5d23163daabd45833644fa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-flask-babel/Config.in               | 1 +
 package/python-flask-babel/python-flask-babel.hash | 8 +++++---
 package/python-flask-babel/python-flask-babel.mk   | 4 ++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-flask-babel/Config.in b/package/python-flask-babel/Config.in
index 61fd2c0570..272d9ef1c1 100644
--- a/package/python-flask-babel/Config.in
+++ b/package/python-flask-babel/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_FLASK_BABEL
 	bool "python-flask-babel"
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_BABEL # runtime
+	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
 	help
 	  Flask-Babel is an extension to Flask that adds i18n and l10n
 	  support to any Flask application with the help of babel,
diff --git a/package/python-flask-babel/python-flask-babel.hash b/package/python-flask-babel/python-flask-babel.hash
index c4420e4a99..e059a594d5 100644
--- a/package/python-flask-babel/python-flask-babel.hash
+++ b/package/python-flask-babel/python-flask-babel.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/Flask-Babel/json, sha256 locally computed
-md5	658e84a20ddc545a7612144fe2c758d3  Flask-Babel-0.11.1.tar.gz
-sha256	d29b36c399e42e98bc9401c8c1c159f2befcb8c12a2a2a87ec49ad7623036899  Flask-Babel-0.11.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/flask-babel/json
+md5	fcf2f360ff279d3133e40974804efd72  Flask-Babel-0.12.2.tar.gz
+sha256	316ad183e42003f3922957fa643d0a1e8e34a0f0301a88c3a8f605bc37ba5c86  Flask-Babel-0.12.2.tar.gz
+# Locally computed sha256 checksums
+sha256	a526100a7047237360a394ba4f70ae801b50ff9b8c9b9e73e7795480a59f6b7e  LICENSE
diff --git a/package/python-flask-babel/python-flask-babel.mk b/package/python-flask-babel/python-flask-babel.mk
index 0b74149ff4..978d29943b 100644
--- a/package/python-flask-babel/python-flask-babel.mk
+++ b/package/python-flask-babel/python-flask-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_BABEL_VERSION = 0.11.1
+PYTHON_FLASK_BABEL_VERSION = 0.12.2
 PYTHON_FLASK_BABEL_SOURCE = Flask-Babel-$(PYTHON_FLASK_BABEL_VERSION).tar.gz
-PYTHON_FLASK_BABEL_SITE = https://pypi.python.org/packages/47/96/6013d4091fb4238e27e918aec4929f082942fa8c9489ae3aad2f18de4b5b
+PYTHON_FLASK_BABEL_SITE = https://files.pythonhosted.org/packages/82/b0/986b29938d4e8be7deb552ebfd1ef16c311276a59bcae10dec567a5b3d20
 PYTHON_FLASK_BABEL_LICENSE = BSD-3-Clause
 PYTHON_FLASK_BABEL_SETUP_TYPE = setuptools
 PYTHON_FLASK_BABEL_LICENSE_FILES = LICENSE

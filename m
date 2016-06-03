From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 09:52:57 +0200
Subject: [Buildroot] [git commit] python-flask: bump to version 0.11
Message-ID: <20160603075313.5092A81F33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e230f4b89fecbad9cda8dcd12b21769008de8e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change download location and rework dependencies, i.e.
select Python's zlib support and python-click package
and remove unneeded build-time dependencies.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-flask/Config.in         | 9 ++++++---
 package/python-flask/python-flask.hash | 6 +++---
 package/python-flask/python-flask.mk   | 5 ++---
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/python-flask/Config.in b/package/python-flask/Config.in
index 4a955c4..6f77913 100644
--- a/package/python-flask/Config.in
+++ b/package/python-flask/Config.in
@@ -1,8 +1,11 @@
 config BR2_PACKAGE_PYTHON_FLASK
 	bool "python-flask"
-	select BR2_PACKAGE_PYTHON_WERKZEUG
-	select BR2_PACKAGE_PYTHON_JINJA2
-	select BR2_PACKAGE_PYTHON_ITSDANGEROUS
+	select BR2_PACKAGE_PYTHON_CLICK # runtime
+	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
+	select BR2_PACKAGE_PYTHON_WERKZEUG # runtime
+	select BR2_PACKAGE_PYTHON_ITSDANGEROUS # runtime
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
 	help
 	  Flask is a microframework for Python based on Werkzeug,
 	  Jinja 2 and good intentions.
diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
index 55d0a5c..1432c55 100644
--- a/package/python-flask/python-flask.hash
+++ b/package/python-flask/python-flask.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=378670fe456957eb3c27ddaef60b2b24, sha256 locally computed
-md5	378670fe456957eb3c27ddaef60b2b24  Flask-0.10.1.tar.gz
-sha256	4c83829ff83d408b5e1d4995472265411d2c414112298f2eb4b359d9e4563373  Flask-0.10.1.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=89fbdcb04b7b96c5b24625ae299cf48b, sha256 locally computed
+md5	89fbdcb04b7b96c5b24625ae299cf48b  Flask-0.11.tar.gz
+sha256	29a7405a7f0de178232fe48cd9b2a2403083bf03bd34eabe12168863d4cdb493  Flask-0.11.tar.gz
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index 8aa675e..db4ba74 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-PYTHON_FLASK_VERSION = 0.10.1
+PYTHON_FLASK_VERSION = 0.11
 PYTHON_FLASK_SOURCE = Flask-$(PYTHON_FLASK_VERSION).tar.gz
-PYTHON_FLASK_SITE = http://pypi.python.org/packages/source/F/Flask
+PYTHON_FLASK_SITE = https://pypi.python.org/packages/dc/ca/c0ed9cc90c079085c698e284b672edbc1ffd6866b1830574095cbc5b7752
 PYTHON_FLASK_SETUP_TYPE = setuptools
 PYTHON_FLASK_LICENSE = BSD-3c
 PYTHON_FLASK_LICENSE_FILES = LICENSE
-PYTHON_FLASK_DEPENDENCIES = python-werkzeug python-jinja2 python-itsdangerous
 
 $(eval $(python-package))

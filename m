From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 23:40:26 +0200
Subject: [Buildroot] [git commit] package/python-django-enumfields: new
 package
Message-ID: <20190927213535.59DC78F95E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4903bbaaefb3588ea257b09c42504944170d7ab2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package lets you use real Python (PEP435-style) enums with Django.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[Thomas: add select on python-enum34 if python 2.x is used]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/python-django-enumfields/Config.in                 |  7 +++++++
 .../python-django-enumfields/python-django-enumfields.hash |  5 +++++
 .../python-django-enumfields/python-django-enumfields.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ee534c8149..393b617ca0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -54,6 +54,7 @@ F:	package/openjdk-bin/
 F:	package/php/
 F:	package/policycoreutils/
 F:	package/python3/
+F:	package/python-django-enumfields/
 F:	package/python-flask-sqlalchemy/
 F:	package/python-mutagen/
 F:	package/python-pip/
diff --git a/package/Config.in b/package/Config.in
index d3f09d45c1..8515eadbd0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -880,6 +880,7 @@ menu "External python modules"
 	source "package/python-dialog3/Config.in"
 	source "package/python-dicttoxml/Config.in"
 	source "package/python-django/Config.in"
+	source "package/python-django-enumfields/Config.in"
 	source "package/python-docker/Config.in"
 	source "package/python-docker-pycreds/Config.in"
 	source "package/python-dockerpty/Config.in"
diff --git a/package/python-django-enumfields/Config.in b/package/python-django-enumfields/Config.in
new file mode 100644
index 0000000000..58dea365ee
--- /dev/null
+++ b/package/python-django-enumfields/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_DJANGO_ENUMFIELDS
+	bool "python-django-enumfields"
+	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
+	help
+	  Real Python Enums for Django.
+
+	  https://github.com/hzdg/django-enumfields
diff --git a/package/python-django-enumfields/python-django-enumfields.hash b/package/python-django-enumfields/python-django-enumfields.hash
new file mode 100644
index 0000000000..84eb028e65
--- /dev/null
+++ b/package/python-django-enumfields/python-django-enumfields.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/django-enumfields/json
+md5	c9725a2c31ca2949d111815742335279  django-enumfields-1.0.0.tar.gz
+sha256	5b0e2dd5973337717ca6bd5a7d9e167e6ae01203c160d4761b88837c4678f219  django-enumfields-1.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256	5548de8c163dc57bd0a4f5772f1509f2c04f1390251c98ebf060c9d52a223f57  LICENSE
diff --git a/package/python-django-enumfields/python-django-enumfields.mk b/package/python-django-enumfields/python-django-enumfields.mk
new file mode 100644
index 0000000000..0121bd1173
--- /dev/null
+++ b/package/python-django-enumfields/python-django-enumfields.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-django-enumfields
+#
+################################################################################
+
+PYTHON_DJANGO_ENUMFIELDS_VERSION = 1.0.0
+PYTHON_DJANGO_ENUMFIELDS_SOURCE = django-enumfields-$(PYTHON_DJANGO_ENUMFIELDS_VERSION).tar.gz
+PYTHON_DJANGO_ENUMFIELDS_SITE = https://files.pythonhosted.org/packages/b7/56/3f4e8d8ef6d5577a1b75b3cfae6dff819afd030e3a519a326ec7a7a0b74f
+PYTHON_DJANGO_ENUMFIELDS_SETUP_TYPE = setuptools
+PYTHON_DJANGO_ENUMFIELDS_LICENSE = MIT
+PYTHON_DJANGO_ENUMFIELDS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

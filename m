From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat,  3 Aug 2019 21:16:24 -0400
Subject: [Buildroot] [PATCH 01/08] package/python-django-enumfields: new
 package
In-Reply-To: <20190804011631.86261-1-aduskett@gmail.com>
References: <20190804011631.86261-1-aduskett@gmail.com>
Message-ID: <20190804011631.86261-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This package lets you use real Python (PEP435-style) enums with Django.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-django-enumfields/Config.in         |  6 ++++++
 .../python-django-enumfields.hash                  |  5 +++++
 .../python-django-enumfields.mk                    | 14 ++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-django-enumfields/Config.in
 create mode 100644 package/python-django-enumfields/python-django-enumfields.hash
 create mode 100644 package/python-django-enumfields/python-django-enumfields.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8a83f748d1..84d5af81da 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -57,6 +57,7 @@ F:	package/openjdk-bin/
 F:	package/php/
 F:	package/policycoreutils/
 F:	package/python3/
+F:	package/python-django-enumfields/
 F:	package/python-flask-sqlalchemy/
 F:	package/python-mutagen/
 F:	package/python-pip/
diff --git a/package/Config.in b/package/Config.in
index f84effff01..dc003977e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -877,6 +877,7 @@ menu "External python modules"
 	source "package/python-dialog3/Config.in"
 	source "package/python-dicttoxml/Config.in"
 	source "package/python-django/Config.in"
+	source "package/python-django-enumfields/Config.in"
 	source "package/python-docker/Config.in"
 	source "package/python-docker-pycreds/Config.in"
 	source "package/python-dockerpty/Config.in"
diff --git a/package/python-django-enumfields/Config.in b/package/python-django-enumfields/Config.in
new file mode 100644
index 0000000000..e7236d130a
--- /dev/null
+++ b/package/python-django-enumfields/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_DJANGO_ENUMFIELDS
+	bool "python-django-enumfields"
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
-- 
2.21.0

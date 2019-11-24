From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 24 Nov 2019 12:11:20 -0800
Subject: [Buildroot] [PATCH 1/1] python-djangorestframework: new package
Message-ID: <20191124201120.1600578-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Django REST framework is a powerful and flexible toolkit for building Web APIs.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-djangorestframework/Config.in       |  9 +++++++++
 .../python-djangorestframework.hash                |  4 ++++
 .../python-djangorestframework.mk                  | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-djangorestframework/Config.in
 create mode 100644 package/python-djangorestframework/python-djangorestframework.hash
 create mode 100644 package/python-djangorestframework/python-djangorestframework.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 98f67fbc96..c25c0ce765 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -60,6 +60,7 @@ F:	package/python-channels/
 F:	package/python-channels-redis/
 F:	package/python-daphne/
 F:	package/python-django-enumfields/
+F:	package/python-djangorestframework/
 F:	package/python-flask-sqlalchemy/
 F:	package/python-mutagen/
 F:	package/python-pip/
diff --git a/package/Config.in b/package/Config.in
index 9210ec0ac8..f5cc76ad59 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -896,6 +896,7 @@ menu "External python modules"
 	source "package/python-dicttoxml/Config.in"
 	source "package/python-django/Config.in"
 	source "package/python-django-enumfields/Config.in"
+	source "package/python-djangorestframework/Config.in"
 	source "package/python-dnspython/Config.in"
 	source "package/python-docker/Config.in"
 	source "package/python-docker-pycreds/Config.in"
diff --git a/package/python-djangorestframework/Config.in b/package/python-djangorestframework/Config.in
new file mode 100644
index 0000000000..7d37623e6f
--- /dev/null
+++ b/package/python-djangorestframework/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_DJANGORESTFRAMEWORK
+	bool "python-djangorestframework"
+	depends on BR2_PACKAGE_PYTHON3 # python-django
+	select BR2_PACKAGE_PYTHON_DJANGO # runtime
+	help
+	  Django REST framework is a powerful and flexible toolkit for
+	  building Web APIs.
+
+	  https://www.django-rest-framework.org/
diff --git a/package/python-djangorestframework/python-djangorestframework.hash b/package/python-djangorestframework/python-djangorestframework.hash
new file mode 100644
index 0000000000..b1bfbb37db
--- /dev/null
+++ b/package/python-djangorestframework/python-djangorestframework.hash
@@ -0,0 +1,4 @@
+# md5, sha256 from https://pypi.org/pypi/djangorestframework/json
+md5  3cb65e9277de7a6f00e63cac2bef6a23  djangorestframework-3.10.3.tar.gz
+sha256  dc81cbf9775c6898a580f6f1f387c4777d12bd87abf0f5406018d32ccae71090  djangorestframework-3.10.3.tar.gz
+sha256  cc12b0b85368972177ebf422089419b9fe3eea5729fecb11105c640f6eeaccd4  LICENSE.md
diff --git a/package/python-djangorestframework/python-djangorestframework.mk b/package/python-djangorestframework/python-djangorestframework.mk
new file mode 100644
index 0000000000..501a76a962
--- /dev/null
+++ b/package/python-djangorestframework/python-djangorestframework.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-djangorestframework
+#
+################################################################################
+
+PYTHON_DJANGORESTFRAMEWORK_VERSION = 3.10.3
+PYTHON_DJANGORESTFRAMEWORK_SOURCE = djangorestframework-$(PYTHON_DJANGORESTFRAMEWORK_VERSION).tar.gz
+PYTHON_DJANGORESTFRAMEWORK_SITE = https://files.pythonhosted.org/packages/78/10/19a102294f405a1e72d24faebe9d7614b69b5f070bdb69dfd3408dce56f0
+PYTHON_DJANGORESTFRAMEWORK_SETUP_TYPE = setuptools
+PYTHON_DJANGORESTFRAMEWORK_LICENSE = Encode-OSS-Ltd
+PYTHON_DJANGORESTFRAMEWORK_LICENSE_FILES = LICENSE.md
+
+$(eval $(python-package))
-- 
2.23.0

From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat,  3 Aug 2019 21:16:28 -0400
Subject: [Buildroot] [PATCH 05/08] package/python-asgiref: new package
In-Reply-To: <20190804011631.86261-1-aduskett@gmail.com>
References: <20190804011631.86261-1-aduskett@gmail.com>
Message-ID: <20190804011631.86261-6-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

ASGI is a standard for Python asynchronous web apps and servers to
communicate with each other, and positioned as an asynchronous
successor to WSGI.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-asgiref/Config.in           | 14 ++++++++++++++
 package/python-asgiref/python-asgiref.hash |  5 +++++
 package/python-asgiref/python-asgiref.mk   | 14 ++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/python-asgiref/Config.in
 create mode 100644 package/python-asgiref/python-asgiref.hash
 create mode 100644 package/python-asgiref/python-asgiref.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0e3e93b15f..6375c9fcd3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -57,6 +57,7 @@ F:	package/openjdk-bin/
 F:	package/php/
 F:	package/policycoreutils/
 F:	package/python3/
+F:	package/python-asgiref/
 F:	package/python-daphne/
 F:	package/python-django-enumfields/
 F:	package/python-flask-sqlalchemy/
diff --git a/package/Config.in b/package/Config.in
index c81067192b..391df0ef61 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -829,6 +829,7 @@ menu "External python modules"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-arrow/Config.in"
+	source "package/python-asgiref/Config.in"
 	source "package/python-asn1crypto/Config.in"
 	source "package/python-async-timeout/Config.in"
 	source "package/python-attrs/Config.in"
diff --git a/package/python-asgiref/Config.in b/package/python-asgiref/Config.in
new file mode 100644
index 0000000000..d0b816c369
--- /dev/null
+++ b/package/python-asgiref/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PYTHON_ASGIREF
+	bool "python-asgiref"
+	help
+	  ASGI is a standard for Python asynchronous web apps and
+	  servers to communicate with each other, and positioned as
+	  an asynchronous successor to WSGI.
+
+	  This package includes ASGI base libraries, such as:
+	    - Sync-to-async and async-to-sync function wrappers,
+	      asgiref.sync
+	    - Server base classes, asgiref.server
+	    - A WSGI-to-ASGI adapter, in asgiref.wsgi
+
+	  http://github.com/django/asgiref/
diff --git a/package/python-asgiref/python-asgiref.hash b/package/python-asgiref/python-asgiref.hash
new file mode 100644
index 0000000000..61ec9ebdec
--- /dev/null
+++ b/package/python-asgiref/python-asgiref.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/asgiref/json
+md5	682697d39175a9681222dd6f304d8e51  asgiref-3.2.0.tar.gz
+sha256	cefcbd64acbfc9f38913566824ef070dd9a50e63f1b4cc5a7f1c44be809d7ff3  asgiref-3.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-asgiref/python-asgiref.mk b/package/python-asgiref/python-asgiref.mk
new file mode 100644
index 0000000000..0ffc16dd90
--- /dev/null
+++ b/package/python-asgiref/python-asgiref.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-asgiref
+#
+################################################################################
+
+PYTHON_ASGIREF_VERSION = 3.2.0
+PYTHON_ASGIREF_SOURCE = asgiref-$(PYTHON_ASGIREF_VERSION).tar.gz
+PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/65/ef/e357b3e3d418f16d8f79b9d0c44d170bc0d88f0840b5755b6bfe25a576ea
+PYTHON_ASGIREF_SETUP_TYPE = setuptools
+PYTHON_ASGIREF_LICENSE = BSD-3-Clause
+PYTHON_ASGIREF_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.21.0

From: Grzegorz Blach <grzegorz@blach.pl>
Date: Thu, 30 Aug 2018 12:18:48 +0200
Subject: [Buildroot] [PATCH 2/2] python-pyjwt: new package
In-Reply-To: <20180830101848.19752-1-grzegorz@blach.pl>
References: <20180830101848.19752-1-grzegorz@blach.pl>
Message-ID: <20180830101848.19752-2-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PyJWT is a Python library which allows you to encode and decode
JSON Web Tokens (JWT). JWT is an open, industry-standard (RFC 7519)
for representing claims securely between two parties.

https://github.com/jpadilla/pyjwt

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-pyjwt/Config.in         |  6 ++++++
 package/python-pyjwt/python-pyjwt.hash |  5 +++++
 package/python-pyjwt/python-pyjwt.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-pyjwt/Config.in
 create mode 100644 package/python-pyjwt/python-pyjwt.hash
 create mode 100644 package/python-pyjwt/python-pyjwt.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index bd8095bd20..62c64edd49 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -879,6 +879,7 @@ F:	package/sofia-sip/
 N:	Grzegorz Blach <grzegorz@blach.pl>
 F:	package/python-falcon/
 F:	package/python-mimeparse/
+F:	package/python-pyjwt/
 
 N:	Guillaume Gardet <guillaume.gardet@oliseo.fr>
 F:	package/c-icap/
diff --git a/package/Config.in b/package/Config.in
index 66f303ec58..6ac322f146 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -919,6 +919,7 @@ menu "External python modules"
 	source "package/python-pygments/Config.in"
 	source "package/python-pyicu/Config.in"
 	source "package/python-pyinotify/Config.in"
+	source "package/python-pyjwt/Config.in"
 	source "package/python-pylibftdi/Config.in"
 	source "package/python-pylru/Config.in"
 	source "package/python-pymodbus/Config.in"
diff --git a/package/python-pyjwt/Config.in b/package/python-pyjwt/Config.in
new file mode 100644
index 0000000000..510875ce2f
--- /dev/null
+++ b/package/python-pyjwt/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYJWT
+	bool "python-pyjwt"
+	help
+	  JSON Web Token implementation in Python.
+
+	  http://github.com/jpadilla/pyjwt
diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
new file mode 100644
index 0000000000..2fa5175c01
--- /dev/null
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyjwt/json
+md5	2731c6b66b67b95d1944f072f5fa35a9  PyJWT-1.6.4.tar.gz
+sha256	4ee413b357d53fd3fb44704577afac88e72e878716116270d722723d65b42176  PyJWT-1.6.4.tar.gz
+# Locally computed sha256 checksums
+sha256	ec82af815b5f9da8685afb300cc5beb7949e1c22b79b6c1c054796cefdf6cac6  LICENSE
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
new file mode 100644
index 0000000000..18b7976b19
--- /dev/null
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyjwt
+#
+################################################################################
+
+PYTHON_PYJWT_VERSION = 1.6.4
+PYTHON_PYJWT_SOURCE = PyJWT-$(PYTHON_PYJWT_VERSION).tar.gz
+PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/00/5e/b358c9bb24421e6155799d995b4aa3aa3307ffc7ecae4ad9d29fd7e07a73
+PYTHON_PYJWT_SETUP_TYPE = setuptools
+PYTHON_PYJWT_LICENSE = MIT
+PYTHON_PYJWT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.17.1

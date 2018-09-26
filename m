From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 26 Sep 2018 18:35:01 +0300
Subject: [Buildroot] [PATCH 19/23] python-passlib: new package
In-Reply-To: <20180926153505.3411-1-asafka7@gmail.com>
References: <20180926153505.3411-1-asafka7@gmail.com>
Message-ID: <20180926153505.3411-20-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

comprehensive password hashing framework supporting over 30
schemes.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-passlib/Config.in           |  7 +++++++
 package/python-passlib/python-passlib.hash |  5 +++++
 package/python-passlib/python-passlib.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-passlib/Config.in
 create mode 100644 package/python-passlib/python-passlib.hash
 create mode 100644 package/python-passlib/python-passlib.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e5cd83af0d..c2f32dd041 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -204,6 +204,7 @@ F:	package/python-engineio/
 F:	package/python-fire/
 F:	package/python-jsonmodels/
 F:	package/python-paramiko/
+F:	package/python-passlib/
 F:	package/python-pyasn1/
 F:	package/python-pyroute2/
 F:	package/python-pytz/
diff --git a/package/Config.in b/package/Config.in
index c04645a30b..f18f32aa08 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -899,6 +899,7 @@ menu "External python modules"
 	source "package/python-paho-mqtt/Config.in"
 	source "package/python-pam/Config.in"
 	source "package/python-paramiko/Config.in"
+	source "package/python-passlib/Config.in"
 	source "package/python-pathlib2/Config.in"
 	source "package/python-pathpy/Config.in"
 	source "package/python-pathtools/Config.in"
diff --git a/package/python-passlib/Config.in b/package/python-passlib/Config.in
new file mode 100644
index 0000000000..23546a18a5
--- /dev/null
+++ b/package/python-passlib/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PASSLIB
+	bool "python-passlib"
+	help
+	  comprehensive password hashing framework supporting over 30
+	  schemes.
+
+	  https://bitbucket.org/ecollins/passlib
diff --git a/package/python-passlib/python-passlib.hash b/package/python-passlib/python-passlib.hash
new file mode 100644
index 0000000000..8e7f790af0
--- /dev/null
+++ b/package/python-passlib/python-passlib.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/passlib/json
+md5	254869dae3fd9f09f0746a3cb29a0b15  passlib-1.7.1.tar.gz
+sha256	3d948f64138c25633613f303bcc471126eae67c04d5e3f6b7b8ce6242f8653e0  passlib-1.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256	ae8cd74bd5be7be586c52def8bcddfe817872cf2e0782b159d37f88bf0ff11fc  LICENSE
diff --git a/package/python-passlib/python-passlib.mk b/package/python-passlib/python-passlib.mk
new file mode 100644
index 0000000000..fe8c302467
--- /dev/null
+++ b/package/python-passlib/python-passlib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-passlib
+#
+################################################################################
+
+PYTHON_PASSLIB_VERSION = 1.7.1
+PYTHON_PASSLIB_SOURCE = passlib-$(PYTHON_PASSLIB_VERSION).tar.gz
+PYTHON_PASSLIB_SITE = https://files.pythonhosted.org/packages/25/4b/6fbfc66aabb3017cd8c3bd97b37f769d7503ead2899bf76e570eb91270de
+PYTHON_PASSLIB_SETUP_TYPE = setuptools
+PYTHON_PASSLIB_LICENSE = BSD
+PYTHON_PASSLIB_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.17.1

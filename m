From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 22 Sep 2018 22:36:28 +0300
Subject: [Buildroot] [PATCH 1/4] python-pycryptodomex: new package
Message-ID: <20180922193631.14369-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cryptographic library for Python

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-pycryptodomex/Config.in             |  6 ++++++
 .../python-pycryptodomex/python-pycryptodomex.hash |  5 +++++
 .../python-pycryptodomex/python-pycryptodomex.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-pycryptodomex/Config.in
 create mode 100644 package/python-pycryptodomex/python-pycryptodomex.hash
 create mode 100644 package/python-pycryptodomex/python-pycryptodomex.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 84129553c5..4c49cc3908 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -205,6 +205,7 @@ F:	package/python-fire/
 F:	package/python-jsonmodels/
 F:	package/python-paramiko/
 F:	package/python-pyasn1/
+F:	package/python-pycryptodomex/
 F:	package/python-pyroute2/
 F:	package/python-pytz/
 F:	package/python-reentry/
diff --git a/package/Config.in b/package/Config.in
index c04645a30b..826182cdb3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -922,6 +922,7 @@ menu "External python modules"
 	source "package/python-pycli/Config.in"
 	source "package/python-pycparser/Config.in"
 	source "package/python-pycrypto/Config.in"
+	source "package/python-pycryptodomex/Config.in"
 	source "package/python-pydal/Config.in"
 	source "package/python-pyelftools/Config.in"
 	source "package/python-pyftpdlib/Config.in"
diff --git a/package/python-pycryptodomex/Config.in b/package/python-pycryptodomex/Config.in
new file mode 100644
index 0000000000..c7127fee59
--- /dev/null
+++ b/package/python-pycryptodomex/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYCRYPTODOMEX
+	bool "python-pycryptodomex"
+	help
+	  Cryptographic library for Python.
+
+	  http://www.pycryptodome.org
diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
new file mode 100644
index 0000000000..3dec1a1442
--- /dev/null
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
+md5	7e1884f55077ed2e48d36565525b1657  pycryptodomex-3.6.6.tar.gz
+sha256	d0d448484e161786922b41e112b5d7cf76ef5f0c725ea5107ef866bb14a38b12  pycryptodomex-3.6.6.tar.gz
+# Locally computed sha256 checksums
+sha256	fc884f6492490d0f227613ee900ff2a27e6879b79ee637c53a4697238bf12970  LICENSE.rst
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
new file mode 100644
index 0000000000..aa1293df6b
--- /dev/null
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pycryptodomex
+#
+################################################################################
+
+PYTHON_PYCRYPTODOMEX_VERSION = 3.6.6
+PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/95/10/f3bd758050da1c08ea30c8b4daf9ff895f306b780f07430fcc9b38722e1b
+PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
+PYTHON_PYCRYPTODOMEX_LICENSE = Apache-2.0
+PYTHON_PYCRYPTODOMEX_LICENSE_FILES = LICENSE.rst
+
+$(eval $(python-package))
-- 
2.17.1

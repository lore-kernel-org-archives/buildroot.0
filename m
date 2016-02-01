From: Mauro Condarelli <mc5686@mclink.it>
Date: Mon,  1 Feb 2016 02:25:36 +0100
Subject: [Buildroot] [PATCH 7/7] Further dependencies installed.
In-Reply-To: <1454289936-10654-1-git-send-email-mc5686@mclink.it>
References: <1454289936-10654-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454289936-10654-8-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in                                        |  4 ++++
 package/libsodium/libsodium.hash                         |  2 ++
 package/python-cbor/Config.in                            |  8 ++++++++
 package/python-cbor/python-cbor.hash                     |  3 +++
 package/python-cbor/python-cbor.mk                       | 15 +++++++++++++++
 package/python-crossbar/Config.in                        |  2 +-
 package/python-crossbar/python-crossbar.mk               |  2 +-
 package/python-lmdb/Config.in                            |  8 ++++++++
 package/python-lmdb/python-lmdb.hash                     |  3 +++
 package/python-lmdb/python-lmdb.mk                       | 15 +++++++++++++++
 package/python-msgpack-python/Config.in                  |  8 ++++++++
 package/python-msgpack-python/python-msgpack-python.hash |  3 +++
 package/python-msgpack-python/python-msgpack-python.mk   | 15 +++++++++++++++
 package/python-pynacl/Config.in                          |  9 +++++++++
 package/python-pynacl/python-pynacl.hash                 |  3 +++
 package/python-pynacl/python-pynacl.mk                   | 16 ++++++++++++++++
 16 files changed, 114 insertions(+), 2 deletions(-)
 create mode 100644 package/python-cbor/Config.in
 create mode 100644 package/python-cbor/python-cbor.hash
 create mode 100644 package/python-cbor/python-cbor.mk
 create mode 100644 package/python-lmdb/Config.in
 create mode 100644 package/python-lmdb/python-lmdb.hash
 create mode 100644 package/python-lmdb/python-lmdb.mk
 create mode 100644 package/python-msgpack-python/Config.in
 create mode 100644 package/python-msgpack-python/python-msgpack-python.hash
 create mode 100644 package/python-msgpack-python/python-msgpack-python.mk
 create mode 100644 package/python-pynacl/Config.in
 create mode 100644 package/python-pynacl/python-pynacl.hash
 create mode 100644 package/python-pynacl/python-pynacl.mk

diff --git a/package/Config.in b/package/Config.in
index 812bf8a..ec2dc4f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -622,6 +622,7 @@ menu "External python modules"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bottle/Config.in"
 	source "package/python-can/Config.in"
+	source "package/python-cbor/Config.in"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
 	source "package/python-characteristic/Config.in"
@@ -659,6 +660,7 @@ menu "External python modules"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-keyring/Config.in"
 	source "package/python-libconfig/Config.in"
+	source "package/python-lmdb/Config.in"
 	source "package/python-lxml/Config.in"
 	source "package/python-mad/Config.in"
 	source "package/python-mako/Config.in"
@@ -667,6 +669,7 @@ menu "External python modules"
 	source "package/python-meld3/Config.in"
 	source "package/python-mistune/Config.in"
 	source "package/python-msgpack/Config.in"
+	source "package/python-msgpack-python/Config.in"
 	source "package/python-netaddr/Config.in"
 	source "package/python-netifaces/Config.in"
 	source "package/python-networkmanager/Config.in"
@@ -688,6 +691,7 @@ menu "External python modules"
 	source "package/python-pygame/Config.in"
 	source "package/python-pygments/Config.in"
 	source "package/python-pyinotify/Config.in"
+	source "package/python-pynacl/Config.in"
 	source "package/python-pyopenssl/Config.in"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pypcap/Config.in"
diff --git a/package/libsodium/libsodium.hash b/package/libsodium/libsodium.hash
index 3544237..94a0f88 100644
--- a/package/libsodium/libsodium.hash
+++ b/package/libsodium/libsodium.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
 sha256	940d03ea7d2caa7940e24564bf6d9f66d6edd1df1e0111ff8e3655f3b864fb59	libsodium-1.0.6.tar.gz
+# Locally computed.
+md5	03e8e96cef9d18473aafef7d474a6e88  libsodium-1.0.6.tar.gz
diff --git a/package/python-cbor/Config.in b/package/python-cbor/Config.in
new file mode 100644
index 0000000..0de84e0
--- /dev/null
+++ b/package/python-cbor/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_CBOR
+	bool "python-cbor"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  RFC 7049 - Concise Binary Object Representation.
+
+	  https://pypi.python.org/pypi/cbor
+
diff --git a/package/python-cbor/python-cbor.hash b/package/python-cbor/python-cbor.hash
new file mode 100644
index 0000000..f456271
--- /dev/null
+++ b/package/python-cbor/python-cbor.hash
@@ -0,0 +1,3 @@
+# Locally computed.
+md5	a8b01920c4139de6256735c4cae75c74  cbor-0.1.24.tar.gz
+sha256	d89bad00785de4b673c5ab5a1464577ec5bda656d1b73900c43e855a51a927cb  cbor-0.1.24.tar.gz
diff --git a/package/python-cbor/python-cbor.mk b/package/python-cbor/python-cbor.mk
new file mode 100644
index 0000000..33a9f01
--- /dev/null
+++ b/package/python-cbor/python-cbor.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-cbor
+#
+################################################################################
+
+PYTHON_CBOR_VERSION = 0.1.24
+PYTHON_CBOR_SOURCE = cbor-$(PYTHON_CBOR_VERSION).tar.gz
+PYTHON_CBOR_SITE = http://pypi.python.org/packages/source/c/cbor
+PYTHON_CBOR_LICENSE = Apache
+#PYTHON_CBOR_LICENSE_FILES = LICENSE
+PYTHON_CBOR_SETUP_TYPE = setuptools
+#PYTHON_CBOR_DEPENDENCIES = 
+
+$(eval $(python-package))
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index 0bfde13..04f2f16 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	select BR2_PACKAGE_PYTHON_NETADDR
 	select BR2_PACKAGE_PYTHON_PSUTIL
 	select BR2_PACKAGE_PYTHON_PTRIE
-	select BR2_PACKAGE_PYTHON_PYASN1
+	select BR2_PACKAGE_PYTHON_PYASN
 	select BR2_PACKAGE_PYTHON_PYASN1_MODULES
 	select BR2_PACKAGE_PYTHON_PYGMENTS
 	select BR2_PACKAGE_PYTHON_PYOPENSSL
diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
index 5ee74c4..bd915c4 100644
--- a/package/python-crossbar/python-crossbar.mk
+++ b/package/python-crossbar/python-crossbar.mk
@@ -13,7 +13,7 @@ PYTHON_CROSSBAR_SETUP_TYPE = setuptools
 PYTHON_CROSSBAR_DEPENDENCIES = python-click python-setuptools python-twisted python-autobahn \
 	python-netaddr python-pytrie python-jinja2 python-mistune python-pygments python-pyyaml \
 	python-shutilwhich python-psutil python-lmdb python-msgpack-python python-cbor \
-	python-cryptography python-pyOpenSSL python-pyasn1 python-pyasn1-modules \
+	python-cryptography python-pyopenssl python-pyasn python-pyasn1-modules \
 	python-service-identity python-pynacl python-treq
 
 $(eval $(python-package))
diff --git a/package/python-lmdb/Config.in b/package/python-lmdb/Config.in
new file mode 100644
index 0000000..2cff7ac
--- /dev/null
+++ b/package/python-lmdb/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_LMDB
+	bool "python-lmdb"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Universal Python binding for the LMDB 'Lightning' Database.
+
+	  https://pypi.python.org/pypi/lmdb
+
diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
new file mode 100644
index 0000000..ba4cc96
--- /dev/null
+++ b/package/python-lmdb/python-lmdb.hash
@@ -0,0 +1,3 @@
+# Locally computed.
+md5	001817d754f96865549c85fb5251082f  lmdb-0.88.tar.gz
+sha256	37d97041fb237da5600e14b889af49bd47538d6fde4a69d3a6c9097f787d175a  lmdb-0.88.tar.gz
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
new file mode 100644
index 0000000..7295083
--- /dev/null
+++ b/package/python-lmdb/python-lmdb.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-lmdb
+#
+################################################################################
+
+PYTHON_LMDB_VERSION = 0.88
+PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
+PYTHON_LMDB_SITE = http://pypi.python.org/packages/source/l/lmdb
+PYTHON_LMDB_LICENSE = BSD
+#PYTHON_LMDB_LICENSE_FILES = LICENSE
+PYTHON_LMDB_SETUP_TYPE = setuptools
+#PYTHON_LMDB_DEPENDENCIES = 
+
+$(eval $(python-package))
diff --git a/package/python-msgpack-python/Config.in b/package/python-msgpack-python/Config.in
new file mode 100644
index 0000000..d101cee
--- /dev/null
+++ b/package/python-msgpack-python/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_MSGPACK_PYTHON
+	bool "python-msgpack_python"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  MessagePack (de)serializer.
+
+	  https://pypi.python.org/pypi/msgpack-python
+
diff --git a/package/python-msgpack-python/python-msgpack-python.hash b/package/python-msgpack-python/python-msgpack-python.hash
new file mode 100644
index 0000000..77b8490
--- /dev/null
+++ b/package/python-msgpack-python/python-msgpack-python.hash
@@ -0,0 +1,3 @@
+# Locally computed.
+md5	eb2aad1081534ef3a9f32a0ecd350b9b  msgpack-python-0.4.7.tar.gz
+sha256	5e001229a54180a02dcdd59db23c9978351af55b1290c27bc549e381f43acd6b  msgpack-python-0.4.7.tar.gz
diff --git a/package/python-msgpack-python/python-msgpack-python.mk b/package/python-msgpack-python/python-msgpack-python.mk
new file mode 100644
index 0000000..c05b1c5
--- /dev/null
+++ b/package/python-msgpack-python/python-msgpack-python.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-msgpack-python
+#
+################################################################################
+
+PYTHON_MSGPACK_PYTHON_VERSION = 0.4.7
+PYTHON_MSGPACK_PYTHON_SOURCE = msgpack-python-$(PYTHON_MSGPACK_PYTHON_VERSION).tar.gz
+PYTHON_MSGPACK_PYTHON_SITE = http://pypi.python.org/packages/source/m/msgpack-python
+PYTHON_MSGPACK_PYTHON_LICENSE = Apache
+#PYTHON_MSGPACK_PYTHON_LICENSE_FILES = LICENSE
+PYTHON_MSGPACK_PYTHON_SETUP_TYPE = setuptools
+#PYTHON_MSGPACK_PYTHON_DEPENDENCIES = 
+
+$(eval $(python-package))
diff --git a/package/python-pynacl/Config.in b/package/python-pynacl/Config.in
new file mode 100644
index 0000000..88fcad7
--- /dev/null
+++ b/package/python-pynacl/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYNACL
+	bool "python-pynacl"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_LIBSODIUM
+	help
+	  Python binding to the Networking and Cryptography (NaCl) library.
+
+	  https://pypi.python.org/pypi/PyNaCl
+
diff --git a/package/python-pynacl/python-pynacl.hash b/package/python-pynacl/python-pynacl.hash
new file mode 100644
index 0000000..2c26896
--- /dev/null
+++ b/package/python-pynacl/python-pynacl.hash
@@ -0,0 +1,3 @@
+# Locally computed.
+md5	12fd03d8ce64e0318cb1c69272f17704  PyNaCl-1.0.1.tar.gz
+sha256	d21d7a7358a85fb9b9ddadfbd1176c40fe199334fe2202881255e77f6d3773f4  PyNaCl-1.0.1.tar.gz
diff --git a/package/python-pynacl/python-pynacl.mk b/package/python-pynacl/python-pynacl.mk
new file mode 100644
index 0000000..62b9aa9
--- /dev/null
+++ b/package/python-pynacl/python-pynacl.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-pynacl
+#
+################################################################################
+
+PYTHON_PYNACL_VERSION = 1.0.1
+PYTHON_PYNACL_SOURCE = PyNaCl-$(PYTHON_PYNACL_VERSION).tar.gz
+PYTHON_PYNACL_SITE = http://pypi.python.org/packages/source/P/PyNaCl
+PYTHON_PYNACL_LICENSE = Apache-2.0
+#PYTHON_PYNACL_LICENSE_FILES = LICENSE
+PYTHON_PYNACL_SETUP_TYPE = setuptools
+PYTHON_PYNACL_DEPENDENCIES = libsodium
+PYTHON_PYNACL_ENV = SODIUM_INSTALL=system
+
+$(eval $(python-package))
-- 
2.1.4

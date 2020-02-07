From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@essensium.com>
Date: Fri,  7 Feb 2020 15:16:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-rsa: new package.
Message-ID: <20200207141629.31586-1-raphael.melotte@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python-RSA is a pure-Python RSA implementation.

Signed-off-by: Rapha?l M?lotte <raphael.melotte@essensium.com>
---
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/python-rsa/Config.in       | 10 ++++++++++
 package/python-rsa/python-rsa.hash |  6 ++++++
 package/python-rsa/python-rsa.mk   | 15 +++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/python-rsa/Config.in
 create mode 100644 package/python-rsa/python-rsa.hash
 create mode 100644 package/python-rsa/python-rsa.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d8ea23e0b3..b470e34cc5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2076,6 +2076,9 @@ N:	Rahul Jain <rahul.jain@imgtec.com>
 F:	package/uhttpd/
 F:	package/ustream-ssl/
 
+N:  Rapha?l M?lotte <raphael.melotte@essensium.com>
+F:  package/python-rsa/
+
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/paho-mqtt-cpp/
 
diff --git a/package/Config.in b/package/Config.in
index bad4f9cba6..d190d18874 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1106,6 +1106,7 @@ menu "External python modules"
 	source "package/python-requests-toolbelt/Config.in"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rpi-ws281x/Config.in"
+	source "package/python-rsa/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-scandir/Config.in"
 	source "package/python-scapy/Config.in"
diff --git a/package/python-rsa/Config.in b/package/python-rsa/Config.in
new file mode 100644
index 0000000000..c02601105b
--- /dev/null
+++ b/package/python-rsa/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_RSA
+	bool "python-rsa"
+	select BR2_PACKAGE_PYTHON_PYASN1
+	help
+	  Python-RSA is a pure-Python RSA implementation. It supports
+	  encryption and decryption, signing and verifying signatures,
+	  and key generation according to PKCS\#1 version 1.5. It can be
+	  used as a Python library as well as on the command line.
+
+	  https://stuvel.eu/rsa
diff --git a/package/python-rsa/python-rsa.hash b/package/python-rsa/python-rsa.hash
new file mode 100644
index 0000000000..c93c2243fb
--- /dev/null
+++ b/package/python-rsa/python-rsa.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/rsa/json:
+md5  9f9af433a16868b616fc609215e91ddb  rsa-4.0.tar.gz
+sha256  1a836406405730121ae9823e19c6e806c62bbad73f890574fff50efa4122c487  rsa-4.0.tar.gz
+
+# Locally computed checksums:
+sha256	073f28b7d389c8fe74f607e17c27f81eaa5ace69edc43a884f23f41b41c5c726  LICENSE
diff --git a/package/python-rsa/python-rsa.mk b/package/python-rsa/python-rsa.mk
new file mode 100644
index 0000000000..e847eaffb1
--- /dev/null
+++ b/package/python-rsa/python-rsa.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-rsa
+#
+################################################################################
+
+PYTHON_RSA_VERSION = 4.0
+PYTHON_RSA_SOURCE = rsa-$(PYTHON_RSA_VERSION).tar.gz
+PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/cb/d0/8f99b91432a60ca4b1cd478fd0bdf28c1901c58e3a9f14f4ba3dba86b57f
+PYTHON_RSA_SETUP_TYPE = setuptools
+PYTHON_RSA_LICENSE = APACHE
+PYTHON_RSA_LICENSE_FILES = LICENSE
+PYTHON_RSA_DEPENDENCIES = python-pyasn1
+
+$(eval $(python-package))
-- 
2.23.0

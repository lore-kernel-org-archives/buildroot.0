From: Mauro Condarelli <mc5686@mclink.it>
Date: Mon,  1 Feb 2016 15:05:40 +0100
Subject: [Buildroot] [PATCH 21/22] package/python-crossbar: new package.
In-Reply-To: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454335541-14224-22-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in                            |  1 +
 package/python-crossbar/Config.in            | 35 ++++++++++++++++++++++++++++
 package/python-crossbar/python-crossbar.hash |  9 +++++++
 package/python-crossbar/python-crossbar.mk   | 19 +++++++++++++++
 4 files changed, 64 insertions(+)
 create mode 100644 package/python-crossbar/Config.in
 create mode 100644 package/python-crossbar/python-crossbar.hash
 create mode 100644 package/python-crossbar/python-crossbar.mk

diff --git a/package/Config.in b/package/Config.in
index 6e51c9b..ec2dc4f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -633,6 +633,7 @@ menu "External python modules"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-crc16/Config.in"
+	source "package/python-crossbar/Config.in"
 	source "package/python-cryptography/Config.in"
 	source "package/python-cssselect/Config.in"
 	source "package/python-daemon/Config.in"
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
new file mode 100644
index 0000000..04f2f16
--- /dev/null
+++ b/package/python-crossbar/Config.in
@@ -0,0 +1,35 @@
+config BR2_PACKAGE_PYTHON_CROSSBAR
+	bool "python-crossbar"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_AUTOBAHN
+	select BR2_PACKAGE_PYTHON_CBOR
+	select BR2_PACKAGE_PYTHON_CLICK
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
+	select BR2_PACKAGE_PYTHON_JINJA2
+	select BR2_PACKAGE_PYTHON_LMDB
+	select BR2_PACKAGE_PYTHON_MISTUNE
+	select BR2_PACKAGE_PYTHON_MSGPACK
+	select BR2_PACKAGE_PYTHON_NETADDR
+	select BR2_PACKAGE_PYTHON_PSUTIL
+	select BR2_PACKAGE_PYTHON_PTRIE
+	select BR2_PACKAGE_PYTHON_PYASN
+	select BR2_PACKAGE_PYTHON_PYASN1_MODULES
+	select BR2_PACKAGE_PYTHON_PYGMENTS
+	select BR2_PACKAGE_PYTHON_PYOPENSSL
+	select BR2_PACKAGE_PYTHON_PYNACL
+	select BR2_PACKAGE_PYTHON_PYYAML
+	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	select BR2_PACKAGE_PYTHON_SHURILWHICH
+	select BR2_PACKAGE_PYTHON_TREQ
+	select BR2_PACKAGE_PYTHON_TWISTED
+	help
+	  Crossbar.io is an open-source WAMP application router 
+	  that allows to build advanced applications from loosely-coupled
+	  components that can talk in real-time with each other.
+
+	  https://pypi.python.org/pypi/crossbar
+
+comment "*** Currently Crossbar.io does NOT work without Python sources! ***"
+        depends on BR2_PACKAGE_PYTHON_PYC_ONLY
+
diff --git a/package/python-crossbar/python-crossbar.hash b/package/python-crossbar/python-crossbar.hash
new file mode 100644
index 0000000..b476d9b
--- /dev/null
+++ b/package/python-crossbar/python-crossbar.hash
@@ -0,0 +1,9 @@
+# Locally computed.
+md5	61581d3ce01201a5540bae22721f64e8  crossbar-0.11.2.tar.gz
+sha256	2b59eda29f9095107c66678a0f48726b917936a1e9e1ffb54df9134049891c14  crossbar-0.11.2.tar.gz
+# Locally computed.
+md5	a45f883c3e54ef8929d0c965ef656657  crossbar-v0.11.1.tar.gz
+sha256	3f008a011427bcaee6ae33facecffd04f80c31c04d86b95eaf7f13a68e614248  crossbar-v0.11.1.tar.gz
+# Locally computed.
+md5	1d1f68ee068e4b66a3c04c05fe96b76d  crossbar-v0.11.2.tar.gz
+sha256	95b80777375e659d04dca33c04414c184537bc2c88bd79d294c249340c0d379d  crossbar-v0.11.2.tar.gz
diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
new file mode 100644
index 0000000..bd915c4
--- /dev/null
+++ b/package/python-crossbar/python-crossbar.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# python-crossbar
+#
+################################################################################
+
+PYTHON_CROSSBAR_VERSION = 0.11.2
+PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
+PYTHON_CROSSBAR_SITE = http://pypi.python.org/packages/source/c/crossbar
+PYTHON_CROSSBAR_LICENSE = AGPL2
+PYTHON_CROSSBAR_LICENSE_FILES = LICENSE
+PYTHON_CROSSBAR_SETUP_TYPE = setuptools
+PYTHON_CROSSBAR_DEPENDENCIES = python-click python-setuptools python-twisted python-autobahn \
+	python-netaddr python-pytrie python-jinja2 python-mistune python-pygments python-pyyaml \
+	python-shutilwhich python-psutil python-lmdb python-msgpack-python python-cbor \
+	python-cryptography python-pyopenssl python-pyasn python-pyasn1-modules \
+	python-service-identity python-pynacl python-treq
+
+$(eval $(python-package))
-- 
2.1.4

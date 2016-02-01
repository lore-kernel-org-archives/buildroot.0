From: Mauro Condarelli <mc5686@mclink.it>
Date: Mon,  1 Feb 2016 02:25:35 +0100
Subject: [Buildroot] [PATCH 6/7] Dependencies added to package
	python-crossbar.
In-Reply-To: <1454289936-10654-1-git-send-email-mc5686@mclink.it>
References: <1454289936-10654-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454289936-10654-7-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/python-crossbar/Config.in          | 25 +++++++++++++++++++++++++
 package/python-crossbar/python-crossbar.mk |  6 +++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index b8fae30..0bfde13 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -1,6 +1,28 @@
 config BR2_PACKAGE_PYTHON_CROSSBAR
 	bool "python-crossbar"
 	depends on BR2_PACKAGE_PYTHON
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
+	select BR2_PACKAGE_PYTHON_PYASN1
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
 	help
 	  Crossbar.io is an open-source WAMP application router 
 	  that allows to build advanced applications from loosely-coupled
@@ -8,3 +30,6 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 
 	  https://pypi.python.org/pypi/crossbar
 
+comment "*** Currently Crossbar.io does NOT work without Python sources! ***"
+        depends on BR2_PACKAGE_PYTHON_PYC_ONLY
+
diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
index 8a64cda..5ee74c4 100644
--- a/package/python-crossbar/python-crossbar.mk
+++ b/package/python-crossbar/python-crossbar.mk
@@ -10,6 +10,10 @@ PYTHON_CROSSBAR_SITE = http://pypi.python.org/packages/source/c/crossbar
 PYTHON_CROSSBAR_LICENSE = AGPL2
 PYTHON_CROSSBAR_LICENSE_FILES = LICENSE
 PYTHON_CROSSBAR_SETUP_TYPE = setuptools
-#PYTHON_CROSSBAR_DEPENDENCIES = 
+PYTHON_CROSSBAR_DEPENDENCIES = python-click python-setuptools python-twisted python-autobahn \
+	python-netaddr python-pytrie python-jinja2 python-mistune python-pygments python-pyyaml \
+	python-shutilwhich python-psutil python-lmdb python-msgpack-python python-cbor \
+	python-cryptography python-pyOpenSSL python-pyasn1 python-pyasn1-modules \
+	python-service-identity python-pynacl python-treq
 
 $(eval $(python-package))
-- 
2.1.4

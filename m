From: Mauro Condarelli <mc5686@mclink.it>
Date: Fri,  5 Feb 2016 19:18:45 +0100
Subject: [Buildroot] [PATCH v3 05/17] python-pynacl: new package
In-Reply-To: <1454696337-9692-1-git-send-email-mc5686@mclink.it>
References: <1454696337-9692-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454696337-9692-6-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in                        |  2 ++
 package/python-pynacl/Config.in          |  9 +++++++++
 package/python-pynacl/python-pynacl.hash |  3 +++
 package/python-pynacl/python-pynacl.mk   | 16 ++++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-pynacl/Config.in
 create mode 100644 package/python-pynacl/python-pynacl.hash
 create mode 100644 package/python-pynacl/python-pynacl.mk

diff --git a/package/Config.in b/package/Config.in
index 7b5c747..f46daea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -687,6 +687,8 @@ menu "External python modules"
 	source "package/python-pygame/Config.in"
 	source "package/python-pygments/Config.in"
 	source "package/python-pyinotify/Config.in"
+	source "package/python-pynacl/Config.in"
+	source "package/python-pyopenssl/Config.in"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pyparted/Config.in"
 	source "package/python-pypcap/Config.in"
diff --git a/package/python-pynacl/Config.in b/package/python-pynacl/Config.in
new file mode 100644
index 0000000..5a53648
--- /dev/null
+++ b/package/python-pynacl/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYNACL
+	bool "python-pynacl"
+	select BR2_PACKAGE_LIBSODIUM
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	help
+	  Python binding to the Networking and Cryptography (NaCl) library.
+
+	  https://pypi.python.org/pypi/PyNaCl
diff --git a/package/python-pynacl/python-pynacl.hash b/package/python-pynacl/python-pynacl.hash
new file mode 100644
index 0000000..7035ac7
--- /dev/null
+++ b/package/python-pynacl/python-pynacl.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=12fd03d8ce64e0318cb1c69272f17704, sha256 locally computed.
+md5	12fd03d8ce64e0318cb1c69272f17704  PyNaCl-1.0.1.tar.gz
+sha256	d21d7a7358a85fb9b9ddadfbd1176c40fe199334fe2202881255e77f6d3773f4  PyNaCl-1.0.1.tar.gz
diff --git a/package/python-pynacl/python-pynacl.mk b/package/python-pynacl/python-pynacl.mk
new file mode 100644
index 0000000..e82611e
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
+PYTHON_PYNACL_LICENSE_FILES = LICENSE
+PYTHON_PYNACL_SETUP_TYPE = setuptools
+PYTHON_PYNACL_DEPENDENCIES = libsodium python-six
+PYTHON_PYNACL_ENV = SODIUM_INSTALL=system
+
+$(eval $(python-package))
-- 
2.1.4

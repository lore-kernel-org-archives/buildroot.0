From: Mauro Condarelli <mc5686@mclink.it>
Date: Mon,  1 Feb 2016 15:05:27 +0100
Subject: [Buildroot] [PATCH 08/22] package/python-pycparser: new package.
In-Reply-To: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454335541-14224-9-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in                              |  1 +
 package/python-pycparser/Config.in             |  6 ++++++
 package/python-pycparser/python-pycparser.hash |  4 ++++
 package/python-pycparser/python-pycparser.mk   | 15 +++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-pycparser/Config.in
 create mode 100644 package/python-pycparser/python-pycparser.hash
 create mode 100644 package/python-pycparser/python-pycparser.mk

diff --git a/package/Config.in b/package/Config.in
index 80b4868..4c97954 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -679,6 +679,7 @@ menu "External python modules"
 	source "package/python-psutil/Config.in"
 	source "package/python-pyasn/Config.in"
 	source "package/python-pycli/Config.in"
+	source "package/python-pycparser/Config.in"
 	source "package/python-pycrypto/Config.in"
 	source "package/python-pydal/Config.in"
 	source "package/python-pyftpdlib/Config.in"
diff --git a/package/python-pycparser/Config.in b/package/python-pycparser/Config.in
new file mode 100644
index 0000000..49190c3
--- /dev/null
+++ b/package/python-pycparser/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYCPARSER
+	bool "python-pycparser"
+	help
+	  C parser in Python
+
+	  https://github.com/eliben/pycparser
diff --git a/package/python-pycparser/python-pycparser.hash b/package/python-pycparser/python-pycparser.hash
new file mode 100644
index 0000000..483d3d1
--- /dev/null
+++ b/package/python-pycparser/python-pycparser.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/pycparser/json
+md5	a2bc8d28c923b4fe2b2c3b4b51a4f935  pycparser-2.14.tar.gz
+# sha256 calculated by scanpypi
+sha256	7959b4a74abdc27b312fed1c21e6caf9309ce0b29ea86b591fd2e99ecdf27f73  pycparser-2.14.tar.gz
diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
new file mode 100644
index 0000000..a32f1aa
--- /dev/null
+++ b/package/python-pycparser/python-pycparser.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pycparser
+#
+################################################################################
+
+PYTHON_PYCPARSER_VERSION = 2.14
+PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
+PYTHON_PYCPARSER_SITE = https://pypi.python.org/packages/source/p/pycparser
+PYTHON_PYCPARSER_SETUP_TYPE = setuptools
+PYTHON_PYCPARSER_LICENSE = BSD-3c
+PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.1.4

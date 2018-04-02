From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon,  2 Apr 2018 15:39:23 +0300
Subject: [Buildroot] [PATCH 1/1] python-yieldfrom: new package
Message-ID: <20180402123923.15244-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A backport of the `yield from` semantic from Python 3.x to Python 2.7.
Can be useful for both host and target packages.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-yieldfrom/Config.in             |  7 +++++++
 package/python-yieldfrom/python-yieldfrom.hash |  4 ++++
 package/python-yieldfrom/python-yieldfrom.mk   | 15 +++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-yieldfrom/Config.in
 create mode 100644 package/python-yieldfrom/python-yieldfrom.hash
 create mode 100644 package/python-yieldfrom/python-yieldfrom.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d6eb24a1fe..38e727ecc3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -185,6 +185,7 @@ F:	package/stress/
 
 N:	Asaf Kahlon <asafka7@gmail.com>
 F:	package/python-jsonmodels/
+F:	package/python-yieldfrom/
 
 N:	Ash Charles <ash.charles@savoirfairelinux.com>
 F:	package/pru-software-support/
diff --git a/package/Config.in b/package/Config.in
index 5fef0a2b26..d883909094 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -971,6 +971,7 @@ menu "External python modules"
 	source "package/python-xlutils/Config.in"
 	source "package/python-xlwt/Config.in"
 	source "package/python-xmltodict/Config.in"
+	source "package/python-yieldfrom/Config.in"
 	source "package/python-zope-interface/Config.in"
 endmenu
 endif
diff --git a/package/python-yieldfrom/Config.in b/package/python-yieldfrom/Config.in
new file mode 100644
index 0000000000..6726e2fdb5
--- /dev/null
+++ b/package/python-yieldfrom/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_YIELDFROM
+	bool "python-yieldfrom"
+	help
+	  A backport of the `yield from` semantic from Python 3.x to
+	  Python 2.7.
+
+	  https://github.com/Nurdok/yieldfrom/
diff --git a/package/python-yieldfrom/python-yieldfrom.hash b/package/python-yieldfrom/python-yieldfrom.hash
new file mode 100644
index 0000000000..cee4aaf96b
--- /dev/null
+++ b/package/python-yieldfrom/python-yieldfrom.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/yieldfrom/json, sha256 locally computed
+md5	1a1c6fd152032d49ccd4ac250aad7746  yieldfrom-1.0.3.tar.gz
+sha256	388004d0ee8854c2ed7a2c87e664aad13acd70c9b33d7f3c441182d37357739b  yieldfrom-1.0.3.tar.gz
+sha256	99da56b23b254ccd2ec6f2e82aea731a86d29a916002b3b3bcd801453edab74e  LICENSE
diff --git a/package/python-yieldfrom/python-yieldfrom.mk b/package/python-yieldfrom/python-yieldfrom.mk
new file mode 100644
index 0000000000..2e775b3133
--- /dev/null
+++ b/package/python-yieldfrom/python-yieldfrom.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-yieldfrom
+#
+################################################################################
+
+PYTHON_YIELDFROM_VERSION = 1.0.3
+PYTHON_YIELDFROM_SOURCE = yieldfrom-$(PYTHON_YIELDFROM_VERSION).tar.gz
+PYTHON_YIELDFROM_SITE = https://pypi.python.org/packages/de/2d/05524f368e691846824d962b64f983e3fde9b8c10839e7efbc1b51d42de3
+PYTHON_YIELDFROM_SETUP_TYPE = setuptools
+PYTHON_JSONMODELS_LICENSE = MIT
+PYTHON_JSONMODELS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.14.1

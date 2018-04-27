From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 27 Apr 2018 10:16:14 +0300
Subject: [Buildroot] [PATCH 1/1] python-subprocess32: new package
Message-ID: <20180427071614.24506-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A backport of the Python 3 subprocess module for use on Python 2.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-subprocess32/Config.in              |  8 ++++++++
 .../python-subprocess32/python-subprocess32.hash   |  4 ++++
 package/python-subprocess32/python-subprocess32.mk | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-subprocess32/Config.in
 create mode 100644 package/python-subprocess32/python-subprocess32.hash
 create mode 100644 package/python-subprocess32/python-subprocess32.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 63361b6fb6..64cc5874e7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -190,6 +190,7 @@ F:	package/stress/
 
 N:	Asaf Kahlon <asafka7@gmail.com>
 F:	package/python-jsonmodels/
+F:	package/python-subprocess32/
 F:	package/python-yieldfrom/
 F:	package/zeromq/
 
diff --git a/package/Config.in b/package/Config.in
index ecd9b8f082..4ea8512e4e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -938,6 +938,7 @@ menu "External python modules"
 	source "package/python-sortedcontainers//Config.in"
 	source "package/python-spidev/Config.in"
 	source "package/python-sqlalchemy/Config.in"
+	source "package/python-subprocess32/Config.in"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tempora/Config.in"
diff --git a/package/python-subprocess32/Config.in b/package/python-subprocess32/Config.in
new file mode 100644
index 0000000000..a936b064b0
--- /dev/null
+++ b/package/python-subprocess32/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SUBPROCESS32
+	bool "python-subprocess32"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  A backport of the Python 3 subprocess module for use
+	  on Python 2.
+
+	  https://github.com/google/python-subprocess32
diff --git a/package/python-subprocess32/python-subprocess32.hash b/package/python-subprocess32/python-subprocess32.hash
new file mode 100644
index 0000000000..17a54b0034
--- /dev/null
+++ b/package/python-subprocess32/python-subprocess32.hash
@@ -0,0 +1,4 @@
+# sha256 from https://pypi.org/pypi/subprocess32/json
+sha256	1e450a4a4c53bf197ad6402c564b9f7a53539385918ef8f12bdf430a61036590  subprocess32-3.2.7.tar.gz
+# Locally computed sha256 checksums
+sha256	826b43437249d39422642f695154d064da64de92eb1476048a615f50bc1beb4a  LICENSE
diff --git a/package/python-subprocess32/python-subprocess32.mk b/package/python-subprocess32/python-subprocess32.mk
new file mode 100644
index 0000000000..483bf5333f
--- /dev/null
+++ b/package/python-subprocess32/python-subprocess32.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-subprocess32
+#
+################################################################################
+
+PYTHON_SUBPROCESS32_VERSION = 3.2.7
+PYTHON_SUBPROCESS32_SOURCE = subprocess32-$(PYTHON_SUBPROCESS32_VERSION).tar.gz
+PYTHON_SUBPROCESS32_SITE = https://files.pythonhosted.org/packages/b8/2f/49e53b0d0e94611a2dc624a1ad24d41b6d94d0f1b0a078443407ea2214c2
+PYTHON_SUBPROCESS32_SETUP_TYPE = distutils
+PYTHON_SUBPROCESS32_LICENSE = Python-2.0
+PYTHON_SUBPROCESS32_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.17.0

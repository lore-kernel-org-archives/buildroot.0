From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 16 Jan 2016 17:41:13 +0100
Subject: [Buildroot] [PATCH 1/2] python-ecdsa: new package
Message-ID: <1452962474-28184-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                      |  1 +
 package/python-ecdsa/Config.in         |  6 ++++++
 package/python-ecdsa/python-ecdsa.hash |  4 ++++
 package/python-ecdsa/python-ecdsa.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-ecdsa/Config.in
 create mode 100644 package/python-ecdsa/python-ecdsa.hash
 create mode 100644 package/python-ecdsa/python-ecdsa.mk

diff --git a/package/Config.in b/package/Config.in
index 5d24527..d134df1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -634,6 +634,7 @@ menu "External python modules"
 	source "package/python-django/Config.in"
 	source "package/python-docopt/Config.in"
 	source "package/python-dpkt/Config.in"
+	source "package/python-ecdsa/Config.in"
 	source "package/python-enum/Config.in"
 	source "package/python-enum34/Config.in"
 	source "package/python-flask/Config.in"
diff --git a/package/python-ecdsa/Config.in b/package/python-ecdsa/Config.in
new file mode 100644
index 0000000..ce11910
--- /dev/null
+++ b/package/python-ecdsa/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_ECDSA
+	bool "python-ecdsa"
+	help
+	  ECDSA cryptographic signature library (pure python).
+
+	  http://github.com/warner/python-ecdsa
diff --git a/package/python-ecdsa/python-ecdsa.hash b/package/python-ecdsa/python-ecdsa.hash
new file mode 100644
index 0000000..b4bd706
--- /dev/null
+++ b/package/python-ecdsa/python-ecdsa.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/ecdsa/json
+md5	1f60eda9cb5c46722856db41a3ae6670  ecdsa-0.13.tar.gz
+# sha256 calculated by scanpypi
+sha256	64cf1ee26d1cde3c73c6d7d107f835fed7c6a2904aef9eac223d57ad800c43fa  ecdsa-0.13.tar.gz
diff --git a/package/python-ecdsa/python-ecdsa.mk b/package/python-ecdsa/python-ecdsa.mk
new file mode 100644
index 0000000..75b0634
--- /dev/null
+++ b/package/python-ecdsa/python-ecdsa.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-ecdsa
+#
+################################################################################
+
+PYTHON_ECDSA_VERSION = 0.13
+PYTHON_ECDSA_SOURCE = ecdsa-$(PYTHON_ECDSA_VERSION).tar.gz
+PYTHON_ECDSA_SITE = https://pypi.python.org/packages/source/e/ecdsa
+PYTHON_ECDSA_SETUP_TYPE = setuptools
+PYTHON_ECDSA_LICENSE = MIT
+PYTHON_ECDSA_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.1.4

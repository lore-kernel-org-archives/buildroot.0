From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Sun, 21 Oct 2018 16:00:43 +0800
Subject: [Buildroot] [PATCH 1/1] python-yarl: new package
Message-ID: <1540108843-1854-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Yet another URL library

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                    |  1 +
 package/python-yarl/Config.in        |  9 +++++++++
 package/python-yarl/python-yarl.hash |  5 +++++
 package/python-yarl/python-yarl.mk   | 12 ++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-yarl/Config.in
 create mode 100644 package/python-yarl/python-yarl.hash
 create mode 100644 package/python-yarl/python-yarl.mk

diff --git a/package/Config.in b/package/Config.in
index c1a917c..e100500 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1067,6 +1067,7 @@ menu "External python modules"
 	source "package/python-xlutils/Config.in"
 	source "package/python-xlwt/Config.in"
 	source "package/python-xmltodict/Config.in"
+	source "package/python-yarl/Config.in"
 	source "package/python-yieldfrom/Config.in"
 	source "package/python-zeroconf/Config.in"
 	source "package/python-zope-interface/Config.in"
diff --git a/package/python-yarl/Config.in b/package/python-yarl/Config.in
new file mode 100644
index 0000000..edcce56
--- /dev/null
+++ b/package/python-yarl/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_YARL
+	bool "python-yarl"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_MULTIDICT
+	select BR2_PACKAGE_PYTHON_IDNA
+	help
+	  Yet another URL library
+
+	  http://yarl.readthedocs.io/
diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
new file mode 100644
index 0000000..118c722
--- /dev/null
+++ b/package/python-yarl/python-yarl.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.python.org/pypi/yarl/json
+md5	43380667129ebc52ac3c442daabb3f6d  yarl-1.2.6.tar.gz
+sha256	c8cbc21bbfa1dd7d5386d48cc814fe3d35b80f60299cdde9279046f399c3b0d8  yarl-1.2.6.tar.gz
+# Locally computed sha256 checksums
+sha256	14c0820503ceef15e814a89b037d9efc066870087018294b6ae0f27163872cc5  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
new file mode 100644
index 0000000..b7aedac
--- /dev/null
+++ b/package/python-yarl/python-yarl.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# python-yarl
+#
+################################################################################
+PYTHON_YARL_VERSION = 1.2.6
+PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/43/b8/057c3e5b546ff4b24263164ecda13f6962d85c9dc477fcc0bcdcb3adb658
+PYTHON_YARL_LICENSE = Apache-2.0
+PYTHON_YARL_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.7.4

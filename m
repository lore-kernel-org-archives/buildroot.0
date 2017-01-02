From: David Bachelart <david.bachelart@bbright.com>
Date: Mon,  2 Jan 2017 11:49:21 +0100
Subject: [Buildroot] [PATCH 1/1] python-arrow: new package
In-Reply-To: <1483354166-8331-1-git-send-email-david.bachelart@bbright.com>
References: <1483354166-8331-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <1483354166-8331-4-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
 package/Config.in                      |  1 +
 package/python-arrow/Config.in         |  7 +++++++
 package/python-arrow/python-arrow.hash |  4 ++++
 package/python-arrow/python-arrow.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-arrow/Config.in
 create mode 100644 package/python-arrow/python-arrow.hash
 create mode 100644 package/python-arrow/python-arrow.mk

diff --git a/package/Config.in b/package/Config.in
index 9ed296f..4337872 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -643,6 +643,7 @@ if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "External python modules"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-argh/Config.in"
+	source "package/python-arrow/Config.in"
 	source "package/python-autobahn/Config.in"
 	source "package/python-backports-abc/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
diff --git a/package/python-arrow/Config.in b/package/python-arrow/Config.in
new file mode 100644
index 0000000..1332a72
--- /dev/null
+++ b/package/python-arrow/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_ARROW
+	bool "python-arrow"
+	select BR2_PACKAGE_PYTHON_DATEUTIL
+	help
+	  Better dates & times for Python
+
+	  https://github.com/crsmithdev/arrow/
diff --git a/package/python-arrow/python-arrow.hash b/package/python-arrow/python-arrow.hash
new file mode 100644
index 0000000..6c8a329
--- /dev/null
+++ b/package/python-arrow/python-arrow.hash
@@ -0,0 +1,4 @@
+# Locally computed
+md5 b4ea162996977d572177da47efca5db5    python-arrow-0.10.0.tar.gz
+sha1    5968918ae65808d92126898e6f9400d12cfec0e3    python-arrow-0.10.0.tar.gz
+sha256  4ed4f6c86e9d3e75a1f77af13d6f5a08f6891ab5c815b20f1f7b7c88ffcad118    python-arrow-0.10.0.tar.gz
diff --git a/package/python-arrow/python-arrow.mk b/package/python-arrow/python-arrow.mk
new file mode 100644
index 0000000..d37ab61
--- /dev/null
+++ b/package/python-arrow/python-arrow.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-arrow
+#
+################################################################################
+
+PYTHON_ARROW_VERSION = 0.10.0
+PYTHON_ARROW_SITE = $(call github,crsmithdev,arrow,$(PYTHON_ARROW_VERSION))
+PYTHON_ARROW_DEPENDENCIES = python-dateutil
+PYTHON_ARROW_SETUP_TYPE = setuptools
+PYTHON_ARROW_LICENSE = Apache-2.0
+PYTHON_ARROW_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.1.4

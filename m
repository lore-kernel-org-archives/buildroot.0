From: Mauro Condarelli <mc5686@mclink.it>
Date: Mon,  1 Feb 2016 15:05:39 +0100
Subject: [Buildroot] [PATCH 20/22] package/python-autobahn: new package.
In-Reply-To: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454335541-14224-21-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in                            |  1 +
 package/python-autobahn/Config.in            |  8 ++++++++
 package/python-autobahn/python-autobahn.hash |  3 +++
 package/python-autobahn/python-autobahn.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-autobahn/Config.in
 create mode 100644 package/python-autobahn/python-autobahn.hash
 create mode 100644 package/python-autobahn/python-autobahn.mk

diff --git a/package/Config.in b/package/Config.in
index 1cdcbb0..6e51c9b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -617,6 +617,7 @@ endif
 if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "External python modules"
 	source "package/python-alsaaudio/Config.in"
+	source "package/python-autobahn/Config.in"
 	source "package/python-backports-abc/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bottle/Config.in"
diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
new file mode 100644
index 0000000..79df0bd
--- /dev/null
+++ b/package/python-autobahn/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_AUTOBAHN
+	bool "python-autobahn"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  WebSocket client Hhh server library, WAMP real-time framework.
+
+	  https://pypi.python.org/pypi/autobahn
+
diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
new file mode 100644
index 0000000..6d28770
--- /dev/null
+++ b/package/python-autobahn/python-autobahn.hash
@@ -0,0 +1,3 @@
+# Locally computed.
+md5	13b2d91917b1e272359ed323236565c1  autobahn-0.11.0.tar.gz
+sha256	e7aea216e2a3bb41a4fec235399ece8bfbc0be4ef9567e1ed6927db7fa35f851  autobahn-0.11.0.tar.gz
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
new file mode 100644
index 0000000..19eb35c
--- /dev/null
+++ b/package/python-autobahn/python-autobahn.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-autobahn
+#
+################################################################################
+
+PYTHON_AUTOBAHN_VERSION = 0.11.0
+PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
+PYTHON_AUTOBAHN_SITE = http://pypi.python.org/packages/source/a/autobahn
+PYTHON_AUTOBAHN_LICENSE = MIT
+PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
+PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
+#PYTHON_AUTOBAHN_DEPENDENCIES = 
+
+$(eval $(python-package))
-- 
2.1.4

From: Mauro Condarelli <mc5686@mclink.it>
Date: Tue,  2 Feb 2016 01:44:58 +0100
Subject: [Buildroot] [PATCH 18/19] python-autobahn: new package
In-Reply-To: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
References: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454373899-22481-19-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in                            |  1 +
 package/python-autobahn/Config.in            |  9 +++++++++
 package/python-autobahn/python-autobahn.hash |  3 +++
 package/python-autobahn/python-autobahn.mk   | 15 +++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-autobahn/Config.in
 create mode 100644 package/python-autobahn/python-autobahn.hash
 create mode 100644 package/python-autobahn/python-autobahn.mk

diff --git a/package/Config.in b/package/Config.in
index 807cffb..9e0f7ca 100644
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
index 0000000..b7a722a
--- /dev/null
+++ b/package/python-autobahn/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_AUTOBAHN
+	bool "python-autobahn"
+	select BR2_PACKAGE_PYTHON_SIX
+	select BR2_PACKAGE_PYTHON_TXAIO
+	help
+	  WebSocket client Hhh server library, WAMP real-time framework.
+
+	  https://pypi.python.org/pypi/autobahn
+
diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
new file mode 100644
index 0000000..8f55ac1
--- /dev/null
+++ b/package/python-autobahn/python-autobahn.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b4b5445050749c1033b9b58f694f0c64, sha256 locally computed.
+md5	b4b5445050749c1033b9b58f694f0c64  autobahn-0.12.1.tar.gz
+sha256	664223879e159c88221f42d8d1ac6b8c4268d8b9316d8ab69a02761c5744cd79  autobahn-0.12.1.tar.gz
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
new file mode 100644
index 0000000..0ab740a
--- /dev/null
+++ b/package/python-autobahn/python-autobahn.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-autobahn
+#
+################################################################################
+
+PYTHON_AUTOBAHN_VERSION = 0.12.1
+PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
+PYTHON_AUTOBAHN_SITE = http://pypi.python.org/packages/source/a/autobahn
+PYTHON_AUTOBAHN_LICENSE = MIT
+PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
+PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
+PYTHON_AUTOBAHN_DEPENDENCIES = python-six python-txaio
+
+$(eval $(python-package))
-- 
2.1.4

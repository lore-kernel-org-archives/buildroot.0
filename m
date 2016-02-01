From: Mauro Condarelli <mc5686@mclink.it>
Date: Mon,  1 Feb 2016 15:05:28 +0100
Subject: [Buildroot] [PATCH 09/22] package/python-pygments: new package.
In-Reply-To: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454335541-14224-10-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in                            |  1 +
 package/python-pygments/Config.in            |  8 ++++++++
 package/python-pygments/python-pygments.hash |  3 +++
 package/python-pygments/python-pygments.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-pygments/Config.in
 create mode 100644 package/python-pygments/python-pygments.hash
 create mode 100644 package/python-pygments/python-pygments.mk

diff --git a/package/Config.in b/package/Config.in
index 4c97954..d83095e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -684,6 +684,7 @@ menu "External python modules"
 	source "package/python-pydal/Config.in"
 	source "package/python-pyftpdlib/Config.in"
 	source "package/python-pygame/Config.in"
+	source "package/python-pygments/Config.in"
 	source "package/python-pyinotify/Config.in"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pypcap/Config.in"
diff --git a/package/python-pygments/Config.in b/package/python-pygments/Config.in
new file mode 100644
index 0000000..c0d0769
--- /dev/null
+++ b/package/python-pygments/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYGMENTS
+	bool "python-pygments"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Pygments is a syntax highlighting package written in Python.
+
+	  https://pypi.python.org/pypi/Pygments
+
diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
new file mode 100644
index 0000000..1ed8f5f
--- /dev/null
+++ b/package/python-pygments/python-pygments.hash
@@ -0,0 +1,3 @@
+# Locally computed.
+md5	84533d22f72de894f6d3907c3ca9eddf  Pygments-2.1.tar.gz
+sha256	13a0ef5fafd7b16cf995bc28fe7aab0780dab1b2fda0fc89e033709af8b8a47b  Pygments-2.1.tar.gz
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
new file mode 100644
index 0000000..99a8622
--- /dev/null
+++ b/package/python-pygments/python-pygments.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pygments
+#
+################################################################################
+
+PYTHON_PYGMENTS_VERSION = 2.1
+PYTHON_PYGMENTS_SOURCE = Pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
+PYTHON_PYGMENTS_SITE = http://pypi.python.org/packages/source/P/Pygments
+PYTHON_PYGMENTS_LICENSE = BSD
+#PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
+PYTHON_PYGMENTS_SETUP_TYPE = setuptools
+#PYTHON_PYGMENTS_DEPENDENCIES = 
+
+$(eval $(python-package))
-- 
2.1.4

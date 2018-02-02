From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri,  2 Feb 2018 21:38:38 +0100
Subject: [Buildroot] [PATCH] python-remi: new package
Message-ID: <20180202203838.12797-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Remi is a GUI library for Python applications which transpiles an
application's interface into HTML to be rendered in a web browser.
This removes platform-specific dependencies and lets you easily
develop cross-platform applications in Python!

https://github.com/dddomodossola/remi/tree/master

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/python-remi/Config.in        |  9 +++++++++
 package/python-remi/python-remi.hash |  2 ++
 package/python-remi/python-remi.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-remi/Config.in
 create mode 100644 package/python-remi/python-remi.hash
 create mode 100644 package/python-remi/python-remi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9048d45b16..1083782422 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -753,6 +753,7 @@ F:	package/libusbgx/
 F:	package/python-cheetah/
 F:	package/python-markdown/
 F:	package/python-pyqt/
+F:	package/python-remi/
 F:	package/python-sip/
 
 N:	Henrique Camargo <henrique@henriquecamargo.com>
diff --git a/package/Config.in b/package/Config.in
index 9a6b199f40..3ce86fcadf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -888,6 +888,7 @@ menu "External python modules"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-raven/Config.in"
+	source "package/python-remi/Config.in"
 	source "package/python-requests/Config.in"
 	source "package/python-requests-oauthlib/Config.in"
 	source "package/python-requests-toolbelt/Config.in"
diff --git a/package/python-remi/Config.in b/package/python-remi/Config.in
new file mode 100644
index 0000000000..68d0a92b11
--- /dev/null
+++ b/package/python-remi/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_REMI
+	bool "python-remi"
+	help
+	  Remi is a GUI library for Python applications which transpiles an
+	  application's interface into HTML to be rendered in a web browser.
+	  This removes platform-specific dependencies and lets you easily
+	  develop cross-platform applications in Python!
+
+	  https://github.com/dddomodossola/remi/tree/master
diff --git a/package/python-remi/python-remi.hash b/package/python-remi/python-remi.hash
new file mode 100644
index 0000000000..1ab8474994
--- /dev/null
+++ b/package/python-remi/python-remi.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 69ab3f7438de76708bfc40396f791b76452f84bb8bca6dafbdaca510c17e9526  python-remi-v1.0.tar.gz
diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
new file mode 100644
index 0000000000..6514118192
--- /dev/null
+++ b/package/python-remi/python-remi.mk
@@ -0,0 +1,14 @@
+################################################################################
+# 
+# python-remi
+#
+################################################################################
+
+PYTHON_REMI_VERSION = v1.0
+PYTHON_REMI_SITE = $(call github,dddomodossola,remi,$(PYTHON_REMI_VERSION))
+PYTHON_REMI_LICENSE = Apache-2.0
+PYTHON_REMI_LICENSE_FILES = LICENSE
+PYTHON_REMI_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
+
-- 
2.13.6

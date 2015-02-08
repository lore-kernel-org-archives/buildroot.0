From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun,  8 Feb 2015 21:56:08 +0100
Subject: [Buildroot] [PATCH] python-ws4py: new package
Message-ID: <1423428968-10953-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                      |  1 +
 package/python-ws4py/Config.in         |  7 +++++++
 package/python-ws4py/python-ws4py.hash |  3 +++
 package/python-ws4py/python-ws4py.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-ws4py/Config.in
 create mode 100644 package/python-ws4py/python-ws4py.hash
 create mode 100644 package/python-ws4py/python-ws4py.mk

diff --git a/package/Config.in b/package/Config.in
index fe3d3d0..d18d422 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -575,6 +575,7 @@ menu "external python modules"
 	source "package/python-versiontools/Config.in"
 	source "package/python-webpy/Config.in"
 	source "package/python-werkzeug/Config.in"
+	source "package/python-ws4py/Config.in"
 	source "package/python-zope-interface/Config.in"
 endmenu
 endif
diff --git a/package/python-ws4py/Config.in b/package/python-ws4py/Config.in
new file mode 100644
index 0000000..f4763a8
--- /dev/null
+++ b/package/python-ws4py/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_WS4PY
+	bool "python-ws4py"
+	help
+	  ws4py is a Python package implementing the WebSocket protocol
+	  as defined in RFC 6455.
+
+	  https://ws4py.readthedocs.org
diff --git a/package/python-ws4py/python-ws4py.hash b/package/python-ws4py/python-ws4py.hash
new file mode 100644
index 0000000..e58e14a
--- /dev/null
+++ b/package/python-ws4py/python-ws4py.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=6b47e33cbd13f5c134b04f2a44a480ad, sha256 locally computed
+md5     6b47e33cbd13f5c134b04f2a44a480ad  ws4py-0.3.4.tar.gz
+sha256  85d5c01bb0d031e151a32fad56094caf54e20c2ddb51cf25b5709421ff92d007  ws4py-0.3.4.tar.gz
diff --git a/package/python-ws4py/python-ws4py.mk b/package/python-ws4py/python-ws4py.mk
new file mode 100644
index 0000000..586ab22
--- /dev/null
+++ b/package/python-ws4py/python-ws4py.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-ws4py
+#
+################################################################################
+
+PYTHON_WS4PY_VERSION = 0.3.4
+PYTHON_WS4PY_SOURCE = ws4py-$(PYTHON_WS4PY_VERSION).tar.gz
+PYTHON_WS4PY_SITE = https://pypi.python.org/packages/source/w/ws4py
+PYTHON_WS4PY_SETUP_TYPE = setuptools
+PYTHON_WS4PY_LICENSE = BSD-3c
+PYTHON_WS4PY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.1.0

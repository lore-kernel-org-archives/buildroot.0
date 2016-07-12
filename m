From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 12 Jul 2016 09:39:02 +0200
Subject: [Buildroot] [PATCH 1/2] python-wcwidth: new package
Message-ID: <1468309143-27576-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                          |  1 +
 package/python-wcwidth/Config.in           |  7 +++++++
 package/python-wcwidth/python-wcwidth.hash |  3 +++
 package/python-wcwidth/python-wcwidth.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-wcwidth/Config.in
 create mode 100644 package/python-wcwidth/python-wcwidth.hash
 create mode 100644 package/python-wcwidth/python-wcwidth.mk

diff --git a/package/Config.in b/package/Config.in
index 1910251..07e7887 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -769,6 +769,7 @@ menu "External python modules"
 	source "package/python-urwid/Config.in"
 	source "package/python-versiontools/Config.in"
 	source "package/python-watchdog/Config.in"
+	source "package/python-wcwidth/Config.in"
 	source "package/python-web2py/Config.in"
 	source "package/python-webpy/Config.in"
 	source "package/python-werkzeug/Config.in"
diff --git a/package/python-wcwidth/Config.in b/package/python-wcwidth/Config.in
new file mode 100644
index 0000000..c5cc022
--- /dev/null
+++ b/package/python-wcwidth/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_WCWIDTH
+	bool "python-wcwidth"
+	help
+	  This library measures number of Terminal column cells of
+	  wide-character codes.
+
+	  https://github.com/jquast/wcwidth
diff --git a/package/python-wcwidth/python-wcwidth.hash b/package/python-wcwidth/python-wcwidth.hash
new file mode 100644
index 0000000..a3ab50f
--- /dev/null
+++ b/package/python-wcwidth/python-wcwidth.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/wcwidth/json, sha256 locally computed
+md5	b3b6a0a08f0c8a34d1de8cf44150a4ad	wcwidth-0.1.7.tar.gz
+sha256	3df37372226d6e63e1b1e1eda15c594bca98a22d33a23832a90998faa96bc65e	wcwidth-0.1.7.tar.gz
diff --git a/package/python-wcwidth/python-wcwidth.mk b/package/python-wcwidth/python-wcwidth.mk
new file mode 100644
index 0000000..2dd392a
--- /dev/null
+++ b/package/python-wcwidth/python-wcwidth.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-wcwidth
+#
+################################################################################
+
+PYTHON_WCWIDTH_VERSION = 0.1.7
+PYTHON_WCWIDTH_SOURCE = wcwidth-$(PYTHON_WCWIDTH_VERSION).tar.gz
+PYTHON_WCWIDTH_SITE = https://pypi.python.org/packages/55/11/e4a2bb08bb450fdbd42cc709dd40de4ed2c472cf0ccb9e64af22279c5495
+PYTHON_WCWIDTH_SETUP_TYPE = setuptools
+PYTHON_WCWIDTH_LICENSE = MIT
+PYTHON_WCWIDTH_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.8.1

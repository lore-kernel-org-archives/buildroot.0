From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  6 May 2016 08:21:26 +0200
Subject: [Buildroot] [PATCH 3/3] python-watchdog: new package
In-Reply-To: <1462515686-26545-1-git-send-email-yegorslists@googlemail.com>
References: <1462515686-26545-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1462515686-26545-3-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                            |  1 +
 package/python-watchdog/Config.in            |  9 +++++++++
 package/python-watchdog/python-watchdog.hash |  4 ++++
 package/python-watchdog/python-watchdog.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-watchdog/Config.in
 create mode 100644 package/python-watchdog/python-watchdog.hash
 create mode 100644 package/python-watchdog/python-watchdog.mk

diff --git a/package/Config.in b/package/Config.in
index f0d8b72..0f7997c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -754,6 +754,7 @@ menu "External python modules"
 	source "package/python-urllib3/Config.in"
 	source "package/python-urwid/Config.in"
 	source "package/python-versiontools/Config.in"
+	source "package/python-watchdog/Config.in"
 	source "package/python-web2py/Config.in"
 	source "package/python-webpy/Config.in"
 	source "package/python-werkzeug/Config.in"
diff --git a/package/python-watchdog/Config.in b/package/python-watchdog/Config.in
new file mode 100644
index 0000000..e529089
--- /dev/null
+++ b/package/python-watchdog/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_WATCHDOG
+	bool "python-watchdog"
+	select BR2_PACKAGE_PYTHON_PYYAML
+	select BR2_PACKAGE_PYTHON_ARGH
+	select BR2_PACKAGE_PYTHON_PATHTOOLS
+	help
+	  Python API and shell utilities to monitor file system events.
+
+	  http://github.com/gorakhargosh/watchdog
diff --git a/package/python-watchdog/python-watchdog.hash b/package/python-watchdog/python-watchdog.hash
new file mode 100644
index 0000000..9da2b37
--- /dev/null
+++ b/package/python-watchdog/python-watchdog.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/watchdog/json
+md5	bb16926bccc98eae2a04535e4512ddf1  watchdog-0.8.3.tar.gz
+# sha256 calculated by scanpypi
+sha256	7e65882adb7746039b6f3876ee174952f8eaaa34491ba34333ddf1fe35de4162  watchdog-0.8.3.tar.gz
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
new file mode 100644
index 0000000..3dd92e3
--- /dev/null
+++ b/package/python-watchdog/python-watchdog.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-watchdog
+#
+################################################################################
+
+PYTHON_WATCHDOG_VERSION = 0.8.3
+PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
+PYTHON_WATCHDOG_SITE = https://pypi.python.org/packages/54/7d/c7c0ad1e32b9f132075967fc353a244eb2b375a3d2f5b0ce612fd96e107e
+PYTHON_WATCHDOG_SETUP_TYPE = setuptools
+PYTHON_WATCHDOG_LICENSE = Apache-2.0
+PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
+
+$(eval $(python-package))
-- 
2.8.1

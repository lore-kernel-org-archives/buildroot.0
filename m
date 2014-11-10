From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 10 Nov 2014 17:50:33 +0100
Subject: [Buildroot] [PATCH] python-webpy: add new package
Message-ID: <1415638233-2987-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                    |  1 +
 package/python-webpy/Config.in       |  8 ++++++++
 package/python-webpy/python-webpy.mk | 13 +++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/python-webpy/Config.in
 create mode 100644 package/python-webpy/python-webpy.mk

diff --git a/package/Config.in b/package/Config.in
index 28cf703..949c7b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -523,6 +523,7 @@ menu "external python modules"
 	source "package/python-tornado/Config.in"
 	source "package/python-urwid/Config.in"
 	source "package/python-versiontools/Config.in"
+	source "package/python-webpy/Config.in"
 endmenu
 endif
 	source "package/ruby/Config.in"
diff --git a/package/python-webpy/Config.in b/package/python-webpy/Config.in
new file mode 100644
index 0000000..af27888
--- /dev/null
+++ b/package/python-webpy/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_WEBPY
+	bool "python-webpy"
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	help
+	  web.py is a web framework for Python that is as simple as it is
+	  powerful.
+
+	  http://webpy.org/
diff --git a/package/python-webpy/python-webpy.mk b/package/python-webpy/python-webpy.mk
new file mode 100644
index 0000000..373cc86
--- /dev/null
+++ b/package/python-webpy/python-webpy.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-webpy
+#
+################################################################################
+
+PYTHON_WEBPY_VERSION = 0.37
+PYTHON_WEBPY_SITE = $(call github,webpy,webpy,webpy-$(PYTHON_WEBPY_VERSION))
+PYTHON_WEBPY_SETUP_TYPE = distutils
+PYTHON_WEBPY_LICENSE = Public Domain
+PYTHON_WEBPY_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
1.8.3.2

From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 14 Jan 2015 21:11:06 +0100
Subject: [Buildroot] [PATCH] python-pyinotify: new package
Message-ID: <1421266266-3299-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                              |  1 +
 package/python-pyinotify/Config.in             |  6 ++++++
 package/python-pyinotify/python-pyinotify.hash |  2 ++
 package/python-pyinotify/python-pyinotify.mk   | 13 +++++++++++++
 4 files changed, 22 insertions(+)
 create mode 100644 package/python-pyinotify/Config.in
 create mode 100644 package/python-pyinotify/python-pyinotify.hash
 create mode 100644 package/python-pyinotify/python-pyinotify.mk

diff --git a/package/Config.in b/package/Config.in
index 7bd31e8..5f6d782 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -534,6 +534,7 @@ menu "external python modules"
 	source "package/python-pycrypto/Config.in"
 	source "package/python-pyftpdlib/Config.in"
 	source "package/python-pygame/Config.in"
+	source "package/python-pyinotify/Config.in"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pypcap/Config.in"
 	source "package/python-pyro/Config.in"
diff --git a/package/python-pyinotify/Config.in b/package/python-pyinotify/Config.in
new file mode 100644
index 0000000..b3e74e1
--- /dev/null
+++ b/package/python-pyinotify/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYINOTIFY
+	bool "python-pyinotify"
+	help
+	  Monitoring filesystems events with inotify on Linux.
+
+	  https://github.com/seb-m/pyinotify
diff --git a/package/python-pyinotify/python-pyinotify.hash b/package/python-pyinotify/python-pyinotify.hash
new file mode 100644
index 0000000..a51718d
--- /dev/null
+++ b/package/python-pyinotify/python-pyinotify.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  d22d94e5f1dfd19ff2f98b9bb9b31a869892652389b8f5c0a27c7de77550b1e4  python-pyinotify-0.9.5.tar.gz
diff --git a/package/python-pyinotify/python-pyinotify.mk b/package/python-pyinotify/python-pyinotify.mk
new file mode 100644
index 0000000..e43dcd0
--- /dev/null
+++ b/package/python-pyinotify/python-pyinotify.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-pyinotify
+#
+################################################################################
+
+PYTHON_PYINOTIFY_VERSION = 0.9.5
+PYTHON_PYINOTIFY_SITE = $(call github,seb-m,pyinotify,$(PYTHON_PYINOTIFY_VERSION))
+PYTHON_PYINOTIFY_SETUP_TYPE = setuptools
+PYTHON_PYINOTIFY_LICENSE = MIT
+PYTHON_PYINOTIFY_LICENSE_FILES = COPYING
+
+$(eval $(python-package))
-- 
2.1.0

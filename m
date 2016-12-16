From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 16 Dec 2016 12:40:03 +0100
Subject: [Buildroot] [PATCH] python-sh: new package
Message-ID: <1481888403-21794-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                |  1 +
 package/python-sh/Config.in      |  7 +++++++
 package/python-sh/python-sh.hash |  3 +++
 package/python-sh/python-sh.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-sh/Config.in
 create mode 100644 package/python-sh/python-sh.hash
 create mode 100644 package/python-sh/python-sh.mk

diff --git a/package/Config.in b/package/Config.in
index f7e8c0a..10ccdd6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -781,6 +781,7 @@ menu "External python modules"
 	source "package/python-service-identity/Config.in"
 	source "package/python-setproctitle/Config.in"
 	source "package/python-setuptools/Config.in"
+	source "package/python-sh/Config.in"
 	source "package/python-shutilwhich/Config.in"
 	source "package/python-simpleaudio/Config.in"
 	source "package/python-simplejson/Config.in"
diff --git a/package/python-sh/Config.in b/package/python-sh/Config.in
new file mode 100644
index 0000000..b55ea4a
--- /dev/null
+++ b/package/python-sh/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SH
+	bool "python-sh"
+	help
+	  Python subprocess replacement that allows you to call any
+	  program as if it were a function.
+
+	  https://github.com/amoffat/sh
diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
new file mode 100644
index 0000000..0445fa6
--- /dev/null
+++ b/package/python-sh/python-sh.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/sh/json, sha256 locally computed
+md5	89d46b1dba32713b7df74b1bc59d74a1  sh-1.12.7.tar.gz
+sha256	5a07373657a1a704a34ea1bf73b2e55c42388c5d449634d6d7c96147f5660086  sh-1.12.7.tar.gz
diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
new file mode 100644
index 0000000..1aa6bb9
--- /dev/null
+++ b/package/python-sh/python-sh.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-sh
+#
+################################################################################
+
+PYTHON_SH_VERSION = 1.12.7
+PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
+PYTHON_SH_SITE = https://pypi.python.org/packages/c2/98/565d9b566b3153607336ae9e91c1c467896f7f786c2d5d8e50fef7d75b08
+PYTHON_SH_SETUP_TYPE = setuptools
+PYTHON_SH_LICENSE = MIT
+PYTHON_SH_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.1.4

From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  3 Dec 2015 12:02:56 +0100
Subject: [Buildroot] [PATCH] python-backports-abc: new package
Message-ID: <1449140576-18883-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

A backport of recent additions to the 'collections.abc' module.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                      |  1 +
 package/python-backports-abc/Config.in                 |  7 +++++++
 package/python-backports-abc/python-backports-abc.hash |  3 +++
 package/python-backports-abc/python-backports-abc.mk   | 13 +++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-backports-abc/Config.in
 create mode 100644 package/python-backports-abc/python-backports-abc.hash
 create mode 100644 package/python-backports-abc/python-backports-abc.mk

diff --git a/package/Config.in b/package/Config.in
index 9b399f9..e6eda4c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -597,6 +597,7 @@ endif
 if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "External python modules"
 	source "package/python-alsaaudio/Config.in"
+	source "package/python-backports-abc/Config.in"
 	source "package/python-bottle/Config.in"
 	source "package/python-can/Config.in"
 	source "package/python-certifi/Config.in"
diff --git a/package/python-backports-abc/Config.in b/package/python-backports-abc/Config.in
new file mode 100644
index 0000000..26d8cfd
--- /dev/null
+++ b/package/python-backports-abc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_BACKPORTS_ABC
+	bool "python-backports-abc"
+	help
+	  A backport of recent additions to the 'collections.abc'
+	  module.
+
+	  https://pypi.python.org/pypi/backports_abc
diff --git a/package/python-backports-abc/python-backports-abc.hash b/package/python-backports-abc/python-backports-abc.hash
new file mode 100644
index 0000000..07e954e
--- /dev/null
+++ b/package/python-backports-abc/python-backports-abc.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=0b65a216ce9dc9c1a7e20a729dd7c05b, sha256 locally computed
+md5     0b65a216ce9dc9c1a7e20a729dd7c05b backports_abc-0.4.tar.gz
+sha256  8b3e4092ba3d541c7a2f9b7d0d9c0275b21c6a01c53a61c731eba6686939d0a5  backports_abc-0.4.tar.gz
diff --git a/package/python-backports-abc/python-backports-abc.mk b/package/python-backports-abc/python-backports-abc.mk
new file mode 100644
index 0000000..1e3a9a6
--- /dev/null
+++ b/package/python-backports-abc/python-backports-abc.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-backports-abc
+#
+################################################################################
+
+PYTHON_BACKPORTS_ABC_VERSION = 0.4
+PYTHON_BACKPORTS_ABC_SOURCE = backports_abc-$(PYTHON_BACKPORTS_ABC_VERSION).tar.gz
+PYTHON_BACKPORTS_ABC_SITE = https://pypi.python.org/packages/source/b/backports_abc
+PYTHON_BACKPORTS_ABC_LICENSE = Python Software Foundation License
+PYTHON_BACKPORTS_ABC_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.1.4

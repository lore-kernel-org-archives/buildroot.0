From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu,  8 Jan 2015 22:28:55 +0100
Subject: [Buildroot] [PATCH] python-pyftpdlib: new package
Message-ID: <1420752535-25196-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                              |  1 +
 package/python-pyftpdlib/Config.in             |  6 ++++++
 package/python-pyftpdlib/python-pyftpdlib.hash |  2 ++
 package/python-pyftpdlib/python-pyftpdlib.mk   | 14 ++++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/python-pyftpdlib/Config.in
 create mode 100644 package/python-pyftpdlib/python-pyftpdlib.hash
 create mode 100644 package/python-pyftpdlib/python-pyftpdlib.mk

diff --git a/package/Config.in b/package/Config.in
index 5ece4a5..4fd7f31 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -530,6 +530,7 @@ menu "external python modules"
 	source "package/python-psutil/Config.in"
 	source "package/python-pyasn/Config.in"
 	source "package/python-pycrypto/Config.in"
+	source "package/python-pyftpdlib/Config.in"
 	source "package/python-pygame/Config.in"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pypcap/Config.in"
diff --git a/package/python-pyftpdlib/Config.in b/package/python-pyftpdlib/Config.in
new file mode 100644
index 0000000..e25c34e
--- /dev/null
+++ b/package/python-pyftpdlib/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYFTPDLIB
+	bool "python-pyftpdlib"
+	help
+	  Extremely fast and scalable Python FTP server library.
+
+	  https://github.com/giampaolo/pyftpdlib
diff --git a/package/python-pyftpdlib/python-pyftpdlib.hash b/package/python-pyftpdlib/python-pyftpdlib.hash
new file mode 100644
index 0000000..e1d2e94
--- /dev/null
+++ b/package/python-pyftpdlib/python-pyftpdlib.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  e2024de33024582ef26e30395225180048b98cab341f3e9f3a55f56397c9a4b5  python-pyftpdlib-1.4.0.tar.gz
diff --git a/package/python-pyftpdlib/python-pyftpdlib.mk b/package/python-pyftpdlib/python-pyftpdlib.mk
new file mode 100644
index 0000000..2e27ae3
--- /dev/null
+++ b/package/python-pyftpdlib/python-pyftpdlib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyftpdlib
+#
+################################################################################
+
+PYTHON_PYFTPDLIB_VERSION = 1.4.0
+PYTHON_PYFTPDLIB_SITE = $(call github,giampaolo,pyftpdlib,release-$(PYTHON_PYFTPDLIB_VERSION))
+PYTHON_PYFTPDLIB_SETUP_TYPE = setuptools
+PYTHON_PYFTPDLIB_LICENSE = MIT
+PYTHON_PYFTPDLIB_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
+
-- 
1.9.1

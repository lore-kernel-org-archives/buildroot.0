From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  3 Dec 2014 09:42:51 +0100
Subject: [Buildroot] [PATCH] package: add python-psutil
Message-ID: <1417596171-10284-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                        |  1 +
 package/python-psutil/Config.in          |  8 ++++++++
 package/python-psutil/python-psutil.hash |  3 +++
 package/python-psutil/python-psutil.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-psutil/Config.in
 create mode 100644 package/python-psutil/python-psutil.hash
 create mode 100644 package/python-psutil/python-psutil.mk

diff --git a/package/Config.in b/package/Config.in
index b8fc7d1..2bc8f31 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -513,6 +513,7 @@ menu "external python modules"
 	source "package/python-numpy/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-protobuf/Config.in"
+	source "package/python-psutil/Config.in"
 	source "package/python-pyasn/Config.in"
 	source "package/python-pycrypto/Config.in"
 	source "package/python-pygame/Config.in"
diff --git a/package/python-psutil/Config.in b/package/python-psutil/Config.in
new file mode 100644
index 0000000..c64eeee
--- /dev/null
+++ b/package/python-psutil/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PSUTIL
+	bool "python-psutil"
+	help
+	  psutil is a cross-platform library for retrieving
+	  information on running processes and system utilization
+	  (CPU, memory, disks, network) in Python.
+
+	  https://pypi.python.org/pypi/psutil
diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
new file mode 100644
index 0000000..7897b15
--- /dev/null
+++ b/package/python-psutil/python-psutil.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=015a013c46bb9bc30b5c344f26dea0d3, sha256 locally computed
+md5	015a013c46bb9bc30b5c344f26dea0d3  psutil-2.1.3.tar.gz
+sha256	b434c75f01715777391f10f456002e33d0ca14633f96fdbd9ff9139b42d9452c  psutil-2.1.3.tar.gz
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
new file mode 100644
index 0000000..870984d
--- /dev/null
+++ b/package/python-psutil/python-psutil.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-psutil
+#
+################################################################################
+
+PYTHON_PSUTIL_VERSION = 2.1.3
+PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
+PYTHON_PSUTIL_SITE = http://pypi.python.org/packages/source/p/psutil
+PYTHON_PSUTIL_SETUP_TYPE = setuptools
+PYTHON_PSUTIL_LICENSE = BSD-3c
+PYTHON_PSUTIL_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.1.3

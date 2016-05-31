From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 21:16:59 +0200
Subject: [Buildroot] [git commit branch/next] python-pathtools: new package
Message-ID: <20160531191831.23064818B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15daa91333650c915884183b4608ece6e50d0e67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                              |  1 +
 package/python-pathtools/Config.in             |  6 ++++++
 package/python-pathtools/python-pathtools.hash |  4 ++++
 package/python-pathtools/python-pathtools.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 3bee6f9..78dc3d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -696,6 +696,7 @@ menu "External python modules"
 	source "package/python-paho-mqtt/Config.in"
 	source "package/python-pam/Config.in"
 	source "package/python-paramiko/Config.in"
+	source "package/python-pathtools/Config.in"
 	source "package/python-pexpect/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-protobuf/Config.in"
diff --git a/package/python-pathtools/Config.in b/package/python-pathtools/Config.in
new file mode 100644
index 0000000..63777bd
--- /dev/null
+++ b/package/python-pathtools/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PATHTOOLS
+	bool "python-pathtools"
+	help
+	  File system general utilities.
+
+	  http://github.com/gorakhargosh/pathtools
diff --git a/package/python-pathtools/python-pathtools.hash b/package/python-pathtools/python-pathtools.hash
new file mode 100644
index 0000000..1fa624d
--- /dev/null
+++ b/package/python-pathtools/python-pathtools.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/pathtools/json
+md5	9a1af5c605768ea5804b03b734ff0f82  pathtools-0.1.2.tar.gz
+# sha256 calculated by scanpypi
+sha256	7c35c5421a39bb82e58018febd90e3b6e5db34c5443aaaf742b3f33d4655f1c0  pathtools-0.1.2.tar.gz
diff --git a/package/python-pathtools/python-pathtools.mk b/package/python-pathtools/python-pathtools.mk
new file mode 100644
index 0000000..2b4a271
--- /dev/null
+++ b/package/python-pathtools/python-pathtools.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pathtools
+#
+################################################################################
+
+PYTHON_PATHTOOLS_VERSION = 0.1.2
+PYTHON_PATHTOOLS_SOURCE = pathtools-$(PYTHON_PATHTOOLS_VERSION).tar.gz
+PYTHON_PATHTOOLS_SITE = https://pypi.python.org/packages/e7/7f/470d6fcdf23f9f3518f6b0b76be9df16dcc8630ad409947f8be2eb0ed13a
+PYTHON_PATHTOOLS_SETUP_TYPE = setuptools
+PYTHON_PATHTOOLS_LICENSE = MIT
+PYTHON_PATHTOOLS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

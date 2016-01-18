From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 21:50:42 +0100
Subject: [Buildroot] [git commit] python-paramiko: new package
Message-ID: <20160118205912.2346B81E87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a492e059f0bc7ab2cb184e68f54996fbc4722f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                            |  1 +
 package/python-paramiko/Config.in            | 10 ++++++++++
 package/python-paramiko/python-paramiko.hash |  4 ++++
 package/python-paramiko/python-paramiko.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d134df1..b04c690 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -666,6 +666,7 @@ menu "External python modules"
 	source "package/python-numpy/Config.in"
 	source "package/python-paho-mqtt/Config.in"
 	source "package/python-pam/Config.in"
+	source "package/python-paramiko/Config.in"
 	source "package/python-posix-ipc/Config.in"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
diff --git a/package/python-paramiko/Config.in b/package/python-paramiko/Config.in
new file mode 100644
index 0000000..4c16a9a
--- /dev/null
+++ b/package/python-paramiko/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_PARAMIKO
+	bool "python-paramiko"
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_PYCRYPTO # runtime
+	select BR2_PACKAGE_PYTHON_ECDSA # runtime
+	help
+	  SSH2 protocol library.
+
+	  https://github.com/paramiko/paramiko/
diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
new file mode 100644
index 0000000..29af27d
--- /dev/null
+++ b/package/python-paramiko/python-paramiko.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/paramiko/json
+md5	7e1203f5ffeb7d2bc2bffc4feb804216  paramiko-1.16.0.tar.gz
+# sha256 calculated by scanpypi
+sha256	3297ebd3cd072f573772f7c7426939a443c62c458d54bb632ff30fd6ecf96892  paramiko-1.16.0.tar.gz
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
new file mode 100644
index 0000000..52822bb
--- /dev/null
+++ b/package/python-paramiko/python-paramiko.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-paramiko
+#
+################################################################################
+
+PYTHON_PARAMIKO_VERSION = 1.16.0
+PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
+PYTHON_PARAMIKO_SITE = https://pypi.python.org/packages/source/p/paramiko
+PYTHON_PARAMIKO_SETUP_TYPE = setuptools
+PYTHON_PARAMIKO_LICENSE = LGPLv2.1+
+PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 19:26:42 +0100
Subject: [Buildroot] [git commit] python-paramiko: bump to version 2.1.1
Message-ID: <20161220183216.E413F81DFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d7b73cf75daedd4a198a75546308fedae7c9467
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace wrong runtime dependencies with python-pyasn and
python-cryptography.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-paramiko/Config.in            | 8 ++++++--
 package/python-paramiko/python-paramiko.hash | 4 ++--
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/python-paramiko/Config.in b/package/python-paramiko/Config.in
index 4c16a9a..aad85cb 100644
--- a/package/python-paramiko/Config.in
+++ b/package/python-paramiko/Config.in
@@ -1,10 +1,14 @@
 config BR2_PACKAGE_PYTHON_PARAMIKO
 	bool "python-paramiko"
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
 	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
-	select BR2_PACKAGE_PYTHON_PYCRYPTO # runtime
-	select BR2_PACKAGE_PYTHON_ECDSA # runtime
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_PYTHON_PYASN # runtime
 	help
 	  SSH2 protocol library.
 
 	  https://github.com/paramiko/paramiko/
+
+comment "python-paramiko needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index f2aedc7..fca8fd7 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/paramiko/json, sha256 locally computed
-md5	6312aee79892801cf5a624eb4f8fd864  paramiko-2.0.2.tar.gz
-sha256	411bf90fa22b078a923ff19ef9772c1115a0953702db93549a2848acefd141dc  paramiko-2.0.2.tar.gz
+md5	9e8abe635baa6bb75a4cd55dcb56a264  paramiko-2.1.1.tar.gz
+sha256	d51dada7ad0736c116f8bfe3263627925947e4a50e61436a83d58bfe7055b575  paramiko-2.1.1.tar.gz
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index e616049..6c0df4d 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 2.0.2
+PYTHON_PARAMIKO_VERSION = 2.1.1
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://pypi.python.org/packages/6b/4e/971b8c917456a2ec9666311f7e695493002a64022397cd668150b5efd2a8
+PYTHON_PARAMIKO_SITE = https://pypi.python.org/packages/d1/5a/ebd00d884f30baf208359a027eb7b38372d81d0c004724bb1aa71ae43b37
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPLv2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Jun 2017 09:41:21 +0200
Subject: [Buildroot] [git commit] python-paramiko: bump to version 2.2.0
Message-ID: <20170613080945.B95EC803DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=773e8b51243aa6896687947a6f635492b57ab9b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new runtime dependencies bcrypt and pynacl.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-paramiko/Config.in            | 2 ++
 package/python-paramiko/python-paramiko.hash | 4 ++--
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-paramiko/Config.in b/package/python-paramiko/Config.in
index aad85cb..7d20d04 100644
--- a/package/python-paramiko/Config.in
+++ b/package/python-paramiko/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_PYTHON_PARAMIKO
 	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_PYASN # runtime
+	select BR2_PACKAGE_PYTHON_PYNACL # runtime
+	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
 	help
 	  SSH2 protocol library.
 
diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index fca8fd7..3b4c779 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/paramiko/json, sha256 locally computed
-md5	9e8abe635baa6bb75a4cd55dcb56a264  paramiko-2.1.1.tar.gz
-sha256	d51dada7ad0736c116f8bfe3263627925947e4a50e61436a83d58bfe7055b575  paramiko-2.1.1.tar.gz
+md5	d44932891b1ce4bfd3e9e9e06c90395d  paramiko-2.2.0.tar.gz
+sha256	24b6cdb42eedb50f3b9d994ab0ca63e74db57555346e97c6e4b8c2ab51cdfd81  paramiko-2.2.0.tar.gz
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 755a7db..0aed667 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 2.1.1
+PYTHON_PARAMIKO_VERSION = 2.2.0
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://pypi.python.org/packages/d1/5a/ebd00d884f30baf208359a027eb7b38372d81d0c004724bb1aa71ae43b37
+PYTHON_PARAMIKO_SITE = https://pypi.python.org/packages/ea/a1/75393511fa6b645d28bd614ba061af99e94a6916c6b4f619f8b6b58bc35e
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE

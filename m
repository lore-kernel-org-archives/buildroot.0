From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 30 Sep 2018 21:29:34 +0300
Subject: [Buildroot] [PATCH 1/1] python-pyroute2: bump to version 0.5.3
Message-ID: <20180930182934.10415-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The python sqlite module is also needed.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pyroute2/Config.in            | 2 ++
 package/python-pyroute2/python-pyroute2.hash | 4 ++--
 package/python-pyroute2/python-pyroute2.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-pyroute2/Config.in b/package/python-pyroute2/Config.in
index 4f13ab2c7b..5df0a63d4b 100644
--- a/package/python-pyroute2/Config.in
+++ b/package/python-pyroute2/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYROUTE2
 	bool "python-pyroute2"
+	select BR2_PACKAGE_PYTHON_SQLITE if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_SQLITE if BR2_PACKAGE_PYTHON3
 	help
 	  Python netlink library - Linux network / netns / wireless /
 	  ipset configuration.
diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index 941157fdb3..9078004d5a 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyroute2/json
-md5    2f6f951e94356ae9d224f417dc6ebed2  pyroute2-0.5.2.tar.gz
-sha256 42bf74495d95a0196a74dd171357f660175aba2bfc23f9b5f63e3830ccbef9ac  pyroute2-0.5.2.tar.gz
+md5    62b24242940b5d73c6ec9c53169b8ef8  pyroute2-0.5.3.tar.gz
+sha256 79f7b4286be773c46914df0201dabaf92717a9c06e341e0c420603b2dd31c6bf  pyroute2-0.5.3.tar.gz
 # Locally computed sha256
 sha256 4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache.v2
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL.v2
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index 204ff33e7f..7937bd2362 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYROUTE2_VERSION = 0.5.2
+PYTHON_PYROUTE2_VERSION = 0.5.3
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
-PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/18/64/33858f79b0f2b44a0af7bb42eda3d477253de5311dae1eb12b966085909f
+PYTHON_PYROUTE2_SITE =  https://files.pythonhosted.org/packages/19/1c/fc2efd9dfa5c1f7f713dbfee621365ad01f7b7ec0a6908e444f08bfd5873
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPL-2.0+
 PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache.v2 LICENSE.GPL.v2 README.license.md
 PYTHON_PYROUTE2_SETUP_TYPE = distutils
-- 
2.17.1

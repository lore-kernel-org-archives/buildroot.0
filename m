From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 21:10:52 +0100
Subject: [Buildroot] [git commit] python-can: bump to version 3.0.0
Message-ID: <20181030201013.42C21835D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b4042073fdea5592a9426993896353d3cfd40ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new dependencies and change download location.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-can/Config.in       | 7 ++++++-
 package/python-can/python-can.hash | 9 +++++----
 package/python-can/python-can.mk   | 6 +++---
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index 94b16ab335..f3ed1b77e3 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_PYTHON_CAN
 	bool "python-can"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_SQLITE if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_SQLITE if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_TYPING if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_WRAPT # runtime
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
 	help
 	  This module provides controller area network support for
 	  Python.
 
-	  https://bitbucket.org/hardbyte/python-can
+	  https://github.com/hardbyte/python-can
diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index 234f138562..b2dc1a33c3 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,4 +1,5 @@
-# sha256 for python-can from https://pypi.org/project/python-can/#files
-# sha256 for LICENSE.txt locally computed
-sha256  b5e93b2ee32bdd597d9d908afe5171c402a04c9678ba47b60f33506738b1375b  python-can-2.2.1.tar.gz
-sha256  ea7d049c7705dc13afc202dd18e1827f3484f8212fd3fa7b82fc4a0c363432c9  LICENSE.txt
+# md5, sha256 from https://pypi.org/pypi/python-can/json
+md5	d906a220d8bd173c4f8de2bfe7217cc2  python-can-3.0.0.tar.gz
+sha256	0d2ddb3b663af51b11a4c7fb7a577c63302a831986239f82bb6af65efc065b07  python-can-3.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index 01a335f5c8..ca023ee895 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 2.2.1
-PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/e6/49/7a25ca6f38421009621b9958a725a0bd57dc0caa656ee508324f26ea5363
+PYTHON_CAN_VERSION = 3.0.0
+PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/29/47/59d07bb02d6b244fb631487ae5424a10658c316defeeb90c923b48043792
+PYTHON_CAN_SETUP_TYPE = setuptools
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
-PYTHON_CAN_SETUP_TYPE = setuptools
 
 $(eval $(python-package))

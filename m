From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 23:48:15 +0200
Subject: [Buildroot] [git commit] python-dateutil: bump to version 2.7.3
Message-ID: <20180930214943.676C38A47E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=296b8bc64a69ae635d4b88b12d7c776c9b3b0df1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update site address in Config.in
Add license hash.
host-python-setuptools-scm is now needed for setup.py

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-dateutil/Config.in            | 2 +-
 package/python-dateutil/python-dateutil.hash | 8 +++++---
 package/python-dateutil/python-dateutil.mk   | 5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/python-dateutil/Config.in b/package/python-dateutil/Config.in
index 56a1d838f7..1a36a150b1 100644
--- a/package/python-dateutil/Config.in
+++ b/package/python-dateutil/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_DATEUTIL
 	help
 	  Extensions to the standard Python datetime module.
 
-	  https://dateutil.readthedocs.org
+	  https://dateutil.readthedocs.io
diff --git a/package/python-dateutil/python-dateutil.hash b/package/python-dateutil/python-dateutil.hash
index adc24bdd16..c55128f507 100644
--- a/package/python-dateutil/python-dateutil.hash
+++ b/package/python-dateutil/python-dateutil.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/python-dateutil/json, sha256 locally computed
-md5	6e38f91e8c94c15a79ce22768dfeca87  python-dateutil-2.6.0.tar.gz
-sha256	62a2f8df3d66f878373fd0072eacf4ee52194ba302e00082828e0d263b0418d2  python-dateutil-2.6.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/python-dateutil/json
+md5	175b7c1a3cc0cb01151eced07c61c0b8  python-dateutil-2.7.3.tar.gz
+sha256	e27001de32f627c22380a688bcc43ce83504a7bc5da472209b4c70f02829f0b8  python-dateutil-2.7.3.tar.gz
+# Locally computed sha256 checksums
+sha256	ba00f51a0d92823b5a1cde27d8b5b9d2321e67ed8da9bc163eff96d5e17e577e  LICENSE
diff --git a/package/python-dateutil/python-dateutil.mk b/package/python-dateutil/python-dateutil.mk
index 41dee2d1cd..73c3c35aaf 100644
--- a/package/python-dateutil/python-dateutil.mk
+++ b/package/python-dateutil/python-dateutil.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_DATEUTIL_VERSION = 2.6.0
-PYTHON_DATEUTIL_SITE = https://pypi.python.org/packages/51/fc/39a3fbde6864942e8bb24c93663734b74e281b984d1b8c4f95d64b0c21f6
+PYTHON_DATEUTIL_VERSION = 2.7.3
+PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/a0/b0/a4e3241d2dee665fea11baec21389aec6886655cd4db7647ddf96c3fad15
 PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_DATEUTIL_LICENSE = BSD-3-Clause
 PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
+PYTHON_DATEUTIL_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))

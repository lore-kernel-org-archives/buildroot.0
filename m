From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 15 Mar 2019 22:07:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-tornado: bump to version
 6.0.1
Message-ID: <20190315210709.2486-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch (not needed since:
https://github.com/tornadoweb/tornado/commit/fa6a7ff6056fc8b139e51294095050f68076f850)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../python-tornado/0001-Disable-SSL-checks.patch   | 45 ----------------------
 package/python-tornado/python-tornado.hash         |  4 +-
 package/python-tornado/python-tornado.mk           |  4 +-
 3 files changed, 4 insertions(+), 49 deletions(-)
 delete mode 100644 package/python-tornado/0001-Disable-SSL-checks.patch

diff --git a/package/python-tornado/0001-Disable-SSL-checks.patch b/package/python-tornado/0001-Disable-SSL-checks.patch
deleted file mode 100644
index 272afd64fe..0000000000
--- a/package/python-tornado/0001-Disable-SSL-checks.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 82a3bbc2ac41b5a1b34a53f97459558efe131f14 Mon Sep 17 00:00:00 2001
-From: Jan Dohl <polygon@wh2.tu-dresden.de>
-Date: Sun, 24 Jun 2018 16:00:54 +0200
-Subject: [PATCH] Disable SSL checks
-
-Checking for SSL support in the Python used on the build system is not
-relevant, as we need SSL support in the Python on the target system.
-
-Signed-off-by: Jan Dohl <polygon@wh2.tu-dresden.de>
----
- setup.py | 11 -----------
- 1 file changed, 11 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 6fbb10a8..1a9220c7 100644
---- a/setup.py
-+++ b/setup.py
-@@ -15,7 +15,6 @@
- 
- import os
- import platform
--import ssl
- import sys
- import warnings
- 
-@@ -137,16 +136,6 @@ if setuptools is not None:
-     python_requires = '>= 2.7, !=3.0.*, !=3.1.*, !=3.2.*, != 3.3.*'
-     kwargs['python_requires'] = python_requires
- 
--# Verify that the SSL module has all the modern upgrades. Check for several
--# names individually since they were introduced at different versions,
--# although they should all be present by Python 3.4 or 2.7.9.
--if (not hasattr(ssl, 'SSLContext') or
--        not hasattr(ssl, 'create_default_context') or
--        not hasattr(ssl, 'match_hostname')):
--    raise ImportError("Tornado requires an up-to-date SSL module. This means "
--                      "Python 2.7.9+ or 3.4+ (although some distributions have "
--                      "backported the necessary changes to older versions).")
--
- setup(
-     name="tornado",
-     version=version,
--- 
-2.14.4
-
diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index fbf5efa60a..18560b17ce 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tornado/json
-md5	a1ce4f392d30ff0ebcb255150d89b826  tornado-5.1.1.tar.gz
-sha256	4e5158d97583502a7e2739951553cbd88a72076f152b4b11b64b9a10c4c49409  tornado-5.1.1.tar.gz
+md5	63a26fdd0bf1154d4a5e9144b7028dd0  tornado-6.0.1.tar.gz
+sha256	de274c65f45f6656c375cdf1759dbf0bc52902a1e999d12a35eb13020a641a53  tornado-6.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 71f536f023..fe65d7516e 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 5.1.1
+PYTHON_TORNADO_VERSION = 6.0.1
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/e6/78/6e7b5af12c12bdf38ca9bfe863fcaf53dc10430a312d0324e76c1e5ca426
+PYTHON_TORNADO_SITE = https://pypi.python.org/packages/b1/7f/8109821ff9df1bf3519169e34646705c32ac13be6a4d51a79ed57f47686e
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_SETUP_TYPE = setuptools
-- 
2.14.1

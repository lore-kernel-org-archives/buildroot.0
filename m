From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Sep 2016 21:46:08 +0200
Subject: [Buildroot] [git commit] python-tornado: bump to version 4.4.1
Message-ID: <20160914195048.DBD7B7FE04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5757aaf36da8a34d7ff2e31a8738a45ec72734af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patch.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...re-backports.ssl_match_hostname-on-Python.patch | 37 ----------------------
 package/python-tornado/python-tornado.hash         |  6 ++--
 package/python-tornado/python-tornado.mk           |  4 +--
 3 files changed, 5 insertions(+), 42 deletions(-)

diff --git a/package/python-tornado/0001-Don-t-require-backports.ssl_match_hostname-on-Python.patch b/package/python-tornado/0001-Don-t-require-backports.ssl_match_hostname-on-Python.patch
deleted file mode 100644
index d5702e8..0000000
--- a/package/python-tornado/0001-Don-t-require-backports.ssl_match_hostname-on-Python.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 785fe675d5602e51a559b06861d543c7d37a380c Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Wed, 4 May 2016 09:26:22 +0200
-Subject: [PATCH] Don't require backports.ssl_match_hostname on Python 2.7.9
- and newer
-
-As Python 3.2 support was dropped one can check 2.7.x dependency only.
-
-Tornado running on Python 2.7.9+ doesn't need this backported package,
-but some Python packages like circus check package dependencies at
-runtime and insist on having backports.ssl_match_hostname installed,
-though they don't even use this particular feature.
-
-So checking for exact version makes life of package maintainer easier
-especially on embedded Linux distributions like Buildroot.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index c13eeed..0c24e70 100644
---- a/setup.py
-+++ b/setup.py
-@@ -129,7 +129,7 @@ if setuptools is not None:
-     if sys.version_info < (2, 7):
-         # Only needed indirectly, for singledispatch.
-         install_requires.append('ordereddict')
--    if sys.version_info < (3, 2):
-+    if sys.version_info < (2, 7, 9):
-         install_requires.append('backports.ssl_match_hostname')
-     if sys.version_info < (3, 4):
-         install_requires.append('singledispatch')
--- 
-2.8.1
-
diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index e0f3c39..27385a5 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=c548d7b77a11d523c3d7255bd7fd6df8, sha256 locally computed
-md5     d13a99dc0b60ba69f5f8ec1235e5b232 tornado-4.3.tar.gz
-sha256  c9c2d32593d16eedf2cec1b6a41893626a2649b40b21ca9c4cac4243bde2efbf  tornado-4.3.tar.gz
+# md5 from https://pypi.python.org/pypi/tornado/json, sha256 locally computed
+md5     fff8a7d7f580b04bacc2ffe7ddf41133 tornado-4.4.1.tar.gz
+sha256  371d0cf3d56c47accc66116a77ad558d76eebaa8458a6b677af71ca606522146  tornado-4.4.1.tar.gz
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 64809b7..98d42b5 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 4.3
+PYTHON_TORNADO_VERSION = 4.4.1
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://pypi.python.org/packages/source/t/tornado
+PYTHON_TORNADO_SITE = https://pypi.python.org/packages/96/5d/ff472313e8f337d5acda5d56e6ea79a43583cc8771b34c85a1f458e197c3
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_SETUP_TYPE = setuptools
 

From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 14 Jul 2017 14:16:31 +0200
Subject: [Buildroot] [PATCH] python-simplejson: bump to version 3.11.1
Message-ID: <20170714121631.14884-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Remove Python2 only dependency as the package is compatible
with Python3.

Add a dot at the end of the help text.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-simplejson/Config.in              | 3 +--
 package/python-simplejson/python-simplejson.hash | 4 ++--
 package/python-simplejson/python-simplejson.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-simplejson/Config.in b/package/python-simplejson/Config.in
index be0ee8f92..c2fd91773 100644
--- a/package/python-simplejson/Config.in
+++ b/package/python-simplejson/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_SIMPLEJSON
 	bool "python-simplejson"
-	depends on BR2_PACKAGE_PYTHON
 	help
-	  Simple, fast, extensible JSON encoder/decoder for Python
+	  Simple, fast, extensible JSON encoder/decoder for Python.
 
 	  https://pypi.python.org/pypi/simplejson/
diff --git a/package/python-simplejson/python-simplejson.hash b/package/python-simplejson/python-simplejson.hash
index 0f7147ca7..f2a5fce38 100644
--- a/package/python-simplejson/python-simplejson.hash
+++ b/package/python-simplejson/python-simplejson.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/simplejson/json, sha256 locally computed
-md5 426a9631d22851a7a970b1a677368b15 simplejson-3.10.0.tar.gz
-sha256 953be622e88323c6f43fad61ffd05bebe73b9fd9863a46d68b052d2aa7d71ce2 simplejson-3.10.0.tar.gz
+md5 6e2f1bd5fb0a926facf5d89d217a7183 simplejson-3.11.1.tar.gz
+sha256 01a22d49ddd9a168b136f26cac87d9a335660ce07aa5c630b8e3607d6f4325e7 simplejson-3.11.1.tar.gz
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index 3bf2dda46..afc77fec6 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEJSON_VERSION = 3.10.0
+PYTHON_SIMPLEJSON_VERSION = 3.11.1
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = https://pypi.python.org/packages/40/ad/52c1f3a562df3b210e8f165e1aa243a178c454ead65476a39fa3ce1847b6
+PYTHON_SIMPLEJSON_SITE = https://pypi.python.org/packages/08/48/c97b668d6da7d7bebe7ea1817a6f76394b0ec959cb04214ca833c34359df
 PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEJSON_SETUP_TYPE = setuptools
-- 
2.11.0

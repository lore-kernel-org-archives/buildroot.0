From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 13 Jan 2020 23:24:30 +0100
Subject: [Buildroot] [PATCH] package/python-pillow: bump to version
 6.2.2/7.0.0
Message-ID: <20200113222430.5157-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps Pillow to version 7.0.0 for Python3 and version
6.2.2 for Python2.
Different versions here are needed cause the latest 7.0.0 only
supports Python3, while support for Python2 is available in 6.2.2.

It updates also the LICENSE hash due to copyright year update.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
I don't really know if this is the correct way to support two versions
of the same package, please let me know.

 package/python-pillow/python-pillow.hash | 10 ++++++----
 package/python-pillow/python-pillow.mk   |  9 +++++++--
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 990b25c46e..24c0cc7c44 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,5 +1,7 @@
-# md5, sha256 from https://pypi.org/pypi/pillow/json
-md5	13acde283ece6ac69f62609fa108d316  Pillow-6.2.1.tar.gz
-sha256	bf4e972a88f8841d8fdc6db1a75e0f8d763e66e3754b03006cbc3854d89f1cb1  Pillow-6.2.1.tar.gz
+# md5, sha256 from https://pypi.org/project/Pillow/
+md5	d099946335c1ba372f5b1fa68ca71645  Pillow-7.0.0.tar.gz
+sha256	4d9ed9a64095e031435af120d3c910148067087541131e82b3e8db302f4c8946  Pillow-7.0.0.tar.gz
+md5	46cad14f0044a5ac4b2d801271528893  Pillow-6.2.2.tar.gz
+sha256	db9ff0c251ed066d367f53b64827cc9e18ccea001b986d08c265e53625dab950  Pillow-6.2.2.tar.gz
 # Locally computed sha256 checksums
-sha256	64ea4328ed56392b423ef968519a9ad427e3de9b985862c95ed2ed4d793d22ee  LICENSE
+sha256	04a04a908e52921829c7f51528e5619c79becdde99c484ab7d4f235e2927968c  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 895b1fcb99..df116164c3 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,9 +4,14 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 6.2.1
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+PYTHON_PILLOW_VERSION = 7.0.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/39/47/f28067b187dd664d205f75b07dcc6e0e95703e134008a14814827eebcaab
+else
+PYTHON_PILLOW_VERSION = 6.2.2
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/b3/d0/a20d8440b71adfbf133452d4f6e0fe80de2df7c2578c9b498fb812083383
+endif
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/5b/bb/cdc8086db1f15d0664dd22a62c69613cdc00f1dd430b5b19df1bea83f2a3
 PYTHON_PILLOW_LICENSE = PIL Software License
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_SETUP_TYPE = setuptools
-- 
2.17.1

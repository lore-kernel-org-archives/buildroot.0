From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 13 Jul 2017 08:58:22 +0200
Subject: [Buildroot] [PATCH] python-zope-interface: bump to version 4.4.2
Message-ID: <20170713065822.28446-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add setuptools as a runtime dependency because zope-interface
uses pkg_resources during initialization.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-zope-interface/Config.in                  | 1 +
 package/python-zope-interface/python-zope-interface.hash | 4 ++--
 package/python-zope-interface/python-zope-interface.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-zope-interface/Config.in b/package/python-zope-interface/Config.in
index 01f4a94cd..c09e7b0cb 100644
--- a/package/python-zope-interface/Config.in
+++ b/package/python-zope-interface/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_ZOPE_INTERFACE
 	bool "python-zope-interface"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	help
 	  This package provides an implementation of "object interfaces" for
 	  Python. Interfaces are a mechanism for labeling objects as conforming
diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index 7a46cd348..5ba2e84df 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/zope-interface/json, sha256 locally computed
-md5	ba3f32eacaea66094b7e2ae2788cec89  zope.interface-4.3.3.tar.gz
-sha256	8780ef68ca8c3fe1abb30c058a59015129d6e04a6b02c2e56b9c7de6078dfa88  zope.interface-4.3.3.tar.gz
+md5	d69131352ef06753388c3da09cd8c8aa  zope.interface-4.4.2.tar.gz
+sha256	4e59e427200201f69ef82956ddf9e527891becf5b7cde8ec3ce39e1d0e262eb0  zope.interface-4.4.2.tar.gz
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index cef86cf27..37e8d3933 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 4.3.3
+PYTHON_ZOPE_INTERFACE_VERSION = 4.4.2
 PYTHON_ZOPE_INTERFACE_SOURCE = zope.interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://pypi.python.org/packages/44/af/cea1e18bc0d3be0e0824762d3236f0e61088eeed75287e7b854d65ec9916
+PYTHON_ZOPE_INTERFACE_SITE = https://pypi.python.org/packages/c5/88/93373971f893714f0dc15e09696ec4886ee8b4e561ce5ae45612c2c516c4
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
-- 
2.11.0

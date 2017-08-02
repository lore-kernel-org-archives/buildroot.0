From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  2 Aug 2017 07:57:26 +0200
Subject: [Buildroot] [PATCH v2 4/4] python-twisted: bump to version 17.5.0
In-Reply-To: <20170802055726.18461-1-yegorslists@googlemail.com>
References: <20170802055726.18461-1-yegorslists@googlemail.com>
Message-ID: <20170802055726.18461-5-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Also fix/add runtime dependencies: Automat and hyperlink modules.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-twisted/Config.in           | 2 ++
 package/python-twisted/python-twisted.hash | 4 ++--
 package/python-twisted/python-twisted.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 7fe4289d4..6b1a4fc2c 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_PYTHON_TWISTED
 	bool "python-twisted"
 	select BR2_PACKAGE_PYTHON_INCREMENTAL
+	select BR2_PACKAGE_PYTHON_AUTOMAT # runtime
 	select BR2_PACKAGE_PYTHON_CONSTANTLY # runtime
+	select BR2_PACKAGE_PYTHON_HYPERLINK # runtime
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
 	help
 	  Twisted is an event-driven networking engine written in Python.
diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index 360e16d54..c22f33643 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/twisted/json, sha256 locally computed
-md5 5b4b9ea5a480bec9c1449ffb57b2052a Twisted-17.1.0.tar.bz2
-sha256 dbf211d70afe5b4442e3933ff01859533eba9f13d8b3e2e1b97dc2125e2d44dc Twisted-17.1.0.tar.bz2
+md5 cd5c287802dcbaf7be15cf937c922b71 Twisted-17.5.0.tar.bz2
+sha256 f198a494f0df2482f7c5f99d7f3eef33d22763ffc76641b36fec476b878002ea Twisted-17.5.0.tar.bz2
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 9b3ced57b..fe276d641 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 17.1.0
+PYTHON_TWISTED_VERSION = 17.5.0
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.bz2
-PYTHON_TWISTED_SITE = https://pypi.python.org/packages/d2/5d/ed5071740be94da625535f4333793d6fd238f9012f0fee189d0c5d00bd74
+PYTHON_TWISTED_SITE = https://pypi.python.org/packages/31/bf/7f86a8f8b9778e90d8b2921e9f442a8c8aa33fd2489fc10f236bc8af1749
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
-- 
2.11.0

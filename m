From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 19 Dec 2016 09:22:36 +0100
Subject: [Buildroot] [PATCH 3/3] python-twisted: bump to version 16.6.0
In-Reply-To: <1482135756-21472-1-git-send-email-yegorslists@googlemail.com>
References: <1482135756-21472-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1482135756-21472-3-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add two new dependencies:

python-contstantly: runtime only
python-incremental: both runtime and build-time dependency

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-twisted/Config.in           | 2 ++
 package/python-twisted/python-twisted.hash | 4 ++--
 package/python-twisted/python-twisted.mk   | 5 +++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 1221fc2..7fe4289 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_TWISTED
 	bool "python-twisted"
+	select BR2_PACKAGE_PYTHON_INCREMENTAL
+	select BR2_PACKAGE_PYTHON_CONSTANTLY # runtime
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
 	help
 	  Twisted is an event-driven networking engine written in Python.
diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index c3a6e95..cc78a4c 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/twisted/json, sha256 locally computed
-md5	c6d09bdd681f538369659111f079c29d  Twisted-16.4.1.tar.bz2
-sha256	1d8d73f006c990744effb35588359fd44d43608649ac0b6b7edc71176e88e816  Twisted-16.4.1.tar.bz2
+md5	54a88ffe773d5a83c91fcfe86044b094  Twisted-16.6.0.tar.bz2
+sha256	d0fe115ea7ef8cf632d05103de60356c6e992b2153d6830bdc4476f8accb1fca  Twisted-16.6.0.tar.bz2
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 7e9e496..29fe735 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 16.4.1
+PYTHON_TWISTED_VERSION = 16.6.0
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.bz2
-PYTHON_TWISTED_SITE = https://pypi.python.org/packages/6b/23/8dbe86fc83215015e221fbd861a545c6ec5c9e9cd7514af114d1f64084ab
+PYTHON_TWISTED_SITE = https://pypi.python.org/packages/dc/c0/a0114a6d7fa211c0904b0de931e8cafb5210ad824996cc6a9d67f3bae22c
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
+PYTHON_TWISTED_DEPENDENCIES = python-incremental
 
 $(eval $(python-package))
-- 
2.1.4

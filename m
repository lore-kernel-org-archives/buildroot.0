From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  9 Jun 2017 09:31:22 +0200
Subject: [Buildroot] [PATCH] python-chardet: bump to version 3.0.4
Message-ID: <20170609073122.23984-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add setuptools runtime dependency, that is needed for
the chardetect script.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-chardet/Config.in           | 1 +
 package/python-chardet/python-chardet.hash | 4 ++--
 package/python-chardet/python-chardet.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-chardet/Config.in b/package/python-chardet/Config.in
index 8f1cd602a..869888cfe 100644
--- a/package/python-chardet/Config.in
+++ b/package/python-chardet/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CHARDET
 	bool "python-chardet"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	help
 	  Universal encoding detector for Python 2 and 3.
 
diff --git a/package/python-chardet/python-chardet.hash b/package/python-chardet/python-chardet.hash
index aa4efeb10..799713cf5 100644
--- a/package/python-chardet/python-chardet.hash
+++ b/package/python-chardet/python-chardet.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/chardet/json, sha256 locally computed
-md5	25274d664ccb5130adae08047416e1a8  chardet-2.3.0.tar.gz
-sha256	e53e38b3a4afe6d1132de62b7400a4ac363452dc5dfcf8d88e8e0cce663c68aa  chardet-2.3.0.tar.gz
+md5	7dd1ba7f9c77e32351b0a0cfacf4055c  chardet-3.0.4.tar.gz
+sha256	84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae  chardet-3.0.4.tar.gz
diff --git a/package/python-chardet/python-chardet.mk b/package/python-chardet/python-chardet.mk
index 0a4788b57..516109894 100644
--- a/package/python-chardet/python-chardet.mk
+++ b/package/python-chardet/python-chardet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARDET_VERSION = 2.3.0
+PYTHON_CHARDET_VERSION = 3.0.4
 PYTHON_CHARDET_SOURCE = chardet-$(PYTHON_CHARDET_VERSION).tar.gz
-PYTHON_CHARDET_SITE = https://pypi.python.org/packages/7d/87/4e3a3f38b2f5c578ce44f8dc2aa053217de9f0b6d737739b0ddac38ed237
+PYTHON_CHARDET_SITE = https://pypi.python.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d
 PYTHON_CHARDET_SETUP_TYPE = setuptools
 PYTHON_CHARDET_LICENSE = LGPL-2.1+
 PYTHON_CHARDET_LICENSE_FILES = LICENSE
-- 
2.11.0

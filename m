From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 14 Sep 2016 12:36:29 +0200
Subject: [Buildroot] [PATCH 2/2] python-pyusb: bump to version 1.0.0
In-Reply-To: <1473849389-1806-1-git-send-email-yegorslists@googlemail.com>
References: <1473849389-1806-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1473849389-1806-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Remove dependency on Python 2 only.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pyusb/Config.in         | 2 --
 package/python-pyusb/python-pyusb.hash | 5 +++--
 package/python-pyusb/python-pyusb.mk   | 5 +++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pyusb/Config.in b/package/python-pyusb/Config.in
index de5b487..1f97979 100644
--- a/package/python-pyusb/Config.in
+++ b/package/python-pyusb/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYUSB
 	bool "python-pyusb"
-	depends on BR2_PACKAGE_PYTHON
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
@@ -10,5 +9,4 @@ config BR2_PACKAGE_PYTHON_PYUSB
 	  http://sourceforge.net/apps/trac/pyusb/
 
 comment "python-pyusb needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-pyusb/python-pyusb.hash b/package/python-pyusb/python-pyusb.hash
index 3524ca9..098d08f 100644
--- a/package/python-pyusb/python-pyusb.hash
+++ b/package/python-pyusb/python-pyusb.hash
@@ -1,2 +1,3 @@
-# locally computed
-sha256  14ec66077bdcd6f1aa9e892a0a35a54bb3c1ec56aa740ead64349c18f0186d19  python-pyusb-1.0.0b2.tar.gz
+# md5 from https://pypi.python.org/pypi/pyusb/json, sha256 locally computed
+md5     c8a571bfdba778555156af3facaea6fc PyUSB-1.0.0.tar.gz
+sha256  5b34ffa74ac34f330bff949c94ee00ec4a9d147234db17ee2eed2a67c0275368  PyUSB-1.0.0.tar.gz
diff --git a/package/python-pyusb/python-pyusb.mk b/package/python-pyusb/python-pyusb.mk
index ae69026..cfdef53 100644
--- a/package/python-pyusb/python-pyusb.mk
+++ b/package/python-pyusb/python-pyusb.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYUSB_VERSION = 1.0.0b2
-PYTHON_PYUSB_SITE = $(call github,walac,pyusb,$(PYTHON_PYUSB_VERSION))
+PYTHON_PYUSB_VERSION = 1.0.0
+PYTHON_PYUSB_SOURCE = PyUSB-$(PYTHON_PYUSB_VERSION).tar.gz
+PYTHON_PYUSB_SITE = https://pypi.python.org/packages/8a/19/66fb48a4905e472f5dfeda3a1bafac369fbf6d6fc5cf55b780864962652d
 PYTHON_PYUSB_LICENSE = BSD-3c
 PYTHON_PYUSB_LICENSE_FILES = LICENSE
 PYTHON_PYUSB_SETUP_TYPE = distutils
-- 
2.1.4

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 15 Mar 2019 16:46:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-nfc: bump to version 0.13.5
Message-ID: <20190315154610.23409-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch site to github
- Add python-nfc.hash
- Add license file and its hash
- Remove patch (not needed anymore)
- Switch to setuptools (instead of distutils)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-nfc/0001-add-setup-py.patch | 26 --------------------------
 package/python-nfc/python-nfc.hash         |  3 +++
 package/python-nfc/python-nfc.mk           |  8 ++++----
 3 files changed, 7 insertions(+), 30 deletions(-)
 delete mode 100644 package/python-nfc/0001-add-setup-py.patch
 create mode 100644 package/python-nfc/python-nfc.hash

diff --git a/package/python-nfc/0001-add-setup-py.patch b/package/python-nfc/0001-add-setup-py.patch
deleted file mode 100644
index 5a5145271b..0000000000
--- a/package/python-nfc/0001-add-setup-py.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Add simple setup.py
-
-Having a setup.py allows to easily get the .py files compiled into
-.pyc, which is good because by default, Buildroot only keeps .pyc
-files on the target.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/setup.py
-===================================================================
---- /dev/null
-+++ b/setup.py
-@@ -0,0 +1,13 @@
-+#!/usr/bin/env python
-+
-+from distutils.core import setup
-+
-+setup(name='NFC',
-+      version='1.0',
-+      description='Python NFC',
-+      author='Stephen Tiedemann',
-+      author_email='stephen.tiedemann at googlemail.com',
-+      url='https://launchpad.net/nfcpy',
-+      packages=['nfc', 'nfc/dev', 'nfc/llcp', 'nfc/ndef',
-+                'nfc/snep'],
-+      )
diff --git a/package/python-nfc/python-nfc.hash b/package/python-nfc/python-nfc.hash
new file mode 100644
index 0000000000..6514973f53
--- /dev/null
+++ b/package/python-nfc/python-nfc.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	7ff9265e393e9e70173ecef5a1f9124e67d3b6e481c2dc3a9537b6a769ebe16f	python-nfc-0.13.5.tar.gz
+sha256	0dc4b0a3362f197e250604567a6b4eb16bbc34c186425401e2201a193a82549f	LICENSE
diff --git a/package/python-nfc/python-nfc.mk b/package/python-nfc/python-nfc.mk
index 574d2e56e2..f5417410c9 100644
--- a/package/python-nfc/python-nfc.mk
+++ b/package/python-nfc/python-nfc.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_NFC_VERSION = 212
-PYTHON_NFC_SITE = https://launchpad.net/nfcpy
-PYTHON_NFC_SITE_METHOD = bzr
+PYTHON_NFC_VERSION = 0.13.5
+PYTHON_NFC_SITE = $(call github,nfcpy,nfcpy,v$(PYTHON_NFC_VERSION))
 PYTHON_NFC_DEPENDENCIES = libusb libusb-compat
-PYTHON_NFC_SETUP_TYPE = distutils
+PYTHON_NFC_SETUP_TYPE = setuptools
 PYTHON_NFC_LICENSE = EUPL-1.1+
+PYTHON_NFC_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.14.1

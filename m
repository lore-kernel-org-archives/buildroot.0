From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu,  8 Jul 2021 17:31:13 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-cbor2: bump to version 5.4.0
Message-ID: <20210708233113.62393-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python 2 is no longer supported.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cbor2/Config.in         | 1 +
 package/python-cbor2/python-cbor2.hash | 4 ++--
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-cbor2/Config.in b/package/python-cbor2/Config.in
index ba9383f787..e35e37f018 100644
--- a/package/python-cbor2/Config.in
+++ b/package/python-cbor2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_CBOR2
 	bool "python-cbor2"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Pure Python CBOR (de)serializer with extensive tag support.
 
diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index 073d071a58..cacaf7b76c 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  0940aa8bfd1a07f06a983bb6dc78f1ca  cbor2-5.2.0.tar.gz
-sha256  a33aa2e5534fd74401ac95686886e655e3b2ce6383b3f958199b6e70a87c94bf  cbor2-5.2.0.tar.gz
+md5  0b4ac06208304fd8251e50d55a7692ca  cbor2-5.4.0.tar.gz
+sha256  a7926f7244b08c413f1a4fa71a81aa256771c75bdf1a4fd77308547a2d63dd48  cbor2-5.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 17639ccf1c..325f20faf7 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.2.0
+PYTHON_CBOR2_VERSION = 5.4.0
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/02/15/f4d7fb47753099fcd9d7f7c81920d422a3ab2e710400ec0f4a1b511b51ae
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/dd/cf/154810bb8698a583fd30faec5a34d84d8a01cc700e34c1e41b90616d7d63
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
-- 
2.25.1

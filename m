From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Sat, 16 Mar 2019 11:12:39 +0800
Subject: [Buildroot] [PATCH 1/1] package/python-pycares: bump to version
 3.0.0
Message-ID: <20190316031239.3805-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

This version drops python 2 support and requires cffi.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycares/Config.in           | 2 ++
 package/python-pycares/python-pycares.hash | 4 ++--
 package/python-pycares/python-pycares.mk   | 5 +++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/python-pycares/Config.in b/package/python-pycares/Config.in
index 4144952d8d..3452ae6b10 100644
--- a/package/python-pycares/Config.in
+++ b/package/python-pycares/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYCARES
 	bool "python-pycares"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  Python interface for c-ares.
 
diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index 2e80a974dc..dfe7ca723d 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5	74893b2b380fbb45329a406ae4b1ae89  pycares-2.3.0.tar.gz
-sha256	36f4c03df57c41a87eb3d642201684eb5a8bc194f4bafaa9f60ee6dc0aef8e40  pycares-2.3.0.tar.gz
+md5	8a53781dd26db01ffe0b3358877bebbd  pycares-3.0.0.tar.gz
+sha256	b253f5dcaa0ac7076b79388a3ac80dd8f3bd979108f813baade40d3a9b8bf0bd  pycares-3.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256	427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index 961c87eaf0..3698ec64f5 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 2.3.0
+PYTHON_PYCARES_VERSION = 3.0.0
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/89/5c/3a7e1a52d6abb52b9ca1a56d2df699936e89d8b98f75cfd60d03363e7c10
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/85/de/cd46a73e43e206a6ad1e9cf9cc893c3ed1b21caf57f1e0a8d9a119d290eb
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
+PYTHON_PYCARES_DEPENDENCIES = host-python-cffi
 
 $(eval $(python-package))
-- 
2.17.1

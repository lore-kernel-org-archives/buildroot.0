From: Grzegorz Blach <grzegorz@blach.pl>
Date: Mon, 11 Jan 2021 19:29:21 +0100
Subject: [Buildroot] [PATCH] package/python-pyjwt: Bump to version 2.0.0
Message-ID: <20210111182923.316881-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python-pyjwt/Config.in         | 1 +
 package/python-pyjwt/python-pyjwt.hash | 6 +++---
 package/python-pyjwt/python-pyjwt.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pyjwt/Config.in b/package/python-pyjwt/Config.in
index 510875ce2f..f8d4f8a9b8 100644
--- a/package/python-pyjwt/Config.in
+++ b/package/python-pyjwt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYJWT
 	bool "python-pyjwt"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  JSON Web Token implementation in Python.
 
diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
index 62ec3559af..10875510f0 100644
--- a/package/python-pyjwt/python-pyjwt.hash
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/PyJWT/json
-md5	a4712f980c008696e13e09504120b2a0  PyJWT-1.7.1.tar.gz
-sha256	8d59a976fb773f3e6a39c85636357c4f0e242707394cadadd9814f5cbaa20e96  PyJWT-1.7.1.tar.gz
+md5  7a1b1c8bfeb67c31ee4fdadefe5ff4b8  PyJWT-2.0.0.tar.gz
+sha256  7a2b271c6dac2fda9e0c33d176c4253faba2c6c6b3a99c7f28a32c3c97522779  PyJWT-2.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256	ec82af815b5f9da8685afb300cc5beb7949e1c22b79b6c1c054796cefdf6cac6  LICENSE
+sha256  ec82af815b5f9da8685afb300cc5beb7949e1c22b79b6c1c054796cefdf6cac6  LICENSE
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index dfc66e5651..9215911389 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYJWT_VERSION = 1.7.1
+PYTHON_PYJWT_VERSION = 2.0.0
 PYTHON_PYJWT_SOURCE = PyJWT-$(PYTHON_PYJWT_VERSION).tar.gz
-PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/2f/38/ff37a24c0243c5f45f5798bd120c0f873eeed073994133c084e1cf13b95c
+PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/14/6d/096dc269d105ba374d6bfd3ecb22b516795ca0572499820dadc8178d9ae1
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE
-- 
2.27.0

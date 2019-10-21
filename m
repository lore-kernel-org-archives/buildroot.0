From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 21 Oct 2019 16:40:26 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-flup: bump to version 1.0.3
In-Reply-To: <20191021134031.20586-1-asafka7@gmail.com>
References: <20191021134031.20586-1-asafka7@gmail.com>
Message-ID: <20191021134031.20586-6-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License isn't shipped with the tarball so we take
PKG-INFO as license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-flup/python-flup.hash | 8 +++++---
 package/python-flup/python-flup.mk   | 7 +++----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-flup/python-flup.hash b/package/python-flup/python-flup.hash
index 86f8d1bfaf..d544d75e9e 100644
--- a/package/python-flup/python-flup.hash
+++ b/package/python-flup/python-flup.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/flup/json, sha256 locally computed
-md5 bc104a7444bfac36fc2146a356de4c11 flup-1.0.3.dev20161029.tar.gz
-sha256 3dc5620b77a6a4cd0afb556626eb0ce85708e513f9c50dc5e982190e3d5f9e26 flup-1.0.3.dev20161029.tar.gz
+# md5, sha256 from https://pypi.org/pypi/flup/json
+md5	a64e7a6374e043480ee92534c735964e  flup-1.0.3.tar.gz
+sha256	5eb09f26eb0751f8380d8ac43d1dfb20e1d42eca0fa45ea9289fa532a79cd159  flup-1.0.3.tar.gz
+# Locally computed sha256 checksums
+sha256	66a60ebc732165d199ec018fb9876d9f8168a5a8575375e64cc1b3d78c32b481  PKG-INFO
diff --git a/package/python-flup/python-flup.mk b/package/python-flup/python-flup.mk
index 26d59385bd..2ea6a1a32e 100644
--- a/package/python-flup/python-flup.mk
+++ b/package/python-flup/python-flup.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-PYTHON_FLUP_VERSION = 1.0.3.dev20161029
+PYTHON_FLUP_VERSION = 1.0.3
 PYTHON_FLUP_SOURCE = flup-$(PYTHON_FLUP_VERSION).tar.gz
-PYTHON_FLUP_SITE = https://pypi.python.org/packages/17/33/36768930a5ffe4f294ed3987c631bfd3fddb4f9e5e46bc8dc30fd731dbcd
-
+PYTHON_FLUP_SITE = https://files.pythonhosted.org/packages/bb/b5/26cc8f7baf0ddebd3e61a354a2bcc692cfe8005123c37ee3d8507c4c7511
 PYTHON_FLUP_LICENSE = BSD-2-Clause, MIT
-
+PYTHON_FLUP_LICENSE_FILES = PKG-INFO
 PYTHON_FLUP_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.20.1

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 22:45:29 +0200
Subject: [Buildroot] [git commit] package/python-html5lib: bump to version
 1.0.1
Message-ID: <20191010204125.2D94F8CA01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=800d3ee0de84fa82f832b18335e31d9df975a249
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Update runtime requirements.
* Add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-html5lib/Config.in            | 2 ++
 package/python-html5lib/python-html5lib.hash | 8 +++++---
 package/python-html5lib/python-html5lib.mk   | 4 ++--
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/python-html5lib/Config.in b/package/python-html5lib/Config.in
index c3e9f2a859..34e22049ad 100644
--- a/package/python-html5lib/Config.in
+++ b/package/python-html5lib/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_HTML5LIB
 	bool "python-html5lib"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_WEBENCODINGS # runtime
 	help
 	  HTML parser based on the WHATWG HTML specification.
 
diff --git a/package/python-html5lib/python-html5lib.hash b/package/python-html5lib/python-html5lib.hash
index 7ea082fa70..04c64c10c1 100644
--- a/package/python-html5lib/python-html5lib.hash
+++ b/package/python-html5lib/python-html5lib.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/html5lib/json, sha256 locally computed
-md5	5ada1243b7a863624b2f35245b2186e9  html5lib-1.0b10.tar.gz
-sha256	0d5fd54d5b2b79b876007a70c033a4023577768d18022c15681c00561432a0f9  html5lib-1.0b10.tar.gz
+# md5, sha256 from https://pypi.org/pypi/html5lib/json
+md5	942a0688d6bdf20d087c9805c40182ad  html5lib-1.0.1.tar.gz
+sha256	66cb0dcfdbbc4f9c3ba1a63fdb511ffdbd4f513b2b6d81b80cd26ce6b3fb3736  html5lib-1.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256	16a39991619e92f18680932da2a9199fdf7d95df3ecaedc52ea06218aabafd6f  LICENSE
diff --git a/package/python-html5lib/python-html5lib.mk b/package/python-html5lib/python-html5lib.mk
index 38affcbb4e..1d6aef1aad 100644
--- a/package/python-html5lib/python-html5lib.mk
+++ b/package/python-html5lib/python-html5lib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTML5LIB_VERSION = 1.0b10
+PYTHON_HTML5LIB_VERSION = 1.0.1
 PYTHON_HTML5LIB_SOURCE = html5lib-$(PYTHON_HTML5LIB_VERSION).tar.gz
-PYTHON_HTML5LIB_SITE = https://pypi.python.org/packages/97/16/982214624095c1420c75f3bd295d9e658794aafb95fc075823de107e0ae4
+PYTHON_HTML5LIB_SITE = https://files.pythonhosted.org/packages/85/3e/cf449cf1b5004e87510b9368e7a5f1acd8831c2d6691edd3c62a0823f98f
 PYTHON_HTML5LIB_LICENSE = MIT
 PYTHON_HTML5LIB_LICENSE_FILES = LICENSE
 PYTHON_HTML5LIB_SETUP_TYPE = setuptools

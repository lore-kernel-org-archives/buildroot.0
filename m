From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Sun, 24 Feb 2019 11:35:22 +0800
Subject: [Buildroot] [PATCH 1/1] python-aiohttp-cors: new package
Message-ID: <20190224033522.3115-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

CORS support for aiohttp.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-aiohttp-cors/Config.in              |  8 ++++++++
 .../python-aiohttp-cors/python-aiohttp-cors.hash   |  5 +++++
 package/python-aiohttp-cors/python-aiohttp-cors.mk | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-aiohttp-cors/Config.in
 create mode 100644 package/python-aiohttp-cors/python-aiohttp-cors.hash
 create mode 100644 package/python-aiohttp-cors/python-aiohttp-cors.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4e59287a4c..830e9e8cd9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1009,6 +1009,7 @@ F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
 F:	package/python-aiodns/
 F:	package/python-aiohttp/
+F:	package/python-aiohttp-cors/
 F:	package/python-aiohttp-jinja2/
 F:	package/python-aiohttp-remotes/
 F:	package/python-aiohttp-security/
diff --git a/package/Config.in b/package/Config.in
index cc232b9fba..5fdd656573 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -801,6 +801,7 @@ menu "External python modules"
 	source "package/python-aiocoap/Config.in"
 	source "package/python-aiodns/Config.in"
 	source "package/python-aiohttp/Config.in"
+	source "package/python-aiohttp-cors/Config.in"
 	source "package/python-aiohttp-jinja2/Config.in"
 	source "package/python-aiohttp-remotes/Config.in"
 	source "package/python-aiohttp-security/Config.in"
diff --git a/package/python-aiohttp-cors/Config.in b/package/python-aiohttp-cors/Config.in
new file mode 100644
index 0000000000..1c97cf3f87
--- /dev/null
+++ b/package/python-aiohttp-cors/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_AIOHTTP_CORS
+	bool "python-aiohttp-cors"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
+	help
+	  CORS support for aiohttp.
+
+	  https://github.com/aio-libs/aiohttp-cors
diff --git a/package/python-aiohttp-cors/python-aiohttp-cors.hash b/package/python-aiohttp-cors/python-aiohttp-cors.hash
new file mode 100644
index 0000000000..b91e5fa8c0
--- /dev/null
+++ b/package/python-aiohttp-cors/python-aiohttp-cors.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiohttp_cors/json
+md5	de3940a901b269be82c8bd9f28d53ff0  aiohttp-cors-0.7.0.tar.gz
+sha256	4d39c6d7100fd9764ed1caf8cebf0eb01bf5e3f24e2e073fda6234bc48b19f5d  aiohttp-cors-0.7.0.tar.gz
+# Locally computed sha256 checksums
+sha256	86cb2262ff825ce1c8b8fb9ea9f5174318badc3912639b9275fc25d0e305c556  LICENSE
diff --git a/package/python-aiohttp-cors/python-aiohttp-cors.mk b/package/python-aiohttp-cors/python-aiohttp-cors.mk
new file mode 100644
index 0000000000..27443540d0
--- /dev/null
+++ b/package/python-aiohttp-cors/python-aiohttp-cors.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiohttp-cors
+#
+################################################################################
+
+PYTHON_AIOHTTP_CORS_VERSION = 0.7.0
+PYTHON_AIOHTTP_CORS_SOURCE = aiohttp-cors-$(PYTHON_AIOHTTP_CORS_VERSION).tar.gz
+PYTHON_AIOHTTP_CORS_SITE = https://files.pythonhosted.org/packages/44/9e/6cdce7c3f346d8fd487adf68761728ad8cd5fbc296a7b07b92518350d31f
+PYTHON_AIOHTTP_CORS_SETUP_TYPE = setuptools
+PYTHON_AIOHTTP_CORS_LICENSE = Apache-2.0
+PYTHON_AIOHTTP_CORS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.17.1

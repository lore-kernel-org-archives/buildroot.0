From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Dec 2019 19:24:11 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-async-lru: new package
Message-ID: <20191211022411.66872-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simple lru_cache for asyncio.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-async-lru/Config.in             |  7 +++++++
 package/python-async-lru/python-async-lru.hash |  5 +++++
 package/python-async-lru/python-async-lru.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-async-lru/Config.in
 create mode 100644 package/python-async-lru/python-async-lru.hash
 create mode 100644 package/python-async-lru/python-async-lru.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 61bcd99d43..35716ffee5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1139,6 +1139,7 @@ F:	package/python-aiohttp-sse/
 F:	package/python-aiomonitor/
 F:	package/python-aiojobs/
 F:	package/python-aiorwlock/
+F:	package/python-async-lru/
 F:	package/python-async-timeout/
 F:	package/python-brotli/
 F:	package/python-cchardet/
diff --git a/package/Config.in b/package/Config.in
index 307583d01f..9497cda5e2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -840,6 +840,7 @@ menu "External python modules"
 	source "package/python-arrow/Config.in"
 	source "package/python-asgiref/Config.in"
 	source "package/python-asn1crypto/Config.in"
+	source "package/python-async-lru/Config.in"
 	source "package/python-async-timeout/Config.in"
 	source "package/python-attrs/Config.in"
 	source "package/python-autobahn/Config.in"
diff --git a/package/python-async-lru/Config.in b/package/python-async-lru/Config.in
new file mode 100644
index 0000000000..794f504e5e
--- /dev/null
+++ b/package/python-async-lru/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_ASYNC_LRU
+	bool "python-async-lru"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Simple lru_cache for asyncio.
+
+	  https://github.com/aio-libs/async_lru
diff --git a/package/python-async-lru/python-async-lru.hash b/package/python-async-lru/python-async-lru.hash
new file mode 100644
index 0000000000..6fa61e0e12
--- /dev/null
+++ b/package/python-async-lru/python-async-lru.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/async_lru/json
+md5	69bed62927426353513e68aec77989ab  async_lru-1.0.2.tar.gz
+sha256	baa898027619f5cc31b7966f96f00e4fc0df43ba206a8940a5d1af5336a477cb  async_lru-1.0.2.tar.gz
+# Locally computed sha256 checksums
+sha256	ea65975679bc2093be925d520358e41096bd96fddedee3e929160a5faadcf573  LICENSE
diff --git a/package/python-async-lru/python-async-lru.mk b/package/python-async-lru/python-async-lru.mk
new file mode 100644
index 0000000000..adaa8f628d
--- /dev/null
+++ b/package/python-async-lru/python-async-lru.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-async-lru
+#
+################################################################################
+
+PYTHON_ASYNC_LRU_VERSION = 1.0.2
+PYTHON_ASYNC_LRU_SOURCE = async_lru-$(PYTHON_ASYNC_LRU_VERSION).tar.gz
+PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/7e/c1/a3d6207deaaeb582d16dc9a0fd217f192efc9487ce59897131cf9a2bdc1c
+PYTHON_ASYNC_LRU_SETUP_TYPE = setuptools
+PYTHON_ASYNC_LRU_LICENSE = MIT
+PYTHON_ASYNC_LRU_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.20.1

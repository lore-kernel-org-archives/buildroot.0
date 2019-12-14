From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 22:10:16 +0100
Subject: [Buildroot] [git commit] package/python-async-lru: new package
Message-ID: <20191214212006.856CE8A5DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fec6cfcd57aee0e629f8b1968d24229d160ac07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Simple lru_cache for asyncio.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-async-lru/Config.in             |  7 +++++++
 package/python-async-lru/python-async-lru.hash |  5 +++++
 package/python-async-lru/python-async-lru.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d2e9d9e1c6..5fa4015fdb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1143,6 +1143,7 @@ F:	package/python-aiologstash/
 F:	package/python-aiomonitor/
 F:	package/python-aiojobs/
 F:	package/python-aiorwlock/
+F:	package/python-async-lru/
 F:	package/python-async-timeout/
 F:	package/python-brotli/
 F:	package/python-cchardet/
diff --git a/package/Config.in b/package/Config.in
index bcd7f68466..96957ef8fd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -843,6 +843,7 @@ menu "External python modules"
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

From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Mon,  4 Mar 2019 07:44:19 +0800
Subject: [Buildroot] [PATCH 2/3] package/python-aioconsole: new package
In-Reply-To: <20190303234420.1727-1-james.hilliard1@gmail.com>
References: <20190303234420.1727-1-james.hilliard1@gmail.com>
Message-ID: <20190303234420.1727-2-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Asynchronous console and interfaces for asyncio.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-aioconsole/Config.in              |  7 +++++++
 package/python-aioconsole/python-aioconsole.hash |  3 +++
 package/python-aioconsole/python-aioconsole.mk   | 13 +++++++++++++
 5 files changed, 25 insertions(+)
 create mode 100644 package/python-aioconsole/Config.in
 create mode 100644 package/python-aioconsole/python-aioconsole.hash
 create mode 100644 package/python-aioconsole/python-aioconsole.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5e86c2cbc7..f38d62a148 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1026,6 +1026,7 @@ F:	configs/pine64_sopine_defconfig
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
+F:	package/python-aioconsole/
 F:	package/python-aiodns/
 F:	package/python-aiohttp/
 F:	package/python-aiohttp-jinja2/
diff --git a/package/Config.in b/package/Config.in
index adb3cc9151..b27f8dd70b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -800,6 +800,7 @@ endif
 if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "External python modules"
 	source "package/python-aiocoap/Config.in"
+	source "package/python-aioconsole/Config.in"
 	source "package/python-aiodns/Config.in"
 	source "package/python-aiohttp/Config.in"
 	source "package/python-aiohttp-jinja2/Config.in"
diff --git a/package/python-aioconsole/Config.in b/package/python-aioconsole/Config.in
new file mode 100644
index 0000000000..cd52eecf32
--- /dev/null
+++ b/package/python-aioconsole/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_AIOCONSOLE
+	bool "python-aioconsole"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  Asynchronous console and interfaces for asyncio.
+
+	  https://github.com/vxgmichel/aioconsole
diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
new file mode 100644
index 0000000000..0e09cfb4ec
--- /dev/null
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/aioconsole/json
+md5	212dc49e2f2a995c87ce659ba63e7422  aioconsole-0.1.13.tar.gz
+sha256	8b9898f0f6539bdce3bc3720d75189e21813f1a7f8350228fc7fd54bf7327d0f  aioconsole-0.1.13.tar.gz
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
new file mode 100644
index 0000000000..135e45f6e5
--- /dev/null
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-aioconsole
+#
+################################################################################
+
+PYTHON_AIOCONSOLE_VERSION = 0.1.13
+PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/ea/ee/80154d7242c2107d02768c5a848e4cded39ce8cd89b48982c217474c8ddd
+PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
+PYTHON_AIOCONSOLE_LICENSE = GPLv3
+
+$(eval $(python-package))
-- 
2.17.1

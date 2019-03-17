From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 16:24:08 +0100
Subject: [Buildroot] [git commit] package/python-aioconsole: new package
Message-ID: <20190317152442.BBBB382283@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77889217f11fe227c14a5fab03115ea2d25a7de6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Asynchronous console and interfaces for asyncio.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-aioconsole/Config.in              |  7 +++++++
 package/python-aioconsole/python-aioconsole.hash |  3 +++
 package/python-aioconsole/python-aioconsole.mk   | 13 +++++++++++++
 5 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 359f04490c..ae1d97152c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1033,6 +1033,7 @@ F:	configs/pine64_sopine_defconfig
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
+F:	package/python-aioconsole/
 F:	package/python-aiodns/
 F:	package/python-aiohttp/
 F:	package/python-aiohttp-cors/
diff --git a/package/Config.in b/package/Config.in
index 457018b18e..2407c12b52 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -800,6 +800,7 @@ if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "External python modules"
 	source "package/python-aioblescan/Config.in"
 	source "package/python-aiocoap/Config.in"
+	source "package/python-aioconsole/Config.in"
 	source "package/python-aiodns/Config.in"
 	source "package/python-aiohttp/Config.in"
 	source "package/python-aiohttp-cors/Config.in"
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
index 0000000000..47245d2038
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
+PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
+
+$(eval $(python-package))

From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Fri,  7 Dec 2018 07:08:15 +0800
Subject: [Buildroot] [PATCH 1/1] package/python-aiojobs: new package
Message-ID: <1544137695-27116-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Jobs scheduler for managing background task (asyncio).

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-aiojobs/Config.in           |  8 ++++++++
 package/python-aiojobs/python-aiojobs.hash |  5 +++++
 package/python-aiojobs/python-aiojobs.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-aiojobs/Config.in
 create mode 100644 package/python-aiojobs/python-aiojobs.hash
 create mode 100644 package/python-aiojobs/python-aiojobs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c289b3f..b167e45 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -992,6 +992,7 @@ F:	configs/pine64_sopine_defconfig
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/python-aiodns/
 F:	package/python-aiohttp/
+F:	package/python-aiojobs/
 F:	package/python-async-timeout/
 F:	package/python-cchardet/
 F:	package/python-multidict/
diff --git a/package/Config.in b/package/Config.in
index f6252f2..dfffddf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -799,6 +799,7 @@ menu "External python modules"
 	source "package/python-aiocoap/Config.in"
 	source "package/python-aiodns/Config.in"
 	source "package/python-aiohttp/Config.in"
+	source "package/python-aiojobs/Config.in"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-arrow/Config.in"
diff --git a/package/python-aiojobs/Config.in b/package/python-aiojobs/Config.in
new file mode 100644
index 0000000..54d6c02
--- /dev/null
+++ b/package/python-aiojobs/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_AIOJOBS
+	bool "python-aiojobs"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
+	help
+	  Jobs scheduler for managing background task (asyncio).
+
+	  https://github.com/aio-libs/aiojobs
diff --git a/package/python-aiojobs/python-aiojobs.hash b/package/python-aiojobs/python-aiojobs.hash
new file mode 100644
index 0000000..56a8bb1
--- /dev/null
+++ b/package/python-aiojobs/python-aiojobs.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiojobs/json
+md5	8fd929e4ef9bc6560c675a5b11ac6077  aiojobs-0.2.2.tar.gz
+sha256	8e4b3e3d1bdb970bdaf8f8cd5eb4e4ff3e0e01a4abd22b4f73a87002a5ae4005  aiojobs-0.2.2.tar.gz
+# Locally computed sha256 checksums
+sha256	b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/python-aiojobs/python-aiojobs.mk b/package/python-aiojobs/python-aiojobs.mk
new file mode 100644
index 0000000..7a95f99
--- /dev/null
+++ b/package/python-aiojobs/python-aiojobs.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiojobs
+#
+################################################################################
+
+PYTHON_AIOJOBS_VERSION = 0.2.2
+PYTHON_AIOJOBS_SOURCE = aiojobs-$(PYTHON_AIOJOBS_VERSION).tar.gz
+PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/57/c5/9eb091930d6574002d1721dab5ca15a1bd69ed5dc8e654159d27223cdd3b
+PYTHON_AIOJOBS_SETUP_TYPE = distutils
+PYTHON_AIOJOBS_LICENSE = Apache-2.0
+PYTHON_AIOJOBS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.7.4

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Oct 2019 22:01:20 +0200
Subject: [Buildroot] [git commit]
 package/python-backports-functools-lru-cache: new package
Message-ID: <20191012195737.BD88A8D68F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=140f61af5f50335dba7cd2dd688b8bc43dfbd0d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport of functools.lru_cache from Python 3.3.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                         |  1 +
 package/python-backports-functools-lru-cache/Config.in    |  7 +++++++
 .../python-backports-functools-lru-cache.hash             |  5 +++++
 .../python-backports-functools-lru-cache.mk               | 15 +++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 3a4b1c33bb..faa4689548 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -840,6 +840,7 @@ menu "External python modules"
 	source "package/python-babel/Config.in"
 	source "package/python-backcall/Config.in"
 	source "package/python-backports-abc/Config.in"
+	source "package/python-backports-functools-lru-cache/Config.in"
 	source "package/python-backports-shutil-get-terminal-size/Config.in"
 	source "package/python-backports-ssl-match-hostname/Config.in"
 	source "package/python-bcrypt/Config.in"
diff --git a/package/python-backports-functools-lru-cache/Config.in b/package/python-backports-functools-lru-cache/Config.in
new file mode 100644
index 0000000000..a5b7771e4d
--- /dev/null
+++ b/package/python-backports-functools-lru-cache/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE
+	bool "python-backports-functools-lru-cache"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Backport of functools.lru_cache from Python 3.3
+
+	  https://github.com/jaraco/backports.functools_lru_cache
diff --git a/package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.hash b/package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.hash
new file mode 100644
index 0000000000..3db4aec1fb
--- /dev/null
+++ b/package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/backports.functools_lru_cache/json
+md5	20f53f54cd3f04b3346ce75a54959754  backports.functools_lru_cache-1.5.tar.gz
+sha256	9d98697f088eb1b0fa451391f91afb5e3ebde16bbdb272819fd091151fda4f1a  backports.functools_lru_cache-1.5.tar.gz
+# Localy computed sha256 checksumms
+sha256	a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.mk b/package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.mk
new file mode 100644
index 0000000000..334d6d8c49
--- /dev/null
+++ b/package/python-backports-functools-lru-cache/python-backports-functools-lru-cache.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-backports-functools-lru-cache
+#
+################################################################################
+
+PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_VERSION = 1.5
+PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_SOURCE = backports.functools_lru_cache-$(PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_VERSION).tar.gz
+PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_SITE = https://files.pythonhosted.org/packages/57/d4/156eb5fbb08d2e85ab0a632e2bebdad355798dece07d4752f66a8d02d1ea
+PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_SETUP_TYPE = setuptools
+PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_LICENSE = MIT
+PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

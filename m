From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 19 Oct 2019 19:13:16 +0200
Subject: [Buildroot] [git commit] package/python-pathpy: bump to version
 12.0.1
Message-ID: <20191019171204.BB092826E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26a6a277cfd62e15a6a7f5251b2cf35d8d3c112b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Add license file (and hash).
* Support for Python 2 has dropped.
* Update recursive reverse dependencies to only support Python 3.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pathpy/Config.in          | 1 +
 package/python-pathpy/python-pathpy.hash | 8 +++++---
 package/python-pathpy/python-pathpy.mk   | 5 +++--
 package/python-pytablereader/Config.in   | 2 +-
 package/python-pytablewriter/Config.in   | 1 +
 5 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/python-pathpy/Config.in b/package/python-pathpy/Config.in
index 98c05126bf..7c7ffc9e92 100644
--- a/package/python-pathpy/Config.in
+++ b/package/python-pathpy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PATHPY
 	bool "python-pathpy"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  path.py implements a path objects as first-class
 	  entities, allowing common operations on files to
diff --git a/package/python-pathpy/python-pathpy.hash b/package/python-pathpy/python-pathpy.hash
index de22f6c576..4ff5abb38b 100644
--- a/package/python-pathpy/python-pathpy.hash
+++ b/package/python-pathpy/python-pathpy.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/path.py/json, sha256 locally computed
-md5	afb4f92e4114b595f50573ecd61c31ee  path.py-10.5.tar.gz
-sha256	63a7af08676668fd51750f111affbd38c1a13c61aba15c6665b16681771c79a8  path.py-10.5.tar.gz
+# md5, sha256 from https://pypi.org/pypi/path.py/json
+md5	307098b1827af6031687edb49ce2c39c  path.py-12.0.1.tar.gz
+sha256	9f2169633403aa0423f6ec000e8701dd1819526c62465f5043952f92527fea0f  path.py-12.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256	a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
diff --git a/package/python-pathpy/python-pathpy.mk b/package/python-pathpy/python-pathpy.mk
index 452331682b..3b7388bdd2 100644
--- a/package/python-pathpy/python-pathpy.mk
+++ b/package/python-pathpy/python-pathpy.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PATHPY_VERSION = 10.5
+PYTHON_PATHPY_VERSION = 12.0.1
 PYTHON_PATHPY_SOURCE = path.py-$(PYTHON_PATHPY_VERSION).tar.gz
-PYTHON_PATHPY_SITE = https://pypi.python.org/packages/a5/7b/7b303dc1b79fc394b67cea351455ec0db8e6ca5d8537687d40cb7c7d70bb
+PYTHON_PATHPY_SITE = https://files.pythonhosted.org/packages/70/63/c01c1bb2df17db4c78f78cc439a2800f55bec5445cabf1f3579a37909f41
 PYTHON_PATHPY_SETUP_TYPE = setuptools
 PYTHON_PATHPY_LICENSE = MIT
+PYTHON_PATHPY_LICENSE_FILES = LICENSE
 PYTHON_PATHPY_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
diff --git a/package/python-pytablereader/Config.in b/package/python-pytablereader/Config.in
index 29951ab0aa..a93cdbb895 100644
--- a/package/python-pytablereader/Config.in
+++ b/package/python-pytablereader/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_PYTABLEREADER
 	bool "python-pytablereader"
+	depends on BR2_PACKAGE_PYTHON3 # python-pathpy
 	select BR2_PACKAGE_PYTHON_BEAUTIFULSOUP4 # runtime
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
-	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
 	select BR2_PACKAGE_PYTHON_LOGBOOK # runtime
 	select BR2_PACKAGE_PYTHON_MARKDOWN2 # runtime
diff --git a/package/python-pytablewriter/Config.in b/package/python-pytablewriter/Config.in
index 10672dc467..866ad83007 100644
--- a/package/python-pytablewriter/Config.in
+++ b/package/python-pytablewriter/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYTABLEWRITER
 	bool "python-pytablewriter"
+	depends on BR2_PACKAGE_PYTHON3 # python-pathpy
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_DOMINATE # runtime
 	select BR2_PACKAGE_PYTHON_LOGBOOK # runtime

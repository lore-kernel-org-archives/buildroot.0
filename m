From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 21:17:45 +0200
Subject: [Buildroot] [git commit] package/python-simplesqlite: bump to
 version 0.45.2
Message-ID: <20191018191756.5B123826DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35e6565a040c12af1daed8da301500e0a110298f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Update dependency list.
* Add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-simplesqlite/Config.in                | 4 ++--
 package/python-simplesqlite/python-simplesqlite.hash | 8 +++++---
 package/python-simplesqlite/python-simplesqlite.mk   | 4 ++--
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/python-simplesqlite/Config.in b/package/python-simplesqlite/Config.in
index 25941dd9c8..c03411b90f 100644
--- a/package/python-simplesqlite/Config.in
+++ b/package/python-simplesqlite/Config.in
@@ -1,14 +1,14 @@
 config BR2_PACKAGE_PYTHON_SIMPLESQLITE
 	bool "python-simplesqlite"
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
-	select BR2_PACKAGE_PYTHON_LOGBOOK # runtime
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
 	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
-	select BR2_PACKAGE_PYTHON_PYTABLEREADER # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_SQLITE if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_SQLITE if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_SQLITESCHEMA # runtime
+	select BR2_PACKAGE_PYTHON_TABLEDATA # runtime
 	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
 	help
 	  SimpleSQLite is a Python library to simplify SQLite database
diff --git a/package/python-simplesqlite/python-simplesqlite.hash b/package/python-simplesqlite/python-simplesqlite.hash
index b9dc1378c0..7b4a91de0c 100644
--- a/package/python-simplesqlite/python-simplesqlite.hash
+++ b/package/python-simplesqlite/python-simplesqlite.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/simplesqlite/json, sha256 locally computed
-md5	be05735a65f91bf0bb47c2bfcf474dd3  SimpleSQLite-0.15.0.tar.gz
-sha256	319cf4fd660a2a8ba1d77bac65e3cb3bed30ef5e2b2f98aab558026a29bbefec  SimpleSQLite-0.15.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/simplesqlite/json
+md5	f1d4f2ec14e2c782a62e451587477598  SimpleSQLite-0.45.2.tar.gz
+sha256	0b19c99c36b63173a715649f94a2fc3aee8deb9b70c683d584bca85e5930244b  SimpleSQLite-0.45.2.tar.gz
+# Locally computed sha256 checksums
+sha256	98799b7c99b561c5ffa3ac86600e501f761afa8e72af8a2515026445fe134105  LICENSE
diff --git a/package/python-simplesqlite/python-simplesqlite.mk b/package/python-simplesqlite/python-simplesqlite.mk
index 48c37c563e..88ffcd4d45 100644
--- a/package/python-simplesqlite/python-simplesqlite.mk
+++ b/package/python-simplesqlite/python-simplesqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLESQLITE_VERSION = 0.15.0
+PYTHON_SIMPLESQLITE_VERSION = 0.45.2
 PYTHON_SIMPLESQLITE_SOURCE = SimpleSQLite-$(PYTHON_SIMPLESQLITE_VERSION).tar.gz
-PYTHON_SIMPLESQLITE_SITE = https://pypi.python.org/packages/d5/09/e256a7d421c223505d4e89079b4936c6a6de39a5a095ec4bcaa9bfc3f933
+PYTHON_SIMPLESQLITE_SITE = https://files.pythonhosted.org/packages/b3/d1/bc3668ed7d90ee70d556124b8b5b3329505d72b5290bb393626f1afe714d
 PYTHON_SIMPLESQLITE_SETUP_TYPE = setuptools
 PYTHON_SIMPLESQLITE_LICENSE = MIT
 PYTHON_SIMPLESQLITE_LICENSE_FILES = LICENSE

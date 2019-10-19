From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 19 Oct 2019 20:32:02 +0200
Subject: [Buildroot] [git commit] package/python-pytablewriter: bump to
 version 0.46.1
Message-ID: <20191019182739.6C4C9826DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6b5a340094bd2f31fe2c0658e30268296a1afdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Fix indentation in hash file.
* Update dependency list.
* The package can now be compiled for both Python 2 and Python 3,
  since it doesn't depend on pytablereader anymore (which used pathpy).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-pytablewriter/Config.in                 | 11 +++--------
 package/python-pytablewriter/python-pytablewriter.hash |  9 +++++----
 package/python-pytablewriter/python-pytablewriter.mk   |  4 ++--
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/package/python-pytablewriter/Config.in b/package/python-pytablewriter/Config.in
index 866ad83007..9fed52c83f 100644
--- a/package/python-pytablewriter/Config.in
+++ b/package/python-pytablewriter/Config.in
@@ -1,19 +1,14 @@
 config BR2_PACKAGE_PYTHON_PYTABLEWRITER
 	bool "python-pytablewriter"
-	depends on BR2_PACKAGE_PYTHON3 # python-pathpy
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
-	select BR2_PACKAGE_PYTHON_DOMINATE # runtime
-	select BR2_PACKAGE_PYTHON_LOGBOOK # runtime
+	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
+	select BR2_PACKAGE_PYTHON_MSGFY # runtime
 	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
-	select BR2_PACKAGE_PYTHON_PYTABLEREADER # runtime
-	select BR2_PACKAGE_PYTHON_SIMPLESQLITE # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TABLEDATA # runtime
-	select BR2_PACKAGE_PYTHON_TOML # runtime
 	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
-	select BR2_PACKAGE_PYTHON_XLSXWRITER # runtime
-	select BR2_PACKAGE_PYTHON_XLWT # runtime
 	help
 	  pytablewriter is a python library to write a table in various
 	  formats: CSV, HTML, JavaScript, JSON, Markdown, Excel, Pandas,
diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
index 36e1453920..8933fe37d5 100644
--- a/package/python-pytablewriter/python-pytablewriter.hash
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pytablewriter/json, sha256 locally computed
-md5	7d7eff9665b1d9e0c0189c34f8c562c3  pytablewriter-0.27.1.tar.gz
-sha256	89e43bffc60ea93f0ed0cc8d8ddbf34ac0b74f8cf781c6c39f4c8bc3a7e4c436  pytablewriter-0.27.1.tar.gz
-sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
+# md5, sha256 from https://pypi.org/pypi/pytablewriter/json
+md5	4909dcdba8c6df35e14dbecbc6c94b6c  pytablewriter-0.46.1.tar.gz
+sha256	9d52ecc84bb89197c312e193b4ff04a3c934b914f3c32e4826d44a0acbc7764f  pytablewriter-0.46.1.tar.gz
+# Locally computed sha256 checksums
+sha256	a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
index dd87213e2c..a63f7f8a2a 100644
--- a/package/python-pytablewriter/python-pytablewriter.mk
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEWRITER_VERSION = 0.27.1
+PYTHON_PYTABLEWRITER_VERSION = 0.46.1
 PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
-PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/c2/88/6a9f6cbdabd773ba6de6c41d7a0af58eed37ca97b1d666b04819d0bf9b54
+PYTHON_PYTABLEWRITER_SITE = https://files.pythonhosted.org/packages/bb/86/d5f3dfec35d2d7583c9f3f1d731adf729851d1fe01011f07a747eb8c7df0
 PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEWRITER_LICENSE = MIT
 PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE

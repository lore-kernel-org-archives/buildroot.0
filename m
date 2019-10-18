From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 21:13:17 +0200
Subject: [Buildroot] [git commit] package/python-tabledata: bump to version
 0.9.1
Message-ID: <20191018191755.E8AF9826E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c75805e3c45c843441b259cf019299b29d2875a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Update dependency list.
* Remove post-extract hook, since setup.cfg doesn't create wheel anymore.
* Update license hash: same content, line-endings are now UNIX.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-tabledata/Config.in             |  5 +++--
 package/python-tabledata/python-tabledata.hash |  9 +++++----
 package/python-tabledata/python-tabledata.mk   | 11 ++---------
 3 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/package/python-tabledata/Config.in b/package/python-tabledata/Config.in
index 9e8ca9c31d..bd856d23e4 100644
--- a/package/python-tabledata/Config.in
+++ b/package/python-tabledata/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_PYTHON_TABLEDATA
 	bool "python-tabledata"
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
-	select BR2_PACKAGE_PYTHON_LOGBOOK # runtime
-	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_FUTURES if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
 	help
 	  A Python library to represent tabular data for
diff --git a/package/python-tabledata/python-tabledata.hash b/package/python-tabledata/python-tabledata.hash
index efc6d6a826..9d8564db30 100644
--- a/package/python-tabledata/python-tabledata.hash
+++ b/package/python-tabledata/python-tabledata.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/tabledata/json, sha256 locally computed
-md5	4ff69d8855a835890944591721d0c129  tabledata-0.0.5.tar.gz
-sha256	e16490e4c15f06ee258015431ec247a5b301aec4ebca3297cf6451efb9eb3cfb  tabledata-0.0.5.tar.gz
-sha256  cbce2ac14dd81b6a1155029034512a304505692cc63b625538916cf93bee8ca2  LICENSE
+# md5, sha256 from https://pypi.org/pypi/tabledata/json
+md5	3a97a7bd3f2687a139578a79353a8188  tabledata-0.9.1.tar.gz
+sha256	a2c59603ecb56cd2161a72978d56876377ba6a27a3e6d87e1874ba4d5ab02796  tabledata-0.9.1.tar.gz
+# Locally computed sha256 checksums
+sha256	bebbdf0524a147f89a615fff53d79bdc90cbc7631550fb4b725cd3f3bdcd24f6  LICENSE
diff --git a/package/python-tabledata/python-tabledata.mk b/package/python-tabledata/python-tabledata.mk
index 1305909374..c1381928c4 100644
--- a/package/python-tabledata/python-tabledata.mk
+++ b/package/python-tabledata/python-tabledata.mk
@@ -4,18 +4,11 @@
 #
 ################################################################################
 
-PYTHON_TABLEDATA_VERSION = 0.0.5
+PYTHON_TABLEDATA_VERSION = 0.9.1
 PYTHON_TABLEDATA_SOURCE = tabledata-$(PYTHON_TABLEDATA_VERSION).tar.gz
-PYTHON_TABLEDATA_SITE = https://pypi.python.org/packages/9d/03/2e96d18f2bd4b76611fc6aa3881c7e15c857eea99debea9b80ec689354ba
+PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/7d/20/7178ce0e3e34d5aff07e2280522b7e1bc23d4f2fbb916b765bbb41b22174
 PYTHON_TABLEDATA_SETUP_TYPE = setuptools
 PYTHON_TABLEDATA_LICENSE = MIT
 PYTHON_TABLEDATA_LICENSE_FILES = LICENSE
 
-# remove setup.cfg as it tries to create a wheel file and hence
-# breaks the build process
-define PYTHON_TABLEDATA_REMOVE_SETUP_CFG
-	rm $(@D)/setup.cfg
-endef
-PYTHON_TABLEDATA_POST_EXTRACT_HOOKS = PYTHON_TABLEDATA_REMOVE_SETUP_CFG
-
 $(eval $(python-package))

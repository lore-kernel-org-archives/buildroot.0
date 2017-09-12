From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Sep 2017 23:39:40 +0200
Subject: [Buildroot] [git commit] python-xmltodict: new package
Message-ID: <20170912213541.D89C580FE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc5892d49c56149bb9f7c51f5050963e75079c69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                              |  1 +
 package/python-xmltodict/Config.in             |  8 ++++++++
 package/python-xmltodict/python-xmltodict.hash |  4 ++++
 package/python-xmltodict/python-xmltodict.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 9554b6f..bebcdcb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -909,6 +909,7 @@ menu "External python modules"
 	source "package/python-xlsxwriter/Config.in"
 	source "package/python-xlutils/Config.in"
 	source "package/python-xlwt/Config.in"
+	source "package/python-xmltodict/Config.in"
 	source "package/python-zope-interface/Config.in"
 endmenu
 endif
diff --git a/package/python-xmltodict/Config.in b/package/python-xmltodict/Config.in
new file mode 100644
index 0000000..cb12392
--- /dev/null
+++ b/package/python-xmltodict/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_XMLTODICT
+	bool "python-xmltodict"
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
+	help
+	  Makes working with XML feel like you are working with JSON.
+
+	  https://github.com/martinblech/xmltodict
diff --git a/package/python-xmltodict/python-xmltodict.hash b/package/python-xmltodict/python-xmltodict.hash
new file mode 100644
index 0000000..4cb265e
--- /dev/null
+++ b/package/python-xmltodict/python-xmltodict.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/xmltodict/json, sha256 locally computed
+md5	9f955947db085485873ac68154e88069  xmltodict-0.11.0.tar.gz
+sha256	8f8d7d40aa28d83f4109a7e8aa86e67a4df202d9538be40c0cb1d70da527b0df  xmltodict-0.11.0.tar.gz
+sha256  d66d5eb8f83a0ba21d3dd04318b8817588e8764daabea852d1035e3f07ffda55  LICENSE
diff --git a/package/python-xmltodict/python-xmltodict.mk b/package/python-xmltodict/python-xmltodict.mk
new file mode 100644
index 0000000..66007df
--- /dev/null
+++ b/package/python-xmltodict/python-xmltodict.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-xmltodict
+#
+################################################################################
+
+PYTHON_XMLTODICT_VERSION = 0.11.0
+PYTHON_XMLTODICT_SOURCE = xmltodict-$(PYTHON_XMLTODICT_VERSION).tar.gz
+PYTHON_XMLTODICT_SITE = https://pypi.python.org/packages/57/17/a6acddc5f5993ea6eaf792b2e6c3be55e3e11f3b85206c818572585f61e1
+PYTHON_XMLTODICT_SETUP_TYPE = setuptools
+PYTHON_XMLTODICT_LICENSE = MIT
+PYTHON_XMLTODICT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

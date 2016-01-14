From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 14 Jan 2016 22:21:00 +0100
Subject: [Buildroot] [PATCH] python-beautifulsoup4: new package
Message-ID: <1452806460-9045-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                                        |  1 +
 package/python-beautifulsoup4/Config.in                  |  6 ++++++
 package/python-beautifulsoup4/python-beautifulsoup4.hash |  4 ++++
 package/python-beautifulsoup4/python-beautifulsoup4.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-beautifulsoup4/Config.in
 create mode 100644 package/python-beautifulsoup4/python-beautifulsoup4.hash
 create mode 100644 package/python-beautifulsoup4/python-beautifulsoup4.mk

diff --git a/package/Config.in b/package/Config.in
index 89b23db..5d24527 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -618,6 +618,7 @@ if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "External python modules"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-backports-abc/Config.in"
+	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bottle/Config.in"
 	source "package/python-can/Config.in"
 	source "package/python-certifi/Config.in"
diff --git a/package/python-beautifulsoup4/Config.in b/package/python-beautifulsoup4/Config.in
new file mode 100644
index 0000000..1011536
--- /dev/null
+++ b/package/python-beautifulsoup4/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_BEAUTIFULSOUP4
+	bool "python-beautifulsoup4"
+	help
+	  Screen-scraping library
+
+	  http://www.crummy.com/software/BeautifulSoup/bs4/
diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.hash b/package/python-beautifulsoup4/python-beautifulsoup4.hash
new file mode 100644
index 0000000..885c266
--- /dev/null
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/beautifulsoup4/json
+md5	8fbd9a7cac0704645fa20d1419036815  beautifulsoup4-4.4.1.tar.gz
+# sha256 calculated by scanpypi
+sha256	87d4013d0625d4789a4f56b8d79a04d5ce6db1152bb65f1d39744f7709a366b4  beautifulsoup4-4.4.1.tar.gz
diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.mk b/package/python-beautifulsoup4/python-beautifulsoup4.mk
new file mode 100644
index 0000000..58481b9
--- /dev/null
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-beautifulsoup4
+#
+################################################################################
+
+PYTHON_BEAUTIFULSOUP4_VERSION = 4.4.1
+PYTHON_BEAUTIFULSOUP4_SOURCE = beautifulsoup4-$(PYTHON_BEAUTIFULSOUP4_VERSION).tar.gz
+PYTHON_BEAUTIFULSOUP4_SITE = https://pypi.python.org/packages/source/b/beautifulsoup4
+PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = setuptools
+PYTHON_BEAUTIFULSOUP4_LICENSE = MIT
+PYTHON_BEAUTIFULSOUP4_LICENSE_FILES = COPYING.txt
+
+$(eval $(python-package))
-- 
2.1.4

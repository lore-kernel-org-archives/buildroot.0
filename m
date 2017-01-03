From: David Bachelart <david.bachelart@bbright.com>
Date: Tue,  3 Jan 2017 09:26:46 +0100
Subject: [Buildroot] [PATCH v3 1/1] python-chardet: new package
Message-ID: <1483432006-8267-1-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
Changes v1 -> v2:
  - download source from pypi.python.org
  - use upstream MD5 sum in hash file

Changes v2 -> v3:
  - use ./support/scripts/scanpypi chardet to create package (suggestion from Yegor Yefremov)
  - update description, add missing dot (suggestion from Yegor Yefremov)
  - update license
  - remove sha1 sum in hash file (suggestion from Yegor Yefremov)
---
 package/Config.in                          |  1 +
 package/python-chardet/Config.in           |  6 ++++++
 package/python-chardet/python-chardet.hash |  3 +++
 package/python-chardet/python-chardet.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-chardet/Config.in
 create mode 100644 package/python-chardet/python-chardet.hash
 create mode 100644 package/python-chardet/python-chardet.mk

diff --git a/package/Config.in b/package/Config.in
index 59fa851..d6b78ad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -652,6 +652,7 @@ menu "External python modules"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
 	source "package/python-characteristic/Config.in"
+	source "package/python-chardet/Config.in"
 	source "package/python-cheetah/Config.in"
 	source "package/python-cherrypy/Config.in"
 	source "package/python-click/Config.in"
diff --git a/package/python-chardet/Config.in b/package/python-chardet/Config.in
new file mode 100644
index 0000000..8f1cd60
--- /dev/null
+++ b/package/python-chardet/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CHARDET
+	bool "python-chardet"
+	help
+	  Universal encoding detector for Python 2 and 3.
+
+	  https://github.com/chardet/chardet
diff --git a/package/python-chardet/python-chardet.hash b/package/python-chardet/python-chardet.hash
new file mode 100644
index 0000000..aa4efeb
--- /dev/null
+++ b/package/python-chardet/python-chardet.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/chardet/json, sha256 locally computed
+md5	25274d664ccb5130adae08047416e1a8  chardet-2.3.0.tar.gz
+sha256	e53e38b3a4afe6d1132de62b7400a4ac363452dc5dfcf8d88e8e0cce663c68aa  chardet-2.3.0.tar.gz
diff --git a/package/python-chardet/python-chardet.mk b/package/python-chardet/python-chardet.mk
new file mode 100644
index 0000000..1962954
--- /dev/null
+++ b/package/python-chardet/python-chardet.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-chardet
+#
+################################################################################
+
+PYTHON_CHARDET_VERSION = 2.3.0
+PYTHON_CHARDET_SOURCE = chardet-$(PYTHON_CHARDET_VERSION).tar.gz
+PYTHON_CHARDET_SITE = https://pypi.python.org/packages/7d/87/4e3a3f38b2f5c578ce44f8dc2aa053217de9f0b6d737739b0ddac38ed237
+PYTHON_CHARDET_SETUP_TYPE = setuptools
+PYTHON_CHARDET_LICENSE = LGPLv2.1+
+PYTHON_CHARDET_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.1.4

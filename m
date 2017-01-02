From: David Bachelart <david.bachelart@bbright.com>
Date: Mon,  2 Jan 2017 11:49:22 +0100
Subject: [Buildroot] [PATCH 1/1] python-chardet: new package
In-Reply-To: <1483354166-8331-1-git-send-email-david.bachelart@bbright.com>
References: <1483354166-8331-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <1483354166-8331-5-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
 package/Config.in                          |  1 +
 package/python-chardet/Config.in           |  6 ++++++
 package/python-chardet/python-chardet.hash |  4 ++++
 package/python-chardet/python-chardet.mk   | 13 +++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-chardet/Config.in
 create mode 100644 package/python-chardet/python-chardet.hash
 create mode 100644 package/python-chardet/python-chardet.mk

diff --git a/package/Config.in b/package/Config.in
index 9ed296f..9ae351c 100644
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
index 0000000..8d7a0ee
--- /dev/null
+++ b/package/python-chardet/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CHARDET
+	bool "python-chardet"
+	help
+	  Chardet: the Universal Character Encoding Detector
+
+	  https://github.com/chardet/chardet
diff --git a/package/python-chardet/python-chardet.hash b/package/python-chardet/python-chardet.hash
new file mode 100644
index 0000000..472f77f
--- /dev/null
+++ b/package/python-chardet/python-chardet.hash
@@ -0,0 +1,4 @@
+# Locally computed
+md5 1ce646cc083a7bb07398588db5b90043    python-chardet-2.3.0.tar.gz
+sha1    d94bc88a106a6baffc2ea8a410781f635042d5b5    python-chardet-2.3.0.tar.gz
+sha256  afb95679fb687fad167a714d929d033e3dd0d64b66d3646eecf117d350ae40cc    python-chardet-2.3.0.tar.gz
diff --git a/package/python-chardet/python-chardet.mk b/package/python-chardet/python-chardet.mk
new file mode 100644
index 0000000..d405ba7
--- /dev/null
+++ b/package/python-chardet/python-chardet.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-chardet
+#
+################################################################################
+
+PYTHON_CHARDET_VERSION = 2.3.0
+PYTHON_CHARDET_SITE = $(call github,chardet,chardet,$(PYTHON_CHARDET_VERSION))
+PYTHON_CHARDET_SETUP_TYPE = setuptools
+PYTHON_CHARDET_LICENSE = GPL-2+
+PYTHON_CHARDET_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.1.4

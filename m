From: David Bachelart <david.bachelart@bbright.com>
Date: Mon,  2 Jan 2017 16:45:25 +0100
Subject: [Buildroot] [PATCH v2] python-chardet: new package
In-Reply-To: <1483371929-13907-1-git-send-email-david.bachelart@bbright.com>
References: <1483371929-13907-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <1483371929-13907-4-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
Changes v1 -> v2:
  - download source from pypi.python.org
  - use upstream MD5 sum in hash file
---
 package/Config.in                          |  1 +
 package/python-chardet/Config.in           |  6 ++++++
 package/python-chardet/python-chardet.hash |  4 ++++
 package/python-chardet/python-chardet.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
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
index 0000000..273c9e8
--- /dev/null
+++ b/package/python-chardet/python-chardet.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/chardet/json, sha1 and sha256 locally computed
+md5 25274d664ccb5130adae08047416e1a8    chardet-2.3.0.tar.gz
+sha1    50af8f8771ecbeb7a22567129c6c281b8bec3b1c    chardet-2.3.0.tar.gz
+sha256  e53e38b3a4afe6d1132de62b7400a4ac363452dc5dfcf8d88e8e0cce663c68aa    chardet-2.3.0.tar.gz
diff --git a/package/python-chardet/python-chardet.mk b/package/python-chardet/python-chardet.mk
new file mode 100644
index 0000000..5cec4ae
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
+PYTHON_CHARDET_LICENSE = GPL-2+
+PYTHON_CHARDET_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.1.4

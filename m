From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Thu, 11 Dec 2014 21:04:31 +0100
Subject: [Buildroot] [PATCH] python-markdown: add new package
Message-ID: <1418328271-30112-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/Config.in                          |  1 +
 package/python-markdown/Config.in          |  6 ++++++
 package/python-markdown/python-markdown.mk | 15 +++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/python-markdown/Config.in
 create mode 100644 package/python-markdown/python-markdown.mk

diff --git a/package/Config.in b/package/Config.in
index f41e332..f62c787 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -510,6 +510,7 @@ menu "external python modules"
 	source "package/python-keyring/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-mad/Config.in"
+	source "package/python-markdown/Config.in"
 	source "package/python-markupsafe/Config.in"
 	source "package/python-meld3/Config.in"
 	source "package/python-msgpack/Config.in"
diff --git a/package/python-markdown/Config.in b/package/python-markdown/Config.in
new file mode 100644
index 0000000..e5e164e
--- /dev/null
+++ b/package/python-markdown/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_MARKDOWN
+	bool "python-markdown"
+	help
+	  This is a Python implementation of John Gruber's Markdown 
+
+	  https://pypi.python.org/pypi/Markdown
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
new file mode 100644
index 0000000..28d9a07
--- /dev/null
+++ b/package/python-markdown/python-markdown.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-markdown
+#
+################################################################################
+
+PYTHON_MARKDOWN_VERSION = 2.5.2
+PYTHON_MARKDOWN_SOURCE = Markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
+PYTHON_MARKDOWN_SITE = http://pypi.python.org/packages/source/M/Markdown
+PYTHON_MARKDOWN_LICENSE = BSD License
+PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
+PYTHON_MARKDOWN_SETUP_TYPE = distutils
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.0.4

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 21:56:36 +0100
Subject: [Buildroot] [git commit] python-markdown: new package
Message-ID: <20141221205922.5558380555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1b0554172dd2d493ae39d9a4ed3467abc6740bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - Remove host variant of python-markdown, as it is not needed.
 - Add runtime dependency on Python XML module.]

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |    1 +
 package/python-markdown/Config.in          |    9 +++++++++
 package/python-markdown/python-markdown.mk |   14 ++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 52a0bc7..e27a804 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -512,6 +512,7 @@ menu "external python modules"
 	source "package/python-keyring/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-mad/Config.in"
+	source "package/python-markdown/Config.in"
 	source "package/python-markupsafe/Config.in"
 	source "package/python-meld3/Config.in"
 	source "package/python-msgpack/Config.in"
diff --git a/package/python-markdown/Config.in b/package/python-markdown/Config.in
new file mode 100644
index 0000000..6706684
--- /dev/null
+++ b/package/python-markdown/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_MARKDOWN
+	bool "python-markdown"
+	# runtime dependency on Python's xml module
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
+	help
+	  This is a Python implementation of John Gruber's Markdown
+
+	  https://pypi.python.org/pypi/Markdown
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
new file mode 100644
index 0000000..864825e
--- /dev/null
+++ b/package/python-markdown/python-markdown.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-markdown
+#
+################################################################################
+
+PYTHON_MARKDOWN_VERSION = 2.5.2
+PYTHON_MARKDOWN_SOURCE = Markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
+PYTHON_MARKDOWN_SITE = http://pypi.python.org/packages/source/M/Markdown
+PYTHON_MARKDOWN_LICENSE = BSD-3c
+PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
+PYTHON_MARKDOWN_SETUP_TYPE = distutils
+
+$(eval $(python-package))

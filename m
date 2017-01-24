From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 22:46:38 +1300
Subject: [Buildroot] [git commit] python-markdown2: new package
Message-ID: <20170124094816.4C03281A1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27cf5fc742655f260e2b17f5ba03ff766e585513
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                              |  1 +
 package/python-markdown2/Config.in             |  6 ++++++
 package/python-markdown2/python-markdown2.hash |  2 ++
 package/python-markdown2/python-markdown2.mk   | 13 +++++++++++++
 4 files changed, 22 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a3bd1d1..16d84fe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -714,6 +714,7 @@ menu "External python modules"
 	source "package/python-mad/Config.in"
 	source "package/python-mako/Config.in"
 	source "package/python-markdown/Config.in"
+	source "package/python-markdown2/Config.in"
 	source "package/python-markupsafe/Config.in"
 	source "package/python-mbstrdecoder/Config.in"
 	source "package/python-meld3/Config.in"
diff --git a/package/python-markdown2/Config.in b/package/python-markdown2/Config.in
new file mode 100644
index 0000000..8fe2332
--- /dev/null
+++ b/package/python-markdown2/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_MARKDOWN2
+	bool "python-markdown2"
+	help
+	  A fast and complete Python implementation of Markdown.
+
+	  https://github.com/trentm/python-markdown2
diff --git a/package/python-markdown2/python-markdown2.hash b/package/python-markdown2/python-markdown2.hash
new file mode 100644
index 0000000..17ae7d9
--- /dev/null
+++ b/package/python-markdown2/python-markdown2.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	07e077f5d4aa5f1e2f061f9f94d9e22f9ea266411b8c557b9164fc0e6dff0595  python-markdown2-2.3.2.tar.gz
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
new file mode 100644
index 0000000..1e343b4
--- /dev/null
+++ b/package/python-markdown2/python-markdown2.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-markdown2
+#
+################################################################################
+
+PYTHON_MARKDOWN2_VERSION = 2.3.2
+PYTHON_MARKDOWN2_SITE = $(call github,trentm,python-markdown2,$(PYTHON_MARKDOWN2_VERSION))
+PYTHON_MARKDOWN2_SETUP_TYPE = distutils
+PYTHON_MARKDOWN2_LICENSE = MIT
+PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))

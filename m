From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  6 Jul 2016 09:18:16 +0200
Subject: [Buildroot] [PATCH] python-humanize: new package
Message-ID: <1467789496-20404-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                            |  1 +
 package/python-humanize/Config.in            |  9 +++++++++
 package/python-humanize/python-humanize.hash |  3 +++
 package/python-humanize/python-humanize.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-humanize/Config.in
 create mode 100644 package/python-humanize/python-humanize.hash
 create mode 100644 package/python-humanize/python-humanize.mk

diff --git a/package/Config.in b/package/Config.in
index 15271a2..ff625b8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -664,6 +664,7 @@ menu "External python modules"
 	source "package/python-gobject/Config.in"
 	source "package/python-html5lib/Config.in"
 	source "package/python-httplib2/Config.in"
+	source "package/python-humanize/Config.in"
 	source "package/python-id3/Config.in"
 	source "package/python-idna/Config.in"
 	source "package/python-iniparse/Config.in"
diff --git a/package/python-humanize/Config.in b/package/python-humanize/Config.in
new file mode 100644
index 0000000..f4f4e67
--- /dev/null
+++ b/package/python-humanize/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_HUMANIZE
+	bool "python-humanize"
+	help
+	  Python humanize package contains various common humanization
+	  utilities, like turning a number into a fuzzy human readable
+	  duration ('3 minutes ago') or into a human readable size or
+	  throughput.
+
+	  http://github.com/jmoiron/humanize
diff --git a/package/python-humanize/python-humanize.hash b/package/python-humanize/python-humanize.hash
new file mode 100644
index 0000000..bb66e44
--- /dev/null
+++ b/package/python-humanize/python-humanize.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/humanize/json, sha256 locally computed
+md5	e8473d9dc1b220911cac2edd53b1d973  humanize-0.5.1.tar.gz
+sha256	a43f57115831ac7c70de098e6ac46ac13be00d69abbf60bdcac251344785bb19  humanize-0.5.1.tar.gz
diff --git a/package/python-humanize/python-humanize.mk b/package/python-humanize/python-humanize.mk
new file mode 100644
index 0000000..60ec82b
--- /dev/null
+++ b/package/python-humanize/python-humanize.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-humanize
+#
+################################################################################
+
+PYTHON_HUMANIZE_VERSION = 0.5.1
+PYTHON_HUMANIZE_SOURCE = humanize-$(PYTHON_HUMANIZE_VERSION).tar.gz
+PYTHON_HUMANIZE_SITE = https://pypi.python.org/packages/8c/e0/e512e4ac6d091fc990bbe13f9e0378f34cf6eecd1c6c268c9e598dcf5bb9
+PYTHON_HUMANIZE_SETUP_TYPE = setuptools
+PYTHON_HUMANIZE_LICENSE = MIT
+PYTHON_HUMANIZE_LICENSE_FILES = LICENCE
+
+$(eval $(python-package))
-- 
2.8.1

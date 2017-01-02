From: David Bachelart <david.bachelart@bbright.com>
Date: Mon,  2 Jan 2017 16:45:24 +0100
Subject: [Buildroot] [PATCH v2] python-arrow: new package
In-Reply-To: <1483371929-13907-1-git-send-email-david.bachelart@bbright.com>
References: <1483371929-13907-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <1483371929-13907-3-git-send-email-david.bachelart@bbright.com>
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
  - use MD5 sum from upstream in hash file
---
 package/Config.in                      |  1 +
 package/python-arrow/Config.in         |  7 +++++++
 package/python-arrow/python-arrow.hash |  4 ++++
 package/python-arrow/python-arrow.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-arrow/Config.in
 create mode 100644 package/python-arrow/python-arrow.hash
 create mode 100644 package/python-arrow/python-arrow.mk

diff --git a/package/Config.in b/package/Config.in
index 59fa851..caeb7f5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -643,6 +643,7 @@ if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "External python modules"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-argh/Config.in"
+	source "package/python-arrow/Config.in"
 	source "package/python-autobahn/Config.in"
 	source "package/python-backports-abc/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
diff --git a/package/python-arrow/Config.in b/package/python-arrow/Config.in
new file mode 100644
index 0000000..1332a72
--- /dev/null
+++ b/package/python-arrow/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_ARROW
+	bool "python-arrow"
+	select BR2_PACKAGE_PYTHON_DATEUTIL
+	help
+	  Better dates & times for Python
+
+	  https://github.com/crsmithdev/arrow/
diff --git a/package/python-arrow/python-arrow.hash b/package/python-arrow/python-arrow.hash
new file mode 100644
index 0000000..2bdc397
--- /dev/null
+++ b/package/python-arrow/python-arrow.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/arrow/json, sha1 and sha256 locally computed
+md5 5d00592200050ad58284d45a4ee147c6    arrow-0.10.0.tar.gz
+sha1    5e5e043ce64b03274a6083c7fcfc0ac363c3b737    arrow-0.10.0.tar.gz
+sha256  805906f09445afc1f0fc80187db8fe07670e3b25cdafa09b8d8ac264a8c0c722    arrow-0.10.0.tar.gz
diff --git a/package/python-arrow/python-arrow.mk b/package/python-arrow/python-arrow.mk
new file mode 100644
index 0000000..6ed702d
--- /dev/null
+++ b/package/python-arrow/python-arrow.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-arrow
+#
+################################################################################
+
+PYTHON_ARROW_VERSION = 0.10.0
+PYTHON_ARROW_SOURCE = arrow-$(PYTHON_ARROW_VERSION).tar.gz
+PYTHON_ARROW_SITE = https://pypi.python.org/packages/54/db/76459c4dd3561bbe682619a5c576ff30c42e37c2e01900ed30a501957150
+PYTHON_ARROW_DEPENDENCIES = python-dateutil
+PYTHON_ARROW_SETUP_TYPE = setuptools
+PYTHON_ARROW_LICENSE = Apache-2.0
+PYTHON_ARROW_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.1.4

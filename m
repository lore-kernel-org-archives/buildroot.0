From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Jan 2017 21:34:10 +0100
Subject: [Buildroot] [git commit] python-arrow: new package
Message-ID: <20170108203503.08A3A81845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=011db6e6bda3d2e3341600c7df68d74b6457c058
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                      |  1 +
 package/python-arrow/Config.in         |  7 +++++++
 package/python-arrow/python-arrow.hash |  3 +++
 package/python-arrow/python-arrow.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index b0ff11f..8e03b30 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -644,6 +644,7 @@ if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "External python modules"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-argh/Config.in"
+	source "package/python-arrow/Config.in"
 	source "package/python-autobahn/Config.in"
 	source "package/python-backports-abc/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
diff --git a/package/python-arrow/Config.in b/package/python-arrow/Config.in
new file mode 100644
index 0000000..2449568
--- /dev/null
+++ b/package/python-arrow/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_ARROW
+	bool "python-arrow"
+	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	help
+	  Better dates and times for Python.
+
+	  https://github.com/crsmithdev/arrow/
diff --git a/package/python-arrow/python-arrow.hash b/package/python-arrow/python-arrow.hash
new file mode 100644
index 0000000..0b5076a
--- /dev/null
+++ b/package/python-arrow/python-arrow.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/arrow/json, sha256 locally computed
+md5	5d00592200050ad58284d45a4ee147c6  arrow-0.10.0.tar.gz
+sha256	805906f09445afc1f0fc80187db8fe07670e3b25cdafa09b8d8ac264a8c0c722  arrow-0.10.0.tar.gz
diff --git a/package/python-arrow/python-arrow.mk b/package/python-arrow/python-arrow.mk
new file mode 100644
index 0000000..6e2e331
--- /dev/null
+++ b/package/python-arrow/python-arrow.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-arrow
+#
+################################################################################
+
+PYTHON_ARROW_VERSION = 0.10.0
+PYTHON_ARROW_SOURCE = arrow-$(PYTHON_ARROW_VERSION).tar.gz
+PYTHON_ARROW_SITE = https://pypi.python.org/packages/54/db/76459c4dd3561bbe682619a5c576ff30c42e37c2e01900ed30a501957150
+PYTHON_ARROW_SETUP_TYPE = setuptools
+PYTHON_ARROW_LICENSE = Apache-2.0
+PYTHON_ARROW_LICENSE_FILES = LICENSE docs/_themes/COPYING.txt
+
+$(eval $(python-package))

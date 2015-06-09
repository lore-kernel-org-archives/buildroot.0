From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:58:02 +0200
Subject: [Buildroot] [git commit] package/python-can: new package
Message-ID: <20150609215956.ACD3F81D87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30d076be237cc2bce8d397deb318a91593d3089b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch provides controller area network support for Python.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |    1 +
 package/python-can/Config.in     |    6 ++++++
 package/python-can/python-can.mk |   15 +++++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 00c9ce3..e8a7d0a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -573,6 +573,7 @@ if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "external python modules"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-bottle/Config.in"
+	source "package/python-can/Config.in"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
 	source "package/python-cheetah/Config.in"
diff --git a/package/python-can/Config.in b/package/python-can/Config.in
new file mode 100644
index 0000000..6b4e0fa
--- /dev/null
+++ b/package/python-can/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CAN
+	bool "python-can"
+	help
+	  This module provides controller area network support for Python.
+
+	  https://bitbucket.org/hardbyte/python-can
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
new file mode 100644
index 0000000..8db5732
--- /dev/null
+++ b/package/python-can/python-can.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-can
+#
+################################################################################
+
+PYTHON_CAN_VERSION = ae5b6cf
+PYTHON_CAN_SITE = https://bitbucket.org/hardbyte/python-can/get/
+PYTHON_CAN_SOURCE = $(PYTHON_CAN_VERSION).tar.bz2
+PYTHON_CAN_LICENSE = LGPLv3
+PYTHON_CAN_LICENSE_FILES = LICENSE.txt
+PYTHON_CAN_DEPENDENCIES = python
+PYTHON_CAN_SETUP_TYPE = setuptools
+
+$(eval $(python-package))

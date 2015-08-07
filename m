From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  7 Aug 2015 12:09:41 +0200
Subject: [Buildroot] [PATCH] python-pyroute2: new package
Message-ID: <1438942181-30466-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                          |  1 +
 package/python-pyroute2/Config.in          |  7 +++++++
 package/python-pyroute2/python-pyroute2.mk | 20 ++++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/python-pyroute2/Config.in
 create mode 100644 package/python-pyroute2/python-pyroute2.mk

diff --git a/package/Config.in b/package/Config.in
index 47d14d7..3edd456 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -646,6 +646,7 @@ menu "external python modules"
 	source "package/python-pypcap/Config.in"
 	source "package/python-pyqt/Config.in"
 	source "package/python-pyro/Config.in"
+	source "package/python-pyroute2/Config.in"
 	source "package/python-pysendfile/Config.in"
 	source "package/python-pysnmp/Config.in"
 	source "package/python-pysnmp-apps/Config.in"
diff --git a/package/python-pyroute2/Config.in b/package/python-pyroute2/Config.in
new file mode 100644
index 0000000..068ecba
--- /dev/null
+++ b/package/python-pyroute2/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYROUTE2
+	bool "python-pyroute2"
+	help
+	  Python netlink library - Linux network / netns / wireless / ipset
+	  configuration.
+
+	  https://github.com/svinota/pyroute2
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
new file mode 100644
index 0000000..8cbefb7
--- /dev/null
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# python-pyroute2
+#
+#############################################################
+
+PYTHON_PYROUTE2_VERSION = 0.3.8
+PYTHON_PYROUTE2_SITE = $(call github,svinota,pyroute2,$(PYTHON_PYROUTE2_VERSION))
+PYTHON_PYROUTE2_LICENSE = Apache-2.0, GPLv2+
+PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache.v2, LICENSE.GPL.v2
+PYTHON_PYROUTE2_SETUP_TYPE = distutils
+PYTHON_PYROUTE2_DEPENDENCIES = host-gawk
+
+define PYTHON_PYROUTE2_CREATE_SETUP_PY
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) update-version
+endef
+
+PYTHON_PYROUTE2_PRE_CONFIGURE_HOOKS += PYTHON_PYROUTE2_CREATE_SETUP_PY
+
+$(eval $(python-package))
-- 
1.9.1

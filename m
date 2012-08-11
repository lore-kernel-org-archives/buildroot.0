From: Jonathan Liu <net147@gmail.com>
Date: Sat, 11 Aug 2012 17:12:05 +1000
Subject: [Buildroot] [PATCH 1/2] python-meld3: new package
In-Reply-To: <1344669126-28921-1-git-send-email-net147@gmail.com>
References: <1344669126-28921-1-git-send-email-net147@gmail.com>
Message-ID: <1344669126-28921-2-git-send-email-net147@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 package/Config.in                    |  1 +
 package/python-meld3/Config.in       |  7 +++++++
 package/python-meld3/python-meld3.mk | 20 ++++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/python-meld3/Config.in
 create mode 100644 package/python-meld3/python-meld3.mk

diff --git a/package/Config.in b/package/Config.in
index f308de7..4d074da 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -270,6 +270,7 @@ menu "external python modules"
 source "package/python-dpkt/Config.in"
 source "package/python-id3/Config.in"
 source "package/python-mad/Config.in"
+source "package/python-meld3/Config.in"
 source "package/python-netifaces/Config.in"
 source "package/python-nfc/Config.in"
 source "package/python-pygame/Config.in"
diff --git a/package/python-meld3/Config.in b/package/python-meld3/Config.in
new file mode 100644
index 0000000..4fae967
--- /dev/null
+++ b/package/python-meld3/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MELD3
+    bool "python-meld3"
+    depends on BR2_PACKAGE_PYTHON
+    help
+      A HTML/XML templating system.
+
+      https://github.com/supervisor/meld3
diff --git a/package/python-meld3/python-meld3.mk b/package/python-meld3/python-meld3.mk
new file mode 100644
index 0000000..d35e68d
--- /dev/null
+++ b/package/python-meld3/python-meld3.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# python-meld3
+#
+#############################################################
+
+PYTHON_MELD3_VERSION = 0.6.8
+PYTHON_MELD3_SOURCE = meld3-$(PYTHON_MELD3_VERSION).tar.gz
+PYTHON_MELD3_SITE = http://pypi.python.org/packages/source/m/meld3/
+PYTHON_MELD3_DEPENDENCIES = python
+
+define PYTHON_MELD3_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYTHON_MELD3_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
-- 
1.7.11.3

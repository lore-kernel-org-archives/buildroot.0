From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Fri, 11 Oct 2013 11:13:35 +0200
Subject: [Buildroot] [PATCH] python-configobj: new package
Message-ID: <1381482816-30685-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/Config.in                            |    1 +
 package/python-configobj/Config.in           |    9 +++++++++
 package/python-configobj/python-configobj.mk |   22 ++++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/python-configobj/Config.in
 create mode 100644 package/python-configobj/python-configobj.mk

diff --git a/package/Config.in b/package/Config.in
index 41d828a..1c5743d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -388,6 +388,7 @@ source "package/python/Config.in"
 if BR2_PACKAGE_PYTHON
 menu "external python modules"
 source "package/python-bottle/Config.in"
+source "package/python-configobj/Config.in"
 source "package/python-crc16/Config.in"
 source "package/python-dpkt/Config.in"
 source "package/python-id3/Config.in"
diff --git a/package/python-configobj/Config.in b/package/python-configobj/Config.in
new file mode 100644
index 0000000..232b756
--- /dev/null
+++ b/package/python-configobj/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_CONFIGOBJ
+	bool "python-configobj"
+	help
+	  ConfigObj is a simple but powerful config file reader and writer: an ini
+	  file round tripper. Its main feature is that it is very easy to use, with
+	  a straightforward programmer's interface and a simple syntax for
+	  config files.
+
+	  http://www.voidspace.org.uk/python/configobj.html
diff --git a/package/python-configobj/python-configobj.mk b/package/python-configobj/python-configobj.mk
new file mode 100644
index 0000000..40f8864
--- /dev/null
+++ b/package/python-configobj/python-configobj.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# python-configobj
+#
+################################################################################
+
+PYTHON_CONFIGOBJ_VERSION = 4.7.2
+PYTHON_CONFIGOBJ_SOURCE = configobj-$(PYTHON_CONFIGOBJ_VERSION).tar.gz
+PYTHON_CONFIGOBJ_SITE = http://pypi.python.org/packages/source/c/configobj
+PYTHON_CONFIGOBJ_DEPENDENCIES = python
+PYTHON_CONFIGOBJ_LICENSE = BSD
+# License only mentioned in the source
+
+define PYTHON_CONFIGOBJ_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build --executable=/usr/bin/python)
+endef
+
+define PYTHON_CONFIGOBJ_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4

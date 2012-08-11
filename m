From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 22:59:02 +0200
Subject: [Buildroot] [git commit branch/next] python-meld3: new package
Message-ID: <20120811205941.E1AB397078@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ff74a535d9c5e7e7f996eb9b8d8f83f8af44f1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[thomas.petazzoni at free-electrons.com:
 Fixup indentation in the Config.in file.
 Add 'select BR2_PACKAGE_PYTHON_PYEXPAT' which is needed to get XML
 support in Python.
 Add license information.]

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/python-meld3/Config.in       |    8 ++++++++
 package/python-meld3/python-meld3.mk |   22 ++++++++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 45f0799..a9101b2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -271,6 +271,7 @@ menu "external python modules"
 source "package/python-dpkt/Config.in"
 source "package/python-id3/Config.in"
 source "package/python-mad/Config.in"
+source "package/python-meld3/Config.in"
 source "package/python-netifaces/Config.in"
 source "package/python-nfc/Config.in"
 source "package/python-pygame/Config.in"
diff --git a/package/python-meld3/Config.in b/package/python-meld3/Config.in
new file mode 100644
index 0000000..8dee723
--- /dev/null
+++ b/package/python-meld3/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_MELD3
+	bool "python-meld3"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_PYEXPAT
+	help
+	  A HTML/XML templating system.
+
+	  https://github.com/supervisor/meld3
diff --git a/package/python-meld3/python-meld3.mk b/package/python-meld3/python-meld3.mk
new file mode 100644
index 0000000..de83b28
--- /dev/null
+++ b/package/python-meld3/python-meld3.mk
@@ -0,0 +1,22 @@
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
+PYTHON_MELD3_LICENSE = ZPLv2.1
+PYTHON_MELD3_LICENSE_FILES = COPYRIGHT.txt LICENSE.txt
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

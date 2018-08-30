From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 30 Aug 2018 15:58:53 +0200
Subject: [Buildroot] [PATCH] python-zeroconf: new package
Message-ID: <20180830135853.31515-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                            |  1 +
 package/python-zeroconf/Config.in            |  8 ++++++++
 package/python-zeroconf/python-zeroconf.hash |  5 +++++
 package/python-zeroconf/python-zeroconf.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-zeroconf/Config.in
 create mode 100644 package/python-zeroconf/python-zeroconf.hash
 create mode 100644 package/python-zeroconf/python-zeroconf.mk

diff --git a/package/Config.in b/package/Config.in
index 66f303ec58..db9a54974c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1025,6 +1025,7 @@ menu "External python modules"
 	source "package/python-xlwt/Config.in"
 	source "package/python-xmltodict/Config.in"
 	source "package/python-yieldfrom/Config.in"
+	source "package/python-zeroconf/Config.in"
 	source "package/python-zope-interface/Config.in"
 endmenu
 endif
diff --git a/package/python-zeroconf/Config.in b/package/python-zeroconf/Config.in
new file mode 100644
index 0000000000..47c2a5563f
--- /dev/null
+++ b/package/python-zeroconf/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_ZEROCONF
+	bool "python-zeroconf"
+	select BR2_PACKAGE_PYTHON_NETIFACES # runtime
+	help
+	  Pure Python Multicast DNS Service Discovery Library
+	  (Bonjour/Avahi compatible).
+
+	  https://github.com/jstasiak/python-zeroconf
diff --git a/package/python-zeroconf/python-zeroconf.hash b/package/python-zeroconf/python-zeroconf.hash
new file mode 100644
index 0000000000..1677affa11
--- /dev/null
+++ b/package/python-zeroconf/python-zeroconf.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/zeroconf/json
+md5	23124285dbdfcf3cb9cca11b98216cf7  zeroconf-0.20.0.tar.gz
+sha256	6e3f1e7b5871e3d1410ac29b9fb85aafc1e2d661ed596b07a6f84559a475efcb  zeroconf-0.20.0.tar.gz
+# Locally computed sha256 checksums
+sha256	bb117c0fbd7f57f64170b690285d7df07c2371b578e3b3cd3aa2e1155ef461a0  COPYING
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
new file mode 100644
index 0000000000..b7a30326a9
--- /dev/null
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-zeroconf
+#
+################################################################################
+
+PYTHON_ZEROCONF_VERSION = 0.20.0
+PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
+PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/20/d7/418ff6c684ace0f5855ec56c66cfa99ec50443c41693b91e9abcccfa096c
+PYTHON_ZEROCONF_SETUP_TYPE = setuptools
+PYTHON_ZEROCONF_LICENSE = LGPL-2.1
+PYTHON_ZEROCONF_LICENSE_FILES = COPYING
+
+$(eval $(python-package))
-- 
2.17.0

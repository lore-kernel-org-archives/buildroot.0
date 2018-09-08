From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 23:33:58 +0200
Subject: [Buildroot] [git commit] python-zeroconf: new package
Message-ID: <20180908213352.78B6583776@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e201eaad76b30e927715ca30dd1d2fb61d85474e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: fix license, it's LGPL-2.1+, not LGPL-2.1]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                            |  1 +
 package/python-zeroconf/Config.in            |  9 +++++++++
 package/python-zeroconf/python-zeroconf.hash |  5 +++++
 package/python-zeroconf/python-zeroconf.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 0323045e57..fb4d328846 100644
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
index 0000000000..ac1acbbd8c
--- /dev/null
+++ b/package/python-zeroconf/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_ZEROCONF
+	bool "python-zeroconf"
+	depends on BR2_PACKAGE_PYTHON3
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
index 0000000000..7000a0da7a
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
+PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
+PYTHON_ZEROCONF_LICENSE_FILES = COPYING
+
+$(eval $(python-package))

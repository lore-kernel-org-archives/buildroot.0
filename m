From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Mar 2018 22:25:57 +0200
Subject: [Buildroot] [git commit] python-networkx: new package
Message-ID: <20180325204153.DBBFC83B85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f7838128376cceb5e6ca28533222bb9c7d7ac86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to add python-networkx package to buildroot. While 2.1
is the latest version, the current version of setools does not
work with versions past 1.11.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                            |  1 +
 package/python-networkx/Config.in            |  9 +++++++++
 package/python-networkx/python-networkx.hash |  4 ++++
 package/python-networkx/python-networkx.mk   | 17 +++++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index ae5a09bd5b..992d670bb8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -838,6 +838,7 @@ menu "External python modules"
 	source "package/python-netaddr/Config.in"
 	source "package/python-netifaces/Config.in"
 	source "package/python-networkmanager/Config.in"
+	source "package/python-networkx/Config.in"
 	source "package/python-nfc/Config.in"
 	source "package/python-numpy/Config.in"
 	source "package/python-oauthlib/Config.in"
diff --git a/package/python-networkx/Config.in b/package/python-networkx/Config.in
new file mode 100644
index 0000000000..0f3e86f497
--- /dev/null
+++ b/package/python-networkx/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_NETWORKX
+	bool "python-networkx"
+	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
+	help
+	  A Python package for the creation, manipulation,
+	  and study of the structure, dynamics, and
+	  functions of complex networks.
+
+	  https://pypi.python.org/pypi/networkx
diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
new file mode 100644
index 0000000000..92383e75c4
--- /dev/null
+++ b/package/python-networkx/python-networkx.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/networks/json, sha256 locally computed
+md5 6ef584a879e9163013e9a762e1cf7cd1 networkx-1.11.tar.gz
+sha256 0d0e70e10dfb47601cbb3425a00e03e2a2e97477be6f80638fef91d54dd1e4b8 networkx-1.11.tar.gz
+sha256 f4c13bf0e83bef45116ebda6c360066df6fd99610efaea9790b998c5441b0c0d LICENSE.txt
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
new file mode 100644
index 0000000000..4dfdbd5a1c
--- /dev/null
+++ b/package/python-networkx/python-networkx.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-networkx
+#
+################################################################################
+
+# The current version of setools (v4.1.1) does not work with python-networkx past v1.11
+PYTHON_NETWORKX_VERSION = 1.11
+PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
+PYTHON_NETWORKX_SITE = https://pypi.python.org/packages/c2/93/dbb41b03cf7c878a7409c8e92226531f840a423c9309ea534873a83c9192
+PYTHON_NETWORKX_LICENSE = BSD-3-Clause
+PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
+PYTHON_NETWORKX_SETUP_TYPE = setuptools
+HOST_PYTHON_NETWORKX_DEPENDENCIES = host-python-decorator
+
+$(eval $(python-package))
+$(eval $(host-python-package))

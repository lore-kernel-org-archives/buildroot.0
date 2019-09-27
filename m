From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 22:27:29 +0200
Subject: [Buildroot] [git commit] package/python-bluezero: new package
Message-ID: <20190927203235.448FD8F8BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2dbbdb7a8a85371f0927a42dd15616fa62cce051
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python library for Bluetooth Low Energy (BLE) on Linux.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-bluezero/Config.in            | 11 +++++++++++
 package/python-bluezero/python-bluezero.hash |  3 +++
 package/python-bluezero/python-bluezero.mk   | 13 +++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2764b2422b..d94c1e06f9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -987,6 +987,7 @@ F:	package/bluez5_utils-headers/
 F:	package/f2fs-tools/
 F:	package/pigpio/
 F:	package/python-aioblescan/
+F:	package/python-bluezero/
 F:	package/python-falcon/
 F:	package/python-ifaddr/
 F:	package/python-hiredis/
diff --git a/package/Config.in b/package/Config.in
index 10b441c6e1..d3f09d45c1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -842,6 +842,7 @@ menu "External python modules"
 	source "package/python-bcrypt/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bitstring/Config.in"
+	source "package/python-bluezero/Config.in"
 	source "package/python-bottle/Config.in"
 	source "package/python-brotli/Config.in"
 	source "package/python-cached-property/Config.in"
diff --git a/package/python-bluezero/Config.in b/package/python-bluezero/Config.in
new file mode 100644
index 0000000000..ed2277dc31
--- /dev/null
+++ b/package/python-bluezero/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_BLUEZERO
+	bool "python-bluezero"
+	help
+	  Python library for Bluetooth Low Energy (BLE) on Linux.
+
+	  For central.py, peripheral.py and broadcaster.py you need
+	  to enable the dbus-python and the bluez5-utils package.
+	  For observer.py, you need to enable the python-aioblescan
+	  package.
+
+	  https://github.com/ukBaz/python-bluezero
diff --git a/package/python-bluezero/python-bluezero.hash b/package/python-bluezero/python-bluezero.hash
new file mode 100644
index 0000000000..e1adcf5672
--- /dev/null
+++ b/package/python-bluezero/python-bluezero.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/bluezero/json
+md5	b13fd84a5fe98ce9526a6f513c9131b1  bluezero-0.2.0.tar.gz
+sha256	d16eb9ac048665a974ad0db312b23bfd528423000b7b2983566b853d5e0d19b6  bluezero-0.2.0.tar.gz
diff --git a/package/python-bluezero/python-bluezero.mk b/package/python-bluezero/python-bluezero.mk
new file mode 100644
index 0000000000..1271b997a9
--- /dev/null
+++ b/package/python-bluezero/python-bluezero.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-bluezero
+#
+################################################################################
+
+PYTHON_BLUEZERO_VERSION = 0.2.0
+PYTHON_BLUEZERO_SOURCE = bluezero-$(PYTHON_BLUEZERO_VERSION).tar.gz
+PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/9c/76/8f5250e119be8aff4f7ac3acb9d91589909d8650152fdf6758bfb01f9576
+PYTHON_BLUEZERO_SETUP_TYPE = setuptools
+PYTHON_BLUEZERO_LICENSE = MIT
+
+$(eval $(python-package))

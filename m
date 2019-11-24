From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Nov 2019 23:04:09 +0100
Subject: [Buildroot] [git commit branch/next] package/python-crontab: new
 package
Message-ID: <20191124215915.2564987FEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dad797a4535ec1aa38855eee4682fd267d0264b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Crontab module for reading and writing crontab files and accessing
the system cron automatically and simply using a direct API.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-crontab/Config.in           |  8 ++++++++
 package/python-crontab/python-crontab.hash |  5 +++++
 package/python-crontab/python-crontab.mk   | 13 +++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 98f67fbc96..5837bbfab2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1007,6 +1007,7 @@ F:	package/f2fs-tools/
 F:	package/pigpio/
 F:	package/python-aioblescan/
 F:	package/python-bluezero/
+F:	package/python-crontab/
 F:	package/python-falcon/
 F:	package/python-ifaddr/
 F:	package/python-hiredis/
diff --git a/package/Config.in b/package/Config.in
index 9210ec0ac8..c04626173d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -880,6 +880,7 @@ menu "External python modules"
 	source "package/python-couchdb/Config.in"
 	source "package/python-crc16/Config.in"
 	source "package/python-crcmod/Config.in"
+	source "package/python-crontab/Config.in"
 	source "package/python-crossbar/Config.in"
 	source "package/python-cryptography/Config.in"
 	source "package/python-cssselect/Config.in"
diff --git a/package/python-crontab/Config.in b/package/python-crontab/Config.in
new file mode 100644
index 0000000000..f97e00af5e
--- /dev/null
+++ b/package/python-crontab/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_CRONTAB
+	bool "python-crontab"
+	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	help
+	  Crontab module for reading and writing crontab files and accessing
+	  the system cron automatically and simply using a direct API.
+
+	  https://gitlab.com/doctormo/python-crontab/
diff --git a/package/python-crontab/python-crontab.hash b/package/python-crontab/python-crontab.hash
new file mode 100644
index 0000000000..c4f3636f5c
--- /dev/null
+++ b/package/python-crontab/python-crontab.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/python-crontab/json
+md5	e1f2ca65e0218a85c724e3d6058da2a3  python-crontab-2.4.0.tar.gz
+sha256	3ac1608ff76032e6fc6e16b5fbf83b51557e0e066bf78e9f88571571e7bd7ae6  python-crontab-2.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-crontab/python-crontab.mk b/package/python-crontab/python-crontab.mk
new file mode 100644
index 0000000000..f6bf8d7072
--- /dev/null
+++ b/package/python-crontab/python-crontab.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-crontab
+#
+################################################################################
+
+PYTHON_CRONTAB_VERSION = 2.4.0
+PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/bc/03/852f9c5f8da7f58abce06fe8ae769cbcf6502f1c60684b16bad72ffcced3
+PYTHON_CRONTAB_SETUP_TYPE = setuptools
+PYTHON_CRONTAB_LICENSE = LGPL-3.0+
+PYTHON_CRONTAB_LICENSE_FILES = COPYING
+
+$(eval $(python-package))

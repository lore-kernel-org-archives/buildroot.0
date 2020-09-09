From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed,  9 Sep 2020 12:05:48 +0200
Subject: [Buildroot] [PATCH] package/python-intelhex: new package
Message-ID: <20200909100548.898792-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-intelhex/Config.in            |  6 ++++++
 package/python-intelhex/python-intelhex.hash |  5 +++++
 package/python-intelhex/python-intelhex.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-intelhex/Config.in
 create mode 100644 package/python-intelhex/python-intelhex.hash
 create mode 100644 package/python-intelhex/python-intelhex.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b1e60e505f..f6808ec518 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1631,6 +1631,7 @@ F:	package/murata-cyw-fw/
 F:	package/netdata/
 F:	package/python-ansicolors/
 F:	package/python-iniconfig/
+F:	package/python-intelhex/
 F:	package/python-packaging/
 F:	package/python-pluggy/
 F:	package/python-pytest/
diff --git a/package/Config.in b/package/Config.in
index 17d2bd4f92..1f1fc464ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -996,6 +996,7 @@ menu "External python modules"
 	source "package/python-influxdb/Config.in"
 	source "package/python-iniconfig/Config.in"
 	source "package/python-iniparse/Config.in"
+	source "package/python-intelhex/Config.in"
 	source "package/python-iowait/Config.in"
 	source "package/python-ipaddr/Config.in"
 	source "package/python-ipaddress/Config.in"
diff --git a/package/python-intelhex/Config.in b/package/python-intelhex/Config.in
new file mode 100644
index 0000000000..20dbb8c9ca
--- /dev/null
+++ b/package/python-intelhex/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_INTELHEX
+	bool "python-intelhex"
+	help
+	  Python library for Intel HEX files manipulations.
+
+	  https://pypi.python.org/pypi/IntelHex
diff --git a/package/python-intelhex/python-intelhex.hash b/package/python-intelhex/python-intelhex.hash
new file mode 100644
index 0000000000..80674f14ae
--- /dev/null
+++ b/package/python-intelhex/python-intelhex.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/intelhex/json
+md5  9ce7402e0fd33249aef52cbf437b4ab7  intelhex-2.2.1.tar.gz
+sha256  009d8511e0d50639230c39af9607deee771cf026f67ef7507a8c3fd4fa927832  intelhex-2.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256  1b2eb032ab8a1b0266f7995c76e44509f89ca9c0e90ec507763b5e735aca7de4  LICENSE.txt
diff --git a/package/python-intelhex/python-intelhex.mk b/package/python-intelhex/python-intelhex.mk
new file mode 100644
index 0000000000..64b21270e1
--- /dev/null
+++ b/package/python-intelhex/python-intelhex.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-intelhex
+#
+################################################################################
+
+PYTHON_INTELHEX_VERSION = 2.2.1
+PYTHON_INTELHEX_SOURCE = intelhex-$(PYTHON_INTELHEX_VERSION).tar.gz
+PYTHON_INTELHEX_SITE = https://files.pythonhosted.org/packages/01/66/8fab869edcc0eaf8fc030472ff379b8eeee2ef3b42f8aec6bd84e9f735e3
+PYTHON_INTELHEX_SETUP_TYPE = distutils
+PYTHON_INTELHEX_LICENSE = BSD-3-Clause
+PYTHON_INTELHEX_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.28.0

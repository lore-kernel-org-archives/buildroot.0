From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue,  1 Sep 2020 19:16:43 +0200
Subject: [Buildroot] [PATCH v2 2/4] package/python-iniconfig: new package
In-Reply-To: <20200901171645.708587-1-m.niestroj@grinn-global.com>
References: <20200901171645.708587-1-m.niestroj@grinn-global.com>
Message-ID: <20200901171645.708587-3-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
changes v1 -> v2: added patch

 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-iniconfig/Config.in             |  6 ++++++
 package/python-iniconfig/python-iniconfig.hash |  5 +++++
 package/python-iniconfig/python-iniconfig.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-iniconfig/Config.in
 create mode 100644 package/python-iniconfig/python-iniconfig.hash
 create mode 100644 package/python-iniconfig/python-iniconfig.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1bafd26350..bdbaf551f3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1611,6 +1611,7 @@ F:	package/luaossl/
 F:	package/murata-cyw-fw/
 F:	package/netdata/
 F:	package/python-ansicolors/
+F:	package/python-iniconfig/
 F:	package/python-packaging/
 F:	package/python-pluggy/
 F:	package/rs485conf/
diff --git a/package/Config.in b/package/Config.in
index 914f2b4d33..3c5b5cb255 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -991,6 +991,7 @@ menu "External python modules"
 	source "package/python-incremental/Config.in"
 	source "package/python-inflection/Config.in"
 	source "package/python-influxdb/Config.in"
+	source "package/python-iniconfig/Config.in"
 	source "package/python-iniparse/Config.in"
 	source "package/python-iowait/Config.in"
 	source "package/python-ipaddr/Config.in"
diff --git a/package/python-iniconfig/Config.in b/package/python-iniconfig/Config.in
new file mode 100644
index 0000000000..a288da8a64
--- /dev/null
+++ b/package/python-iniconfig/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_INICONFIG
+	bool "python-iniconfig"
+	help
+	  iniconfig: brain-dead simple config-ini parsing.
+
+	  http://github.com/RonnyPfannschmidt/iniconfig
diff --git a/package/python-iniconfig/python-iniconfig.hash b/package/python-iniconfig/python-iniconfig.hash
new file mode 100644
index 0000000000..708c0553ac
--- /dev/null
+++ b/package/python-iniconfig/python-iniconfig.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/iniconfig/json
+md5  464179a74789d033b170101f6aa38c2a  iniconfig-1.0.1.tar.gz
+sha256  e5f92f89355a67de0595932a6c6c02ab4afddc6fcdc0bfc5becd0d60884d3f69  iniconfig-1.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256  2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866  LICENSE
diff --git a/package/python-iniconfig/python-iniconfig.mk b/package/python-iniconfig/python-iniconfig.mk
new file mode 100644
index 0000000000..57f31c4194
--- /dev/null
+++ b/package/python-iniconfig/python-iniconfig.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-iniconfig
+#
+################################################################################
+
+PYTHON_INICONFIG_VERSION = 1.0.1
+PYTHON_INICONFIG_SOURCE = iniconfig-$(PYTHON_INICONFIG_VERSION).tar.gz
+PYTHON_INICONFIG_SITE = https://files.pythonhosted.org/packages/aa/6e/60dafce419de21f2f3f29319114808cac9f49b6c15117a419737a4ce3813
+PYTHON_INICONFIG_SETUP_TYPE = setuptools
+PYTHON_INICONFIG_LICENSE = MIT
+PYTHON_INICONFIG_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.28.0

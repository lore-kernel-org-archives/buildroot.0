From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 22:01:56 +0200
Subject: [Buildroot] [git commit] package/python-iptables: new package
Message-ID: <20190620200119.8BE4781509@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7ad8d7879aba739ebba0df63bb6ce9461cda2d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides Python bindings for iptables.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Thomas: add license file]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-iptables/Config.in            |  7 +++++++
 package/python-iptables/python-iptables.hash |  5 +++++
 package/python-iptables/python-iptables.mk   | 13 +++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 10e97ed53c..b416cd45e8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1527,6 +1527,7 @@ F:	package/protobuf-c/
 F:	package/protobuf/
 F:	package/python-colorama/
 F:	package/python-flask-cors/
+F:	package/python-iptables/
 F:	package/python-ipy/
 F:	package/python-posix-ipc/
 F:	package/python-pypcap/
diff --git a/package/Config.in b/package/Config.in
index 9130140868..07edde8d42 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -914,6 +914,7 @@ menu "External python modules"
 	source "package/python-iowait/Config.in"
 	source "package/python-ipaddr/Config.in"
 	source "package/python-ipaddress/Config.in"
+	source "package/python-iptables/Config.in"
 	source "package/python-ipy/Config.in"
 	source "package/python-ipython/Config.in"
 	source "package/python-ipython-genutils/Config.in"
diff --git a/package/python-iptables/Config.in b/package/python-iptables/Config.in
new file mode 100644
index 0000000000..e55359963e
--- /dev/null
+++ b/package/python-iptables/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_IPTABLES
+	bool "python-iptables"
+	select BR2_PACKAGE_IPTABLES # runtime dependency
+	help
+	  Python bindings for iptables.
+
+	  https://github.com/ldx/python-iptables
diff --git a/package/python-iptables/python-iptables.hash b/package/python-iptables/python-iptables.hash
new file mode 100644
index 0000000000..3c83a15b8c
--- /dev/null
+++ b/package/python-iptables/python-iptables.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/python-iptables/json
+md5	3761a77c28ca0adc69f4e0e11af2f321  python-iptables-0.13.0.tar.gz
+sha256	53b09257467681d7ea547cd3140eccd8c70effb3748af4b56ffed2f6011189e7  python-iptables-0.13.0.tar.gz
+# Locally calculated
+sha256  b827789c74144d9bb92595ed3bc568aef767a7e8d930fba61c2cdd9f6ec27599  NOTICE
diff --git a/package/python-iptables/python-iptables.mk b/package/python-iptables/python-iptables.mk
new file mode 100644
index 0000000000..4aed474e39
--- /dev/null
+++ b/package/python-iptables/python-iptables.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-iptables
+#
+################################################################################
+
+PYTHON_IPTABLES_VERSION = 0.13.0
+PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/6e/3a/866f5b1bccc6a4d94811f84304d700da14518ff55b80e08ff2241b3221bf
+PYTHON_IPTABLES_SETUP_TYPE = setuptools
+PYTHON_IPTABLES_LICENSE = Apache-2.0
+PYTHON_IPTABLES_LICENSE_FILES = NOTICE
+
+$(eval $(python-package))

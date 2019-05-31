From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 31 May 2019 12:16:50 -0500
Subject: [Buildroot] [PATCH 2/6] package/python-iptables: new package
In-Reply-To: <20190531171654.17906-1-matthew.weber@rockwellcollins.com>
References: <20190531171654.17906-1-matthew.weber@rockwellcollins.com>
Message-ID: <20190531171654.17906-2-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides Python bindings for iptables.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-iptables/Config.in            |  7 +++++++
 package/python-iptables/python-iptables.hash |  3 +++
 package/python-iptables/python-iptables.mk   | 12 ++++++++++++
 5 files changed, 24 insertions(+)
 create mode 100644 package/python-iptables/Config.in
 create mode 100644 package/python-iptables/python-iptables.hash
 create mode 100644 package/python-iptables/python-iptables.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ddab99c9de..0aa5b1754d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1520,6 +1520,7 @@ F:	package/protobuf-c/
 F:	package/protobuf/
 F:	package/python-colorama/
 F:	package/python-flask-cors/
+F:	package/python-iptables/
 F:	package/python-ipy/
 F:	package/python-posix-ipc/
 F:	package/python-pypcap/
diff --git a/package/Config.in b/package/Config.in
index 0c784eac0e..13b43ec0dd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -909,6 +909,7 @@ menu "External python modules"
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
index 0000000000..fffc38bae7
--- /dev/null
+++ b/package/python-iptables/python-iptables.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/python-iptables/json
+md5	3761a77c28ca0adc69f4e0e11af2f321  python-iptables-0.13.0.tar.gz
+sha256	53b09257467681d7ea547cd3140eccd8c70effb3748af4b56ffed2f6011189e7  python-iptables-0.13.0.tar.gz
diff --git a/package/python-iptables/python-iptables.mk b/package/python-iptables/python-iptables.mk
new file mode 100644
index 0000000000..c431c457cc
--- /dev/null
+++ b/package/python-iptables/python-iptables.mk
@@ -0,0 +1,12 @@
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
+
+$(eval $(python-package))
-- 
2.17.1

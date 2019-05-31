From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 31 May 2019 12:16:53 -0500
Subject: [Buildroot] [PATCH 5/6] package/python-txdbus: new package
In-Reply-To: <20190531171654.17906-1-matthew.weber@rockwellcollins.com>
References: <20190531171654.17906-1-matthew.weber@rockwellcollins.com>
Message-ID: <20190531171654.17906-5-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Implements a native Python implementation of DBus for Twisted.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-txdbus/Config.in          |  9 +++++++++
 package/python-txdbus/python-txdbus.hash |  3 +++
 package/python-txdbus/python-txdbus.mk   | 13 +++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-txdbus/Config.in
 create mode 100644 package/python-txdbus/python-txdbus.hash
 create mode 100644 package/python-txdbus/python-txdbus.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b53e98259f..3ca48deff6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1527,6 +1527,7 @@ F:	package/python-pycairo/
 F:	package/python-pypcap/
 F:	package/python-pyrex/
 F:	package/python-tinyrpc/
+F:	package/python-txdbus/
 F:	package/raptor/
 F:	package/rcw/
 F:	package/rng-tools/
diff --git a/package/Config.in b/package/Config.in
index 0080cdd625..e68defd5f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1078,6 +1078,7 @@ menu "External python modules"
 	source "package/python-treq/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-txaio/Config.in"
+	source "package/python-txdbus/Config.in"
 	source "package/python-txtorcon/Config.in"
 	source "package/python-typepy/Config.in"
 	source "package/python-typing/Config.in"
diff --git a/package/python-txdbus/Config.in b/package/python-txdbus/Config.in
new file mode 100644
index 0000000000..f38bbf93f0
--- /dev/null
+++ b/package/python-txdbus/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_TXDBUS
+	bool "python-txdbus"
+	select BR2_PACKAGE_PYTHON_TWISTED # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  A native Python implementation of the DBus protocol for
+	  Twisted applications.
+
+	  https://github.com/cocagne/txdbus
diff --git a/package/python-txdbus/python-txdbus.hash b/package/python-txdbus/python-txdbus.hash
new file mode 100644
index 0000000000..38760fada6
--- /dev/null
+++ b/package/python-txdbus/python-txdbus.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/txdbus/json
+md5	f17c9204c7f56365c297ba68e6840900  txdbus-1.1.0.tar.gz
+sha256	6ff57f42c58d935956024b3c6824c1019db7d233d0af86aa0573b73b63b0817c  txdbus-1.1.0.tar.gz
diff --git a/package/python-txdbus/python-txdbus.mk b/package/python-txdbus/python-txdbus.mk
new file mode 100644
index 0000000000..08429baac8
--- /dev/null
+++ b/package/python-txdbus/python-txdbus.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-txdbus
+#
+################################################################################
+
+PYTHON_TXDBUS_VERSION = 1.1.0
+PYTHON_TXDBUS_SOURCE = txdbus-$(PYTHON_TXDBUS_VERSION).tar.gz
+PYTHON_TXDBUS_SITE = https://files.pythonhosted.org/packages/8e/7c/0b8726b82943ae99dc71b8fe20e2e0beb7feb4ef61105865021a64f08b16
+PYTHON_TXDBUS_SETUP_TYPE = setuptools
+PYTHON_TXDBUS_LICENSE = MIT
+
+$(eval $(python-package))
-- 
2.17.1

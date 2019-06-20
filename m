From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 22:19:58 +0200
Subject: [Buildroot] [git commit] package/python-txdbus: new package
Message-ID: <20190620202200.ACD41821B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=113e118ec85eda111ef52ac08e91f2072a4aa39b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Implements a native Python implementation of DBus for Twisted.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-txdbus/Config.in          |  9 +++++++++
 package/python-txdbus/python-txdbus.hash |  3 +++
 package/python-txdbus/python-txdbus.mk   | 13 +++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 470ee31a21..32fa00fdd9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1533,6 +1533,7 @@ F:	package/python-posix-ipc/
 F:	package/python-pypcap/
 F:	package/python-pyrex/
 F:	package/python-tinyrpc/
+F:	package/python-txdbus/
 F:	package/raptor/
 F:	package/rcw/
 F:	package/rng-tools/
diff --git a/package/Config.in b/package/Config.in
index c1056e0c79..9628243751 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1083,6 +1083,7 @@ menu "External python modules"
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

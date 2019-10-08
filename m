From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue,  8 Oct 2019 10:28:01 +0300
Subject: [Buildroot] [PATCH 2/2] package/python-snmpclitools: new package
In-Reply-To: <20191008072801.3745-1-asafka7@gmail.com>
References: <20191008072801.3745-1-asafka7@gmail.com>
Message-ID: <20191008072801.3745-3-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For now, we use PKG-INFO as license file, since LICENSE.rst isn't
provided with the tarball.
A pull request was sent upstream:
https://github.com/etingof/snmpclitools/pull/11

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-snmpclitools/Config.in              |  8 ++++++++
 .../python-snmpclitools/python-snmpclitools.hash   |  5 +++++
 package/python-snmpclitools/python-snmpclitools.mk | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-snmpclitools/Config.in
 create mode 100644 package/python-snmpclitools/python-snmpclitools.hash
 create mode 100644 package/python-snmpclitools/python-snmpclitools.mk

diff --git a/package/Config.in b/package/Config.in
index d8d0824c71..676c8b9352 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1085,6 +1085,7 @@ menu "External python modules"
 	source "package/python-six/Config.in"
 	source "package/python-slob/Config.in"
 	source "package/python-smbus-cffi/Config.in"
+	source "package/python-snmpclitools/Config.in"
 	source "package/python-socketio/Config.in"
 	source "package/python-sortedcontainers/Config.in"
 	source "package/python-spidev/Config.in"
diff --git a/package/python-snmpclitools/Config.in b/package/python-snmpclitools/Config.in
new file mode 100644
index 0000000000..945aece84d
--- /dev/null
+++ b/package/python-snmpclitools/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SNMPCLITOOLS
+	bool "python-snmpclitools"
+	select BR2_PACKAGE_PYTHON_PYSMI # runtime
+	select BR2_PACKAGE_PYTHON_PYSNMP # runtime
+	help
+	  SNMP command-line tools.
+
+	  https://github.com/etingof/snmpclitools
diff --git a/package/python-snmpclitools/python-snmpclitools.hash b/package/python-snmpclitools/python-snmpclitools.hash
new file mode 100644
index 0000000000..4dcbdcb6e0
--- /dev/null
+++ b/package/python-snmpclitools/python-snmpclitools.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/snmpclitools/json
+md5	132b100f5e7b80715e6c1d424e89687c  snmpclitools-0.6.4.tar.gz
+sha256	820c45de419bf355c845a96610a395ec18a15176ac0362d388da7740266ea1ac  snmpclitools-0.6.4.tar.gz
+# Locally computed sha256 checksums
+sha256	ed5561a0f5b75e93aa026c1b9fdef58e7ccbf6b2e9a2458be732afc288209d23  PKG-INFO
diff --git a/package/python-snmpclitools/python-snmpclitools.mk b/package/python-snmpclitools/python-snmpclitools.mk
new file mode 100644
index 0000000000..0794e8ecf3
--- /dev/null
+++ b/package/python-snmpclitools/python-snmpclitools.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-snmpclitools
+#
+################################################################################
+
+PYTHON_SNMPCLITOOLS_VERSION = 0.6.4
+PYTHON_SNMPCLITOOLS_SOURCE = snmpclitools-$(PYTHON_SNMPCLITOOLS_VERSION).tar.gz
+PYTHON_SNMPCLITOOLS_SITE = https://files.pythonhosted.org/packages/03/2a/8488828e92a82c5416e33fba6089283162937b0f73e5b15205fb6ec3bbea
+PYTHON_SNMPCLITOOLS_SETUP_TYPE = setuptools
+PYTHON_SNMPCLITOOLS_LICENSE = BSD-2-Clause
+PYTHON_SNMPCLITOOLS_LICENSE_FILES = PKG-INFO
+
+$(eval $(python-package))
-- 
2.20.1

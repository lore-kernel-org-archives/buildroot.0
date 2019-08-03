From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 00:22:37 +0200
Subject: [Buildroot] [git commit] package/python-ifaddr: new package
Message-ID: <20190803221949.49F268DFA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ade7bfcddefec08b1131e68d2116d74ba8a1a38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enumerates all IP addresses on all network adapters of the system.

https://github.com/pydron/ifaddr

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
[Thomas: add license file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-ifaddr/Config.in          |  7 +++++++
 package/python-ifaddr/python-ifaddr.hash |  5 +++++
 package/python-ifaddr/python-ifaddr.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 44e3ae02af..8a83f748d1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -970,6 +970,7 @@ F:	package/f2fs-tools/
 F:	package/pigpio/
 F:	package/python-aioblescan/
 F:	package/python-falcon/
+F:	package/python-ifaddr/
 F:	package/python-mimeparse/
 F:	package/python-pigpio/
 F:	package/python-pyjwt/
diff --git a/package/Config.in b/package/Config.in
index 851809d80c..f84effff01 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -911,6 +911,7 @@ menu "External python modules"
 	source "package/python-ibmiotf/Config.in"
 	source "package/python-id3/Config.in"
 	source "package/python-idna/Config.in"
+	source "package/python-ifaddr/Config.in"
 	source "package/python-incremental/Config.in"
 	source "package/python-inflection/Config.in"
 	source "package/python-influxdb/Config.in"
diff --git a/package/python-ifaddr/Config.in b/package/python-ifaddr/Config.in
new file mode 100644
index 0000000000..64e9a3aad5
--- /dev/null
+++ b/package/python-ifaddr/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_IFADDR
+	bool "python-ifaddr"
+	help
+	  Enumerates all IP addresses on all network adapters of the
+	  system.
+
+	  https://github.com/pydron/ifaddr
diff --git a/package/python-ifaddr/python-ifaddr.hash b/package/python-ifaddr/python-ifaddr.hash
new file mode 100644
index 0000000000..18df40ac4c
--- /dev/null
+++ b/package/python-ifaddr/python-ifaddr.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/ifaddr/json
+md5	cc1b7f0a587ef38491f07e50bf91d82e  ifaddr-0.1.6.tar.gz
+sha256	c19c64882a7ad51a394451dabcbbed72e98b5625ec1e79789924d5ea3e3ecb93  ifaddr-0.1.6.tar.gz
+# Locally calculated
+sha256	926c6fdac9ede91ae54c67066597466b04f9b4f956a24f9c77931e7765607b2c  setup.py
diff --git a/package/python-ifaddr/python-ifaddr.mk b/package/python-ifaddr/python-ifaddr.mk
new file mode 100644
index 0000000000..23c4ee365e
--- /dev/null
+++ b/package/python-ifaddr/python-ifaddr.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-ifaddr
+#
+################################################################################
+
+PYTHON_IFADDR_VERSION = 0.1.6
+PYTHON_IFADDR_SOURCE = ifaddr-$(PYTHON_IFADDR_VERSION).tar.gz
+PYTHON_IFADDR_SITE = https://files.pythonhosted.org/packages/9f/54/d92bda685093ebc70e2057abfa83ef1b3fb0ae2b6357262a3e19dfe96bb8
+PYTHON_IFADDR_SETUP_TYPE = setuptools
+PYTHON_IFADDR_LICENSE = MIT
+PYTHON_IFADDR_LICENSE_FILES = setup.py
+
+$(eval $(python-package))

From: Grzegorz Blach <grzegorz@blach.pl>
Date: Fri,  5 Jul 2019 11:57:11 +0000
Subject: [Buildroot] [PATCH 1/2] package/python-ifaddr: new package
Message-ID: <20190705115712.18252-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enumerates all IP addresses on all network adapters of the system.

https://github.com/pydron/ifaddr

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-ifaddr/Config.in          |  7 +++++++
 package/python-ifaddr/python-ifaddr.hash |  3 +++
 package/python-ifaddr/python-ifaddr.mk   | 13 +++++++++++++
 5 files changed, 25 insertions(+)
 create mode 100644 package/python-ifaddr/Config.in
 create mode 100644 package/python-ifaddr/python-ifaddr.hash
 create mode 100644 package/python-ifaddr/python-ifaddr.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e9c521f400..b63799f16e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -959,6 +959,7 @@ F:	package/f2fs-tools/
 F:	package/pigpio/
 F:	package/python-aioblescan/
 F:	package/python-falcon/
+F:	package/python-ifaddr/
 F:	package/python-mimeparse/
 F:	package/python-pigpio/
 F:	package/python-pyjwt/
diff --git a/package/Config.in b/package/Config.in
index d501b5a65b..94fce52bfc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -908,6 +908,7 @@ menu "External python modules"
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
index 0000000000..ccb3682608
--- /dev/null
+++ b/package/python-ifaddr/python-ifaddr.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/ifaddr/json
+md5	cc1b7f0a587ef38491f07e50bf91d82e  ifaddr-0.1.6.tar.gz
+sha256	c19c64882a7ad51a394451dabcbbed72e98b5625ec1e79789924d5ea3e3ecb93  ifaddr-0.1.6.tar.gz
diff --git a/package/python-ifaddr/python-ifaddr.mk b/package/python-ifaddr/python-ifaddr.mk
new file mode 100644
index 0000000000..419e3f1838
--- /dev/null
+++ b/package/python-ifaddr/python-ifaddr.mk
@@ -0,0 +1,13 @@
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
+
+$(eval $(python-package))
-- 
2.22.0

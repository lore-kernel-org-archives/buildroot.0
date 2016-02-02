From: Mauro Condarelli <mc5686@mclink.it>
Date: Tue,  2 Feb 2016 01:44:47 +0100
Subject: [Buildroot] [PATCH 07/19] python-netaddr: new package
In-Reply-To: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
References: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454373899-22481-8-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in                          |  1 +
 package/python-netaddr/Config.in           |  7 +++++++
 package/python-netaddr/python-netaddr.hash |  3 +++
 package/python-netaddr/python-netaddr.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-netaddr/Config.in
 create mode 100644 package/python-netaddr/python-netaddr.hash
 create mode 100644 package/python-netaddr/python-netaddr.mk

diff --git a/package/Config.in b/package/Config.in
index 80a4201..9b6e6bc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -667,6 +667,7 @@ menu "External python modules"
 	source "package/python-meld3/Config.in"
 	source "package/python-mistune/Config.in"
 	source "package/python-msgpack/Config.in"
+	source "package/python-netaddr/Config.in"
 	source "package/python-netifaces/Config.in"
 	source "package/python-networkmanager/Config.in"
 	source "package/python-nfc/Config.in"
diff --git a/package/python-netaddr/Config.in b/package/python-netaddr/Config.in
new file mode 100644
index 0000000..8e58a34
--- /dev/null
+++ b/package/python-netaddr/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_NETADDR
+	bool "python-netaddr"
+	help
+	  A network address manipulation library for Python.
+
+	  https://pypi.python.org/pypi/netaddr
+
diff --git a/package/python-netaddr/python-netaddr.hash b/package/python-netaddr/python-netaddr.hash
new file mode 100644
index 0000000..5fcdda4
--- /dev/null
+++ b/package/python-netaddr/python-netaddr.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=c65bb34f8bedfbbca0b316c490cd13a0, sha256 locally computed.
+md5	c65bb34f8bedfbbca0b316c490cd13a0  netaddr-0.7.18.tar.gz
+sha256	a1f5c9fcf75ac2579b9995c843dade33009543c04f218ff7c007b3c81695bd19  netaddr-0.7.18.tar.gz
diff --git a/package/python-netaddr/python-netaddr.mk b/package/python-netaddr/python-netaddr.mk
new file mode 100644
index 0000000..2a4e40c
--- /dev/null
+++ b/package/python-netaddr/python-netaddr.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-netaddr
+#
+################################################################################
+
+PYTHON_NETADDR_VERSION = 0.7.18
+PYTHON_NETADDR_SOURCE = netaddr-$(PYTHON_NETADDR_VERSION).tar.gz
+PYTHON_NETADDR_SITE = http://pypi.python.org/packages/source/n/netaddr
+PYTHON_NETADDR_LICENSE = BSD
+PYTHON_NETADDR_LICENSE_FILES = LICENSE
+PYTHON_NETADDR_SETUP_TYPE = distutils
+
+$(eval $(python-package))
-- 
2.1.4

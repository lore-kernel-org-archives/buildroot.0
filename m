From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 24 Dec 2015 22:30:37 +0100
Subject: [Buildroot] [PATCH 1/5] python-ipaddress: new package
Message-ID: <1450992641-8618-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                              |  1 +
 package/python-ipaddress/Config.in             |  7 +++++++
 package/python-ipaddress/python-ipaddress.hash |  3 +++
 package/python-ipaddress/python-ipaddress.mk   | 13 +++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/python-ipaddress/Config.in
 create mode 100644 package/python-ipaddress/python-ipaddress.hash
 create mode 100644 package/python-ipaddress/python-ipaddress.mk

diff --git a/package/Config.in b/package/Config.in
index de0ad5e..e2f387d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -639,6 +639,7 @@ menu "External python modules"
 	source "package/python-id3/Config.in"
 	source "package/python-idna/Config.in"
 	source "package/python-ipaddr/Config.in"
+	source "package/python-ipaddress/Config.in"
 	source "package/python-ipy/Config.in"
 	source "package/python-ipython/Config.in"
 	source "package/python-itsdangerous/Config.in"
diff --git a/package/python-ipaddress/Config.in b/package/python-ipaddress/Config.in
new file mode 100644
index 0000000..b2b9f0b
--- /dev/null
+++ b/package/python-ipaddress/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_IPADDRESS
+	bool "python-ipaddress"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Python 3.3's ipaddress for older Python versions.
+
+	  https://github.com/phihag/ipaddress
diff --git a/package/python-ipaddress/python-ipaddress.hash b/package/python-ipaddress/python-ipaddress.hash
new file mode 100644
index 0000000..21bc373
--- /dev/null
+++ b/package/python-ipaddress/python-ipaddress.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=12915e923b738107e47827478d553ba1, sha256 locally computed
+md5     12915e923b738107e47827478d553ba1  ipaddress-1.0.15.tar.gz
+sha256  af6c85cfc9cdb12b861655e6b9f2f59618bf3088cbde858727b2c0a98e9f6636  ipaddress-1.0.15.tar.gz
diff --git a/package/python-ipaddress/python-ipaddress.mk b/package/python-ipaddress/python-ipaddress.mk
new file mode 100644
index 0000000..8019aa8
--- /dev/null
+++ b/package/python-ipaddress/python-ipaddress.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-ipaddress
+#
+################################################################################
+
+PYTHON_IPADDRESS_VERSION = 1.0.15
+PYTHON_IPADDRESS_SOURCE = ipaddress-$(PYTHON_IPADDRESS_VERSION).tar.gz
+PYTHON_IPADDRESS_SITE = https://pypi.python.org/packages/source/i/ipaddress
+PYTHON_IPADDRESS_LICENSE = Python software foundation license
+PYTHON_IPADDRESS_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.1.4

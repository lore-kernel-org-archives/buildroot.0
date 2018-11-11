From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Mon, 12 Nov 2018 07:23:12 +0800
Subject: [Buildroot] [PATCH 1/1] python-cchardet: new package
Message-ID: <1541978592-13102-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

cChardet is high speed universal character encoding detector.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-cchardet/Config.in            | 11 +++++++++++
 package/python-cchardet/python-cchardet.hash |  5 +++++
 package/python-cchardet/python-cchardet.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/python-cchardet/Config.in
 create mode 100644 package/python-cchardet/python-cchardet.hash
 create mode 100644 package/python-cchardet/python-cchardet.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 53467da..4e9f989 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -985,6 +985,7 @@ F:	configs/pine64_sopine_defconfig
 
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/python-async-timeout/
+F:	package/python-cchardet/
 F:	package/python-multidict/
 F:	package/python-yarl/
 
diff --git a/package/Config.in b/package/Config.in
index b60e770..bc94e33 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -813,6 +813,7 @@ menu "External python modules"
 	source "package/python-cached-property/Config.in"
 	source "package/python-can/Config.in"
 	source "package/python-cbor/Config.in"
+	source "package/python-cchardet/Config.in"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
 	source "package/python-characteristic/Config.in"
diff --git a/package/python-cchardet/Config.in b/package/python-cchardet/Config.in
new file mode 100644
index 0000000..7415312
--- /dev/null
+++ b/package/python-cchardet/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_CCHARDET
+	bool "python-cchardet"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  cChardet is high speed universal character encoding
+	  detector.
+
+	  https://github.com/PyYoshi/cChardet
+
+comment "python-cchardet needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-cchardet/python-cchardet.hash b/package/python-cchardet/python-cchardet.hash
new file mode 100644
index 0000000..231804e
--- /dev/null
+++ b/package/python-cchardet/python-cchardet.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/cchardet/json
+md5	17af20af67cb18e958854e273d857a88  cchardet-2.1.4.tar.gz
+sha256	cc9745e0400da4cfb49f075e7819f22473b66443f953427058fee2c7b9547cc0  cchardet-2.1.4.tar.gz
+# Locally computed sha256 checksums
+sha256	107a29ccdd2d778aa2df5462f85dddfa099059abd22e064e07ec2cc9bafc37cd  COPYING
diff --git a/package/python-cchardet/python-cchardet.mk b/package/python-cchardet/python-cchardet.mk
new file mode 100644
index 0000000..9ac170c
--- /dev/null
+++ b/package/python-cchardet/python-cchardet.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cchardet
+#
+################################################################################
+
+PYTHON_CCHARDET_VERSION = 2.1.4
+PYTHON_CCHARDET_SOURCE = cchardet-$(PYTHON_CCHARDET_VERSION).tar.gz
+PYTHON_CCHARDET_SITE = https://files.pythonhosted.org/packages/74/64/3988d388315c1af3e24f447689dadf30edead43366fb2041cb103380b57f
+PYTHON_CCHARDET_SETUP_TYPE = setuptools
+PYTHON_CCHARDET_LICENSE = MPL-1.1
+PYTHON_CCHARDET_LICENSE_FILES = COPYING
+
+$(eval $(python-package))
-- 
2.7.4

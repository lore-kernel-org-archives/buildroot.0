From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Feb 2016 23:50:40 +0100
Subject: [Buildroot] [git commit branch/next] python-pyasn-modules: new
	package
Message-ID: <20160219225118.764FA8184D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=688793a19579b563d451b574e5924466445163ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                      |  1 +
 package/python-pyasn-modules/Config.in                 | 11 +++++++++++
 package/python-pyasn-modules/python-pyasn-modules.hash |  3 +++
 package/python-pyasn-modules/python-pyasn-modules.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 2098141..11ba42d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -681,6 +681,7 @@ menu "External python modules"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
 	source "package/python-pyasn/Config.in"
+	source "package/python-pyasn-modules/Config.in"
 	source "package/python-pycli/Config.in"
 	source "package/python-pycparser/Config.in"
 	source "package/python-pycrypto/Config.in"
diff --git a/package/python-pyasn-modules/Config.in b/package/python-pyasn-modules/Config.in
new file mode 100644
index 0000000..387020d
--- /dev/null
+++ b/package/python-pyasn-modules/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_PYASN_MODULES
+	bool "python-pyasn-modules"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_PYASN # runtime
+	help
+	  A collection of ASN.1-based protocols modules.
+
+	  https://pypi.python.org/pypi/pyasn1-modules
+
+comment "python-pyasn-modules needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pyasn-modules/python-pyasn-modules.hash b/package/python-pyasn-modules/python-pyasn-modules.hash
new file mode 100644
index 0000000..6d9a707
--- /dev/null
+++ b/package/python-pyasn-modules/python-pyasn-modules.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=178129bc7fbf07215c25230c5f053f81, sha256 locally computed.
+md5	178129bc7fbf07215c25230c5f053f81  pyasn1-modules-0.0.8.tar.gz
+sha256	10561934f1829bcc455c7ecdcdacdb4be5ffd3696f26f468eb6eb41e107f3837  pyasn1-modules-0.0.8.tar.gz
diff --git a/package/python-pyasn-modules/python-pyasn-modules.mk b/package/python-pyasn-modules/python-pyasn-modules.mk
new file mode 100644
index 0000000..bb32227
--- /dev/null
+++ b/package/python-pyasn-modules/python-pyasn-modules.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyasn-modules
+#
+################################################################################
+
+PYTHON_PYASN_MODULES_VERSION = 0.0.8
+PYTHON_PYASN_MODULES_SOURCE = pyasn1-modules-$(PYTHON_PYASN_MODULES_VERSION).tar.gz
+PYTHON_PYASN_MODULES_SITE = http://pypi.python.org/packages/source/p/pyasn1-modules
+PYTHON_PYASN_MODULES_LICENSE = BSD-2c
+PYTHON_PYASN_MODULES_LICENSE_FILES = LICENSE.txt
+PYTHON_PYASN_MODULES_SETUP_TYPE = setuptools
+
+$(eval $(python-package))

From: Mauro Condarelli <mc5686@mclink.it>
Date: Mon,  1 Feb 2016 02:25:31 +0100
Subject: [Buildroot] [PATCH 2/7] Additions necessary to compile Crossbar.io
In-Reply-To: <1454289936-10654-1-git-send-email-mc5686@mclink.it>
References: <1454289936-10654-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454289936-10654-3-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in                                  | 15 ++++++++++++++
 package/libffi/libffi.mk                           | 11 +++++++++++
 package/python-autobahn/Config.in                  |  8 ++++++++
 package/python-autobahn/python-autobahn.mk         | 15 ++++++++++++++
 package/python-cffi/python-cffi.mk                 |  2 ++
 package/python-characteristic/Config.in            |  8 ++++++++
 .../python-characteristic/python-characteristic.mk | 15 ++++++++++++++
 package/python-click/Config.in                     |  8 ++++++++
 package/python-click/python-click.mk               | 15 ++++++++++++++
 package/python-cryptography/Config.in              | 20 +++++++++++++++++++
 .../python-cryptography/python-cryptography.hash   |  3 +++
 package/python-cryptography/python-cryptography.mk | 23 ++++++++++++++++++++++
 package/python-jinja2/python-jinja2.hash           |  5 +++++
 package/python-jinja2/python-jinja2.mk             |  2 +-
 package/python-mistune/Config.in                   |  9 +++++++++
 package/python-mistune/python-treq.mk              | 15 ++++++++++++++
 package/python-netaddr/Config.in                   |  8 ++++++++
 package/python-netaddr/python-netaddr.mk           | 15 ++++++++++++++
 package/python-pyasn1-modules/Config.in            |  8 ++++++++
 .../python-pyasn1-modules/python-pyasn1-modules.mk | 15 ++++++++++++++
 package/python-pycparser/Config.in                 |  6 ++++++
 package/python-pycparser/python-pycparser.hash     |  4 ++++
 package/python-pycparser/python-pycparser.mk       | 15 ++++++++++++++
 package/python-pygments/Config.in                  |  8 ++++++++
 package/python-pygments/python-pygments.mk         | 15 ++++++++++++++
 package/python-pyopenssl/Config.in                 | 12 +++++++++++
 package/python-pyopenssl/python-pyopenssl.hash     |  3 +++
 package/python-pyopenssl/python-pyopenssl.mk       | 14 +++++++++++++
 package/python-pytrie/Config.in                    |  8 ++++++++
 package/python-pytrie/python-pytrie.mk             | 15 ++++++++++++++
 package/python-service-identity/Config.in          |  8 ++++++++
 .../python-service-identity.mk                     | 15 ++++++++++++++
 package/python-shutilwhich/Config.in               |  8 ++++++++
 package/python-shutilwhich/python-shutilwhich.mk   | 15 ++++++++++++++
 package/python-treq/Config.in                      | 13 ++++++++++++
 package/python-treq/python-treq.mk                 | 17 ++++++++++++++++
 package/python-txaio/Config.in                     |  8 ++++++++
 package/python-txaio/python-txaio.mk               | 15 ++++++++++++++
 38 files changed, 418 insertions(+), 1 deletion(-)
 create mode 100644 package/python-autobahn/Config.in
 create mode 100644 package/python-autobahn/python-autobahn.mk
 create mode 100644 package/python-characteristic/Config.in
 create mode 100644 package/python-characteristic/python-characteristic.mk
 create mode 100644 package/python-click/Config.in
 create mode 100644 package/python-click/python-click.mk
 create mode 100644 package/python-cryptography/Config.in
 create mode 100644 package/python-cryptography/python-cryptography.hash
 create mode 100644 package/python-cryptography/python-cryptography.mk
 create mode 100644 package/python-mistune/Config.in
 create mode 100644 package/python-mistune/python-treq.mk
 create mode 100644 package/python-netaddr/Config.in
 create mode 100644 package/python-netaddr/python-netaddr.mk
 create mode 100644 package/python-pyasn1-modules/Config.in
 create mode 100644 package/python-pyasn1-modules/python-pyasn1-modules.mk
 create mode 100644 package/python-pycparser/Config.in
 create mode 100644 package/python-pycparser/python-pycparser.hash
 create mode 100644 package/python-pycparser/python-pycparser.mk
 create mode 100644 package/python-pygments/Config.in
 create mode 100644 package/python-pygments/python-pygments.mk
 create mode 100644 package/python-pyopenssl/Config.in
 create mode 100644 package/python-pyopenssl/python-pyopenssl.hash
 create mode 100644 package/python-pyopenssl/python-pyopenssl.mk
 create mode 100644 package/python-pytrie/Config.in
 create mode 100644 package/python-pytrie/python-pytrie.mk
 create mode 100644 package/python-service-identity/Config.in
 create mode 100644 package/python-service-identity/python-service-identity.mk
 create mode 100644 package/python-shutilwhich/Config.in
 create mode 100644 package/python-shutilwhich/python-shutilwhich.mk
 create mode 100644 package/python-treq/Config.in
 create mode 100644 package/python-treq/python-treq.mk
 create mode 100644 package/python-txaio/Config.in
 create mode 100644 package/python-txaio/python-txaio.mk

diff --git a/package/Config.in b/package/Config.in
index 09c2b40..f211cfe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -617,18 +617,22 @@ endif
 if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "External python modules"
 	source "package/python-alsaaudio/Config.in"
+	source "package/python-autobahn/Config.in"
 	source "package/python-backports-abc/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bottle/Config.in"
 	source "package/python-can/Config.in"
 	source "package/python-certifi/Config.in"
 	source "package/python-cffi/Config.in"
+	source "package/python-characteristic/Config.in"
 	source "package/python-cheetah/Config.in"
 	source "package/python-cherrypy/Config.in"
+	source "package/python-click/Config.in"
 	source "package/python-coherence/Config.in"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-crc16/Config.in"
+	source "package/python-cryptography/Config.in"
 	source "package/python-cssselect/Config.in"
 	source "package/python-daemon/Config.in"
 	source "package/python-dialog/Config.in"
@@ -660,7 +664,9 @@ menu "External python modules"
 	source "package/python-markdown/Config.in"
 	source "package/python-markupsafe/Config.in"
 	source "package/python-meld3/Config.in"
+	source "package/python-mistune/Config.in"
 	source "package/python-msgpack/Config.in"
+	source "package/python-netaddr/Config.in"
 	source "package/python-netifaces/Config.in"
 	source "package/python-networkmanager/Config.in"
 	source "package/python-nfc/Config.in"
@@ -672,12 +678,16 @@ menu "External python modules"
 	source "package/python-protobuf/Config.in"
 	source "package/python-psutil/Config.in"
 	source "package/python-pyasn/Config.in"
+	source "package/python-pyasn1-modules/Config.in"
 	source "package/python-pycli/Config.in"
+	source "package/python-pycparser/Config.in"
 	source "package/python-pycrypto/Config.in"
 	source "package/python-pydal/Config.in"
 	source "package/python-pyftpdlib/Config.in"
 	source "package/python-pygame/Config.in"
+	source "package/python-pygments/Config.in"
 	source "package/python-pyinotify/Config.in"
+	source "package/python-pyopenssl/Config.in"
 	source "package/python-pyparsing/Config.in"
 	source "package/python-pypcap/Config.in"
 	source "package/python-pyqt/Config.in"
@@ -689,6 +699,7 @@ menu "External python modules"
 	source "package/python-pysnmp/Config.in"
 	source "package/python-pysnmp-apps/Config.in"
 	source "package/python-pysnmp-mibs/Config.in"
+	source "package/python-pytrie/Config.in"
 	source "package/python-pyudev/Config.in"
 	source "package/python-pyusb/Config.in"
 	source "package/python-pyxb/Config.in"
@@ -697,7 +708,9 @@ menu "External python modules"
 	source "package/python-requests/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-serial/Config.in"
+	source "package/python-service-identity/Config.in"
 	source "package/python-setuptools/Config.in"
+	source "package/python-shutilwhich/Config.in"
 	source "package/python-simplejson/Config.in"
 	source "package/python-singledispatch/Config.in"
 	source "package/python-sip/Config.in"
@@ -705,7 +718,9 @@ menu "External python modules"
 	source "package/python-spidev/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tornado/Config.in"
+	source "package/python-treq/Config.in"
 	source "package/python-twisted/Config.in"
+	source "package/python-txaio/Config.in"
 	source "package/python-urllib3/Config.in"
 	source "package/python-urwid/Config.in"
 	source "package/python-versiontools/Config.in"
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 8f0f72d..47de8cd 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -22,6 +22,17 @@ endef
 
 LIBFFI_POST_INSTALL_STAGING_HOOKS += LIBFFI_MOVE_STAGING_HEADERS
 
+# Move the headers to the usual location, and adjust the .pc file
+# accordingly.
+define HOST_LIBFFI_MOVE_HOST_HEADERS
+	mv $(HOST_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)/include/*.h $(HOST_DIR)/usr/include/
+	$(SED) '/^includedir.*/d' -e '/^Cflags:.*/d' \
+		$(HOST_DIR)/usr/lib/pkgconfig/libffi.pc
+	rm -rf $(HOST_DIR)/usr/lib/libffi-*
+endef
+
+HOST_LIBFFI_POST_INSTALL_HOOKS += HOST_LIBFFI_MOVE_HOST_HEADERS
+
 # Remove headers that are not at the usual location from the target
 define LIBFFI_REMOVE_TARGET_HEADERS
 	$(RM) -rf $(TARGET_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)
diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
new file mode 100644
index 0000000..79df0bd
--- /dev/null
+++ b/package/python-autobahn/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_AUTOBAHN
+	bool "python-autobahn"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  WebSocket client Hhh server library, WAMP real-time framework.
+
+	  https://pypi.python.org/pypi/autobahn
+
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
new file mode 100644
index 0000000..19eb35c
--- /dev/null
+++ b/package/python-autobahn/python-autobahn.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-autobahn
+#
+################################################################################
+
+PYTHON_AUTOBAHN_VERSION = 0.11.0
+PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
+PYTHON_AUTOBAHN_SITE = http://pypi.python.org/packages/source/a/autobahn
+PYTHON_AUTOBAHN_LICENSE = MIT
+PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
+PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
+#PYTHON_AUTOBAHN_DEPENDENCIES = 
+
+$(eval $(python-package))
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 70fbe02..02c969b 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -11,5 +11,7 @@ PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
 PYTHON_CFFI_LICENSE_FILES = LICENSE
+HOST_PYTHON_CFFI_DEPENDENCIES = host-python-pycparser host-libffi
 
 $(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/package/python-characteristic/Config.in b/package/python-characteristic/Config.in
new file mode 100644
index 0000000..625e27e
--- /dev/null
+++ b/package/python-characteristic/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_CHARACTERISTIC
+	bool "python-characteristic"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Python attributes without boilerplate.
+
+	  https://pypi.python.org/pypi/characteristic
+
diff --git a/package/python-characteristic/python-characteristic.mk b/package/python-characteristic/python-characteristic.mk
new file mode 100644
index 0000000..0def7a5
--- /dev/null
+++ b/package/python-characteristic/python-characteristic.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-characteristic
+#
+################################################################################
+
+PYTHON_CHARACTERISTIC_VERSION = 14.3.0
+PYTHON_CHARACTERISTIC_SOURCE = characteristic-$(PYTHON_CHARACTERISTIC_VERSION).tar.gz
+PYTHON_CHARACTERISTIC_SITE = http://pypi.python.org/packages/source/c/characteristic
+PYTHON_CHARACTERISTIC_LICENSE = MIT
+#PYTHON_CHARACTERISTIC_LICENSE_FILES = LICENSE
+PYTHON_CHARACTERISTIC_SETUP_TYPE = setuptools
+#PYTHON_CHARACTERISTIC_DEPENDENCIES = 
+
+$(eval $(python-package))
diff --git a/package/python-click/Config.in b/package/python-click/Config.in
new file mode 100644
index 0000000..54eb584
--- /dev/null
+++ b/package/python-click/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_CLICK
+	bool "python-click"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  A simple wrapper around optparse for powerful command line utilities.
+
+	  https://pypi.python.org/pypi/click
+
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
new file mode 100644
index 0000000..7bc5450
--- /dev/null
+++ b/package/python-click/python-click.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-click
+#
+################################################################################
+
+PYTHON_CLICK_VERSION = 6.2
+PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
+PYTHON_CLICK_SITE = http://pypi.python.org/packages/source/c/click
+PYTHON_CLICK_LICENSE = BSD
+#PYTHON_CLICK_LICENSE_FILES = LICENSE
+PYTHON_CLICK_SETUP_TYPE = setuptools
+#PYTHON_CLICK_DEPENDENCIES = 
+
+$(eval $(python-package))
diff --git a/package/python-cryptography/Config.in b/package/python-cryptography/Config.in
new file mode 100644
index 0000000..c6d183f
--- /dev/null
+++ b/package/python-cryptography/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
+	bool "python-cryptography"
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PYTHON_CFFI
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	select BR2_PACKAGE_PYTHON_IDNA
+	select BR2_PACKAGE_PYTHON_PYASN
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON
+	help
+	  cryptography is a package designed to expose cryptographic
+	  primitives and recipes to Python developers.
+
+	  https://cryptography.io
+
+comment "python-cryptography needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
new file mode 100644
index 0000000..0358624
--- /dev/null
+++ b/package/python-cryptography/python-cryptography.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=15eeba9e31f852bac21155baa3dfbc61, sha256 locally computed
+md5     15eeba9e31f852bac21155baa3dfbc61  cryptography-1.1.2.tar.gz
+sha256  7f51459f84d670444275e615839f4542c93547a12e938a0a4906dafe5f7de153  cryptography-1.1.2.tar.gz
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
new file mode 100644
index 0000000..fbd0caf
--- /dev/null
+++ b/package/python-cryptography/python-cryptography.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# python-cryptography
+#
+################################################################################
+
+PYTHON_CRYPTOGRAPHY_VERSION = 1.1.2
+PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
+PYTHON_CRYPTOGRAPHY_SITE = https://pypi.python.org/packages/source/c/cryptography
+PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
+PYTHON_CRYPTOGRAPHY_LICENSE = Apache
+PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE
+PYTHON_CRYPTOGRAPHY_DEPENDENCIES = python-six \
+				   python-idna \
+				   python-pyasn \
+				   host-python-cffi \
+				   openssl
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+PYTHON_CRYPTOGRAPHY_DEPENDENCIES += python-enum34
+endif
+
+$(eval $(python-package))
diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index 6e8c160..8222103 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,3 +1,8 @@
 # md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b9dffd2f3b43d673802fe857c8445b1a, sha256 locally computed
 md5	b9dffd2f3b43d673802fe857c8445b1a  Jinja2-2.7.3.tar.gz
 sha256	2e24ac5d004db5714976a04ac0e80c6df6e47e98c354cb2c0d82f8879d4f8fdb  Jinja2-2.7.3.tar.gz
+# added by MCon: md5 is from site, sha is locally computed.
+md5	edb51693fe22c53cee5403775c71a99e  Jinja2-2.8.tar.gz
+sha1	25ab3881f0c1adfcf79053b58de829c5ae65d3ac  Jinja2-2.7.3.tar.gz
+sha1	4a33c1a0fd585eba2507e8c274a9cd113b1d13ab  Jinja2-2.8.tar.gz
+sha256	bc1ff2ff88dbfacefde4ddde471d1417d3b304e8df103a7a9437d47269201bf4  Jinja2-2.8.tar.gz
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 8440b64..ce6e2b9 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_JINJA2_VERSION = 2.7.3
+PYTHON_JINJA2_VERSION = 2.8
 PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
 PYTHON_JINJA2_SITE = http://pypi.python.org/packages/source/J/Jinja2
 PYTHON_JINJA2_SETUP_TYPE = setuptools
diff --git a/package/python-mistune/Config.in b/package/python-mistune/Config.in
new file mode 100644
index 0000000..bac98a5
--- /dev/null
+++ b/package/python-mistune/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_MISTUNE
+	bool "python-mistune"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  The fastest markdown parser in pure Python 
+	  with renderer features, inspired by marked.
+
+	  https://pypi.python.org/pypi/mistune
+
diff --git a/package/python-mistune/python-treq.mk b/package/python-mistune/python-treq.mk
new file mode 100644
index 0000000..ec99836
--- /dev/null
+++ b/package/python-mistune/python-treq.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-mistune
+#
+################################################################################
+
+PYTHON_MISTUNE_VERSION = 0.7.1
+PYTHON_MISTUNE_SOURCE = mistune-$(PYTHON_MISTUNE_VERSION).tar.gz
+PYTHON_MISTUNE_SITE = http://pypi.python.org/packages/source/m/mistune
+PYTHON_MISTUNE_LICENSE = BSD
+#PYTHON_MISTUNE_LICENSE_FILES = LICENSE
+PYTHON_MISTUNE_SETUP_TYPE = setuptools
+#PYTHON_MISTUNE_DEPENDENCIES = 
+
+$(eval $(python-package))
diff --git a/package/python-netaddr/Config.in b/package/python-netaddr/Config.in
new file mode 100644
index 0000000..b60aa28
--- /dev/null
+++ b/package/python-netaddr/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_NETADDR
+	bool "python-netaddr"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  A network address manipulation library for Python.
+
+	  https://pypi.python.org/pypi/netaddr
+
diff --git a/package/python-netaddr/python-netaddr.mk b/package/python-netaddr/python-netaddr.mk
new file mode 100644
index 0000000..1b4588a
--- /dev/null
+++ b/package/python-netaddr/python-netaddr.mk
@@ -0,0 +1,15 @@
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
+#PYTHON_NETADDR_LICENSE_FILES = LICENSE
+PYTHON_NETADDR_SETUP_TYPE = distutils
+#PYTHON_NETADDR_DEPENDENCIES = 
+
+$(eval $(python-package))
diff --git a/package/python-pyasn1-modules/Config.in b/package/python-pyasn1-modules/Config.in
new file mode 100644
index 0000000..debad96
--- /dev/null
+++ b/package/python-pyasn1-modules/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYASN1_MODULES
+	bool "python-pyasn1-modules"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  A collection of ASN.1-based protocols modules.
+
+	  https://pypi.python.org/pypi/pyasn1-modules
+
diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.mk b/package/python-pyasn1-modules/python-pyasn1-modules.mk
new file mode 100644
index 0000000..69da1ea
--- /dev/null
+++ b/package/python-pyasn1-modules/python-pyasn1-modules.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pyasn1-modules
+#
+################################################################################
+
+PYTHON_PYASN1_MODULES_VERSION = 0.0.8
+PYTHON_PYASN1_MODULES_SOURCE = pyasn1-modules-$(PYTHON_PYASN1_MODULES_VERSION).tar.gz
+PYTHON_PYASN1_MODULES_SITE = http://pypi.python.org/packages/source/p/pyasn1-modules
+PYTHON_PYASN1_MODULES_LICENSE = BSD
+#PYTHON_PYASN1_MODULES_LICENSE_FILES = LICENSE
+PYTHON_PYASN1_MODULES_SETUP_TYPE = setuptools
+#PYTHON_PYASN1_MODULES_DEPENDENCIES = 
+
+$(eval $(python-package))
diff --git a/package/python-pycparser/Config.in b/package/python-pycparser/Config.in
new file mode 100644
index 0000000..49190c3
--- /dev/null
+++ b/package/python-pycparser/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYCPARSER
+	bool "python-pycparser"
+	help
+	  C parser in Python
+
+	  https://github.com/eliben/pycparser
diff --git a/package/python-pycparser/python-pycparser.hash b/package/python-pycparser/python-pycparser.hash
new file mode 100644
index 0000000..483d3d1
--- /dev/null
+++ b/package/python-pycparser/python-pycparser.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/pycparser/json
+md5	a2bc8d28c923b4fe2b2c3b4b51a4f935  pycparser-2.14.tar.gz
+# sha256 calculated by scanpypi
+sha256	7959b4a74abdc27b312fed1c21e6caf9309ce0b29ea86b591fd2e99ecdf27f73  pycparser-2.14.tar.gz
diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
new file mode 100644
index 0000000..a32f1aa
--- /dev/null
+++ b/package/python-pycparser/python-pycparser.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pycparser
+#
+################################################################################
+
+PYTHON_PYCPARSER_VERSION = 2.14
+PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
+PYTHON_PYCPARSER_SITE = https://pypi.python.org/packages/source/p/pycparser
+PYTHON_PYCPARSER_SETUP_TYPE = setuptools
+PYTHON_PYCPARSER_LICENSE = BSD-3c
+PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/package/python-pygments/Config.in b/package/python-pygments/Config.in
new file mode 100644
index 0000000..c0d0769
--- /dev/null
+++ b/package/python-pygments/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYGMENTS
+	bool "python-pygments"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Pygments is a syntax highlighting package written in Python.
+
+	  https://pypi.python.org/pypi/Pygments
+
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
new file mode 100644
index 0000000..99a8622
--- /dev/null
+++ b/package/python-pygments/python-pygments.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pygments
+#
+################################################################################
+
+PYTHON_PYGMENTS_VERSION = 2.1
+PYTHON_PYGMENTS_SOURCE = Pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
+PYTHON_PYGMENTS_SITE = http://pypi.python.org/packages/source/P/Pygments
+PYTHON_PYGMENTS_LICENSE = BSD
+#PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
+PYTHON_PYGMENTS_SETUP_TYPE = setuptools
+#PYTHON_PYGMENTS_DEPENDENCIES = 
+
+$(eval $(python-package))
diff --git a/package/python-pyopenssl/Config.in b/package/python-pyopenssl/Config.in
new file mode 100644
index 0000000..cb59e8b
--- /dev/null
+++ b/package/python-pyopenssl/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_PYOPENSSL
+	bool "python-pyopenssl"
+	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography
+	select BR2_PACKAGE_PYTHON_SIX
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
+	help
+	  Python wrapper module around the OpenSSL library.
+
+	  https://github.com/pyca/pyopenssl
+
+comment "python-pyopenssl needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
new file mode 100644
index 0000000..0c6e25a
--- /dev/null
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=f447644afcbd5f0a1f47350fec63a4c6, sha256 locally computed
+md5     f447644afcbd5f0a1f47350fec63a4c6  pyOpenSSL-0.15.1.tar.gz
+sha256  f0a26070d6db0881de8bcc7846934b7c3c930d8f9c79d45883ee48984bc0d672  pyOpenSSL-0.15.1.tar.gz
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
new file mode 100644
index 0000000..239fd98
--- /dev/null
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyopenssl
+#
+################################################################################
+
+PYTHON_PYOPENSSL_VERSION = 0.15.1
+PYTHON_PYOPENSSL_SOURCE = pyOpenSSL-$(PYTHON_PYOPENSSL_VERSION).tar.gz
+PYTHON_PYOPENSSL_SITE = https://pypi.python.org/packages/source/p/pyOpenSSL
+PYTHON_PYOPENSSL_LICENSE = Apache-2.0
+PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
+PYTHON_PYOPENSSL_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
diff --git a/package/python-pytrie/Config.in b/package/python-pytrie/Config.in
new file mode 100644
index 0000000..3b9db7f
--- /dev/null
+++ b/package/python-pytrie/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYTRIE
+	bool "python-pytrie"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  A pure Python implementation of the trie data structure.
+
+	  https://pypi.python.org/pypi/PyTrie
+
diff --git a/package/python-pytrie/python-pytrie.mk b/package/python-pytrie/python-pytrie.mk
new file mode 100644
index 0000000..ad1ee46
--- /dev/null
+++ b/package/python-pytrie/python-pytrie.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pytrie
+#
+################################################################################
+
+PYTHON_PYTRIE_VERSION = 0.2
+PYTHON_PYTRIE_SITE = http://pypi.python.org/packages/source/P/PyTrie
+PYTHON_PYTRIE_SOURCE = PyTrie-$(PYTHON_PYTRIE_VERSION).tar.gz
+PYTHON_PYTRIE_LICENSE = BSD-3c
+PYTHON_PYTRIE_LICENSE_FILES = LICENSE
+PYTHON_PYTRIE_SETUP_TYPE = distutils
+#PYTHON_PYTRIE_DEPENDENCIES = 
+
+$(eval $(python-package))
diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
new file mode 100644
index 0000000..4bbbca6
--- /dev/null
+++ b/package/python-service-identity/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
+	bool "python-service-identity"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Service identity verification for pyOpenSSL.
+
+	  https://pypi.python.org/pypi/service_identity
+
diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
new file mode 100644
index 0000000..2325796
--- /dev/null
+++ b/package/python-service-identity/python-service-identity.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-service-identity
+#
+################################################################################
+
+PYTHON_SERVICE_IDENTITY_VERSION = 14.0.0
+PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
+PYTHON_SERVICE_IDENTITY_SITE = http://pypi.python.org/packages/source/s/service_identity
+PYTHON_SERVICE_IDENTITY_LICENSE = BSD
+#PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
+PYTHON_SERVICE_IDENTITY_SETUP_TYPE = setuptools
+#PYTHON_SERVICE_IDENTITY_DEPENDENCIES = 
+
+$(eval $(python-package))
diff --git a/package/python-shutilwhich/Config.in b/package/python-shutilwhich/Config.in
new file mode 100644
index 0000000..d610cfe
--- /dev/null
+++ b/package/python-shutilwhich/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SHUTILWHICH
+	bool "python-shutilwhich"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  shutil.which for those not using Python 3.3 yet.
+
+	  https://pypi.python.org/pypi/shutilwhich/
+
diff --git a/package/python-shutilwhich/python-shutilwhich.mk b/package/python-shutilwhich/python-shutilwhich.mk
new file mode 100644
index 0000000..ac141c2
--- /dev/null
+++ b/package/python-shutilwhich/python-shutilwhich.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-shutilwhich
+#
+################################################################################
+
+PYTHON_SHUTILWHICH_VERSION = 1.1.0
+PYTHON_SHUTILWHICH_SOURCE = shutilwhich-$(PYTHON_SHUTILWHICH_VERSION).tar.gz
+PYTHON_SHUTILWHICH_SITE = http://pypi.python.org/packages/source/s/shutilwhich
+PYTHON_SHUTILWHICH_LICENSE = MIT
+#PYTHON_SHUTILWHICH_LICENSE_FILES = LICENSE
+PYTHON_SHUTILWHICH_SETUP_TYPE = setuptools
+#PYTHON_SHUTILWHICH_DEPENDENCIES = 
+
+$(eval $(python-package))
diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
new file mode 100644
index 0000000..7c0fb14
--- /dev/null
+++ b/package/python-treq/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_TREQ
+	bool "python-treq"
+	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON_TWISTED
+	help
+	  treq is an HTTP library inspired by requests but written on top of Twisted's Agents.
+	  It provides a simple, higher level API for making HTTP requests when using Twisted.
+
+	  https://github.com/twisted/treq
+
+comment "python-treq needs python-twisted"
+	depends on BR2_PACKAGE_PYTHON
+	depends on !BR2_PACKAGE_PYTHON_TWISTED
diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
new file mode 100644
index 0000000..89b5d19
--- /dev/null
+++ b/package/python-treq/python-treq.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-treq
+#
+################################################################################
+
+#PYTHON_TREQ_VERSION = master
+#PYTHON_TREQ_SITE = $(call github,twisted,treq,$(PYTHON_TREQ_VERSION))
+PYTHON_TREQ_VERSION = 15.1.0
+PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
+PYTHON_TREQ_SITE = http://pypi.python.org/packages/source/t/treq
+PYTHON_TREQ_LICENSE = MIT
+PYTHON_TREQ_LICENSE_FILES = LICENSE
+PYTHON_TREQ_SETUP_TYPE = setuptools
+PYTHON_TREQ_DEPENDENCIES = python-twisted
+
+$(eval $(python-package))
diff --git a/package/python-txaio/Config.in b/package/python-txaio/Config.in
new file mode 100644
index 0000000..24892b6
--- /dev/null
+++ b/package/python-txaio/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_TXAIO
+	bool "python-txaio"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  Hhh.
+
+	  https://pypi.python.org/pypi/txaio
+
diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
new file mode 100644
index 0000000..19d7028
--- /dev/null
+++ b/package/python-txaio/python-txaio.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-txaio
+#
+################################################################################
+
+PYTHON_TXAIO_VERSION = 2.2.1
+PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
+PYTHON_TXAIO_SITE = http://pypi.python.org/packages/source/t/txaio
+PYTHON_TXAIO_LICENSE = BSD
+#PYTHON_TXAIO_LICENSE_FILES = LICENSE
+PYTHON_TXAIO_SETUP_TYPE = setuptools
+#PYTHON_TXAIO_DEPENDENCIES = 
+
+$(eval $(python-package))
-- 
2.1.4

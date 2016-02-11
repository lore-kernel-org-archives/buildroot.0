From: Mauro Condarelli <mc5686@mclink.it>
Date: Thu, 11 Feb 2016 11:58:48 +0100
Subject: [Buildroot] [PATCH v5 20/20] python-crossbar: new package
In-Reply-To: <1455188328-7595-1-git-send-email-mc5686@mclink.it>
References: <1455188328-7595-1-git-send-email-mc5686@mclink.it>
Message-ID: <1455188328-7595-3-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>

---
Changes v4 -> v5
  - added dependency from Python sources.
  - select python-shutilwhich only with Python2
  - fixed typo BR2_PACKAGE_PYTHON_SHURILWHICH -> BR2_PACKAGE_PYTHON_SHUTILWHICH

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in                            |  1 +
 package/python-crossbar/Config.in            | 38 ++++++++++++++++++++++++++++
 package/python-crossbar/python-crossbar.hash |  3 +++
 package/python-crossbar/python-crossbar.mk   | 14 ++++++++++
 4 files changed, 56 insertions(+)
 create mode 100644 package/python-crossbar/Config.in
 create mode 100644 package/python-crossbar/python-crossbar.hash
 create mode 100644 package/python-crossbar/python-crossbar.mk

diff --git a/package/Config.in b/package/Config.in
index 4b92a2a..5037f12 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -635,6 +635,7 @@ menu "External python modules"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-crc16/Config.in"
 	source "package/python-cryptography/Config.in"
+	source "package/python-crossbar/Config.in"
 	source "package/python-cssselect/Config.in"
 	source "package/python-daemon/Config.in"
 	source "package/python-dialog/Config.in"
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
new file mode 100644
index 0000000..0cd3ee1
--- /dev/null
+++ b/package/python-crossbar/Config.in
@@ -0,0 +1,38 @@
+config BR2_PACKAGE_PYTHON_CROSSBAR
+	bool "python-crossbar"
+	depends on !BR2_PACKAGE_PYTHON_PYC_ONLY
+	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
+	select BR2_PACKAGE_PYTHON_CBOR # runtime
+	select BR2_PACKAGE_PYTHON_CLICK # runtime
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
+	select BR2_PACKAGE_PYTHON_MISTUNE # runtime
+	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
+	select BR2_PACKAGE_PYTHON_NETADDR # runtime
+	select BR2_PACKAGE_PYTHON_PSUTIL # runtime
+	select BR2_PACKAGE_PYTHON_PYASN # runtime
+	select BR2_PACKAGE_PYTHON_PYASN_MODULES # runtime
+	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
+	select BR2_PACKAGE_PYTHON_PYINOTIFY # runtime
+	select BR2_PACKAGE_PYTHON_PYNACL # runtime
+	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
+	select BR2_PACKAGE_PYTHON_PYTRIE # runtime
+	select BR2_PACKAGE_PYTHON_PYYAML # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
+	select BR2_PACKAGE_PYTHON_SETPROCTITLE # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_SHUTILWHICH if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_TREQ # runtime
+	select BR2_PACKAGE_PYTHON_TWISTED # runtime
+	select BR2_PACKAGE_PYTHON_UJSON # runtime
+	select BR2_PACKAGE_PYTHON_WSACCEL # runtime
+	help
+	  Crossbar.io is an open-source WAMP application router 
+	  that allows to build advanced applications from loosely-coupled
+	  components that can talk in real-time with each other.
+
+	  https://pypi.python.org/pypi/crossbar
+
+comment "Currently Crossbar.io does NOT work without Python sources!"
+        depends on BR2_PACKAGE_PYTHON_PYC_ONLY
diff --git a/package/python-crossbar/python-crossbar.hash b/package/python-crossbar/python-crossbar.hash
new file mode 100644
index 0000000..0690e56
--- /dev/null
+++ b/package/python-crossbar/python-crossbar.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=cbe9b62a1ec2eebbc0cd0cef887a4993, sha256 locally computed.
+md5	cbe9b62a1ec2eebbc0cd0cef887a4993  crossbar-0.12.1.tar.gz
+sha256	4919e683bcfa3c633da8207f24189fd196ef8412b647f0365cf74c0bff8b4ada  crossbar-0.12.1.tar.gz
diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
new file mode 100644
index 0000000..a35d54d
--- /dev/null
+++ b/package/python-crossbar/python-crossbar.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-crossbar
+#
+################################################################################
+
+PYTHON_CROSSBAR_VERSION = 0.12.1
+PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
+PYTHON_CROSSBAR_SITE = http://pypi.python.org/packages/source/c/crossbar
+PYTHON_CROSSBAR_LICENSE = AGPL3
+PYTHON_CROSSBAR_LICENSE_FILES = LICENSE
+PYTHON_CROSSBAR_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
2.1.4

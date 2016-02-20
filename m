From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 15:31:34 +0100
Subject: [Buildroot] [git commit] python-crossbar: new package
Message-ID: <20160302202753.F404180203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ecaf8972c41b03ad161fe2924577319b7d7ba165
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas:
 - Remove dependency on having .py files, since building/testing with
   .pyc files only was successful.
 - Remove the "# runtime" comment for all dependencies, and only
   mention it once before all "select".
 - Add missing dependencies on: BR2_PACKAGE_PYTHON_PYCPARSER and
   BR2_PACKAGE_PYTHON_LMDB.
 - Use AGPLv3 for the license instead of AGPL3.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |  1 +
 package/python-crossbar/Config.in            | 37 ++++++++++++++++++++++++++++
 package/python-crossbar/python-crossbar.hash |  3 +++
 package/python-crossbar/python-crossbar.mk   | 14 +++++++++++
 4 files changed, 55 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index df96d40..4513e4f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -637,6 +637,7 @@ menu "External python modules"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-crc16/Config.in"
 	source "package/python-cryptography/Config.in"
+	source "package/python-crossbar/Config.in"
 	source "package/python-cssselect/Config.in"
 	source "package/python-daemon/Config.in"
 	source "package/python-dialog/Config.in"
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
new file mode 100644
index 0000000..84c65c1
--- /dev/null
+++ b/package/python-crossbar/Config.in
@@ -0,0 +1,37 @@
+config BR2_PACKAGE_PYTHON_CROSSBAR
+	bool "python-crossbar"
+	# All the following dependencies are runtime dependencies
+	select BR2_PACKAGE_PYTHON_AUTOBAHN
+	select BR2_PACKAGE_PYTHON_CBOR
+	select BR2_PACKAGE_PYTHON_CLICK
+	select BR2_PACKAGE_PYTHON_PYCPARSER
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
+	select BR2_PACKAGE_PYTHON_JINJA2
+	select BR2_PACKAGE_PYTHON_LMDB
+	select BR2_PACKAGE_PYTHON_MISTUNE
+	select BR2_PACKAGE_PYTHON_MSGPACK
+	select BR2_PACKAGE_PYTHON_NETADDR
+	select BR2_PACKAGE_PYTHON_PSUTIL
+	select BR2_PACKAGE_PYTHON_PYASN
+	select BR2_PACKAGE_PYTHON_PYASN_MODULES
+	select BR2_PACKAGE_PYTHON_PYGMENTS
+	select BR2_PACKAGE_PYTHON_PYINOTIFY
+	select BR2_PACKAGE_PYTHON_PYNACL
+	select BR2_PACKAGE_PYTHON_PYOPENSSL
+	select BR2_PACKAGE_PYTHON_PYTRIE
+	select BR2_PACKAGE_PYTHON_PYYAML
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
+	select BR2_PACKAGE_PYTHON_SETPROCTITLE
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	select BR2_PACKAGE_PYTHON_SHUTILWHICH if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_TREQ
+	select BR2_PACKAGE_PYTHON_TWISTED
+	select BR2_PACKAGE_PYTHON_UJSON
+	select BR2_PACKAGE_PYTHON_WSACCEL
+	help
+	  Crossbar.io is an open-source WAMP application router that
+	  allows to build advanced applications from loosely-coupled
+	  components that can talk in real-time with each other.
+
+	  https://pypi.python.org/pypi/crossbar
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
index 0000000..96bc254
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
+PYTHON_CROSSBAR_LICENSE = AGPLv3
+PYTHON_CROSSBAR_LICENSE_FILES = LICENSE
+PYTHON_CROSSBAR_SETUP_TYPE = setuptools
+
+$(eval $(python-package))

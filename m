From: Mauro Condarelli <mc5686@mclink.it>
Date: Tue,  2 Feb 2016 01:44:59 +0100
Subject: [Buildroot] [PATCH 19/19] python-crossbar: new package
In-Reply-To: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
References: <1454373899-22481-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454373899-22481-20-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/Config.in                            |  1 +
 package/python-crossbar/Config.in            | 24 ++++++++++++++++++++++++
 package/python-crossbar/python-crossbar.hash |  3 +++
 package/python-crossbar/python-crossbar.mk   | 17 +++++++++++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 package/python-crossbar/Config.in
 create mode 100644 package/python-crossbar/python-crossbar.hash
 create mode 100644 package/python-crossbar/python-crossbar.mk

diff --git a/package/Config.in b/package/Config.in
index 9e0f7ca..70036f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -633,6 +633,7 @@ menu "External python modules"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-crc16/Config.in"
+	source "package/python-crossbar/Config.in"
 	source "package/python-cryptography/Config.in"
 	source "package/python-cssselect/Config.in"
 	source "package/python-daemon/Config.in"
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
new file mode 100644
index 0000000..5b2380b
--- /dev/null
+++ b/package/python-crossbar/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_PYTHON_CROSSBAR
+	bool "python-crossbar"
+	select BR2_PACKAGE_PYTHON_AUTOBAHN
+	select BR2_PACKAGE_PYTHON_CLICK
+	select BR2_PACKAGE_PYTHON_JINJA2
+	select BR2_PACKAGE_PYTHON_MISTUNE
+	select BR2_PACKAGE_PYTHON_NETADDR
+	select BR2_PACKAGE_PYTHON_PYGMENTS
+	select BR2_PACKAGE_PYTHON_PYTRIE
+	select BR2_PACKAGE_PYTHON_PYYAML
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	select BR2_PACKAGE_PYTHON_SHURILWHICH
+	select BR2_PACKAGE_PYTHON_TREQ
+	select BR2_PACKAGE_PYTHON_TWISTED
+	help
+	  Crossbar.io is an open-source WAMP application router 
+	  that allows to build advanced applications from loosely-coupled
+	  components that can talk in real-time with each other.
+
+	  https://pypi.python.org/pypi/crossbar
+
+comment "*** Currently Crossbar.io does NOT work without Python sources! ***"
+        depends on BR2_PACKAGE_PYTHON_PYC_ONLY
+
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
index 0000000..eaf46c9
--- /dev/null
+++ b/package/python-crossbar/python-crossbar.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-crossbar
+#
+################################################################################
+
+PYTHON_CROSSBAR_VERSION = 0.12.1
+PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
+PYTHON_CROSSBAR_SITE = http://pypi.python.org/packages/source/c/crossbar
+PYTHON_CROSSBAR_LICENSE = AGPL2
+PYTHON_CROSSBAR_LICENSE_FILES = LICENSE
+PYTHON_CROSSBAR_SETUP_TYPE = setuptools
+PYTHON_CROSSBAR_DEPENDENCIES = python-click python-setuptools python-twisted python-autobahn \
+	python-netaddr python-pytrie python-jinja2 python-mistune python-pygments python-pyyaml \
+	python-shutilwhich python-psutil python-treq
+
+$(eval $(python-package))
-- 
2.1.4

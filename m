From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 15:53:18 +0200
Subject: [Buildroot] [git commit] python-requests-toolbelt: new package
Message-ID: <20160902142936.CAA50822FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e73a1db4646c2d6696c529b7bdd2b59d54ff460a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Manuel V??gele <develop@manuel-voegele.de>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                          |  1 +
 package/python-requests-toolbelt/Config.in                 |  7 +++++++
 .../python-requests-toolbelt/python-requests-toolbelt.hash |  3 +++
 .../python-requests-toolbelt/python-requests-toolbelt.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 645fa29..ade3e34 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -752,6 +752,7 @@ menu "External python modules"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-requests/Config.in"
+	source "package/python-requests-toolbelt/Config.in"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-scapy3k/Config.in"
diff --git a/package/python-requests-toolbelt/Config.in b/package/python-requests-toolbelt/Config.in
new file mode 100644
index 0000000..ba2b951
--- /dev/null
+++ b/package/python-requests-toolbelt/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_REQUESTS_TOOLBELT
+	bool "python-requests-toolbelt"
+	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
+	help
+	  A utility belt for advanced users of python-requests.
+
+	  https://toolbelt.readthedocs.org
diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.hash b/package/python-requests-toolbelt/python-requests-toolbelt.hash
new file mode 100644
index 0000000..89f5ca1
--- /dev/null
+++ b/package/python-requests-toolbelt/python-requests-toolbelt.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/requests-toolbelt/json, sha256 locally computed
+md5	bfe2009905f460f4764c32cfbbf4205f  requests-toolbelt-0.7.0.tar.gz
+sha256	33899d4a559c3f0f5e9fbc115d337c4236febdc083755a160a4132d92fc3c91a  requests-toolbelt-0.7.0.tar.gz
diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.mk b/package/python-requests-toolbelt/python-requests-toolbelt.mk
new file mode 100644
index 0000000..2e944c0
--- /dev/null
+++ b/package/python-requests-toolbelt/python-requests-toolbelt.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-requests-toolbelt
+#
+################################################################################
+
+PYTHON_REQUESTS_TOOLBELT_VERSION = 0.7.0
+PYTHON_REQUESTS_TOOLBELT_SOURCE = requests-toolbelt-$(PYTHON_REQUESTS_TOOLBELT_VERSION).tar.gz
+PYTHON_REQUESTS_TOOLBELT_SITE = https://pypi.python.org/packages/59/78/1d391d30ebf74079a8e4de6ab66fdca5362903ef2df64496f4697e9bb626
+PYTHON_REQUESTS_TOOLBELT_SETUP_TYPE = setuptools
+PYTHON_REQUESTS_TOOLBELT_LICENSE = Apache-2.0
+PYTHON_REQUESTS_TOOLBELT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

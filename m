From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 14:22:26 +0100
Subject: [Buildroot] [git commit] python-spidev: new package
Message-ID: <20150309132342.1F8938046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a3a9784db170ec05b300f228cf8a4bc48d838ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python module for interfacing with SPI devices from user space via the
spidev linux kernel driver.

[Thomas: fix <pkg>_LICENSE_FILES.]

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |    1 +
 package/python-spidev/Config.in        |    7 +++++++
 package/python-spidev/python-spidev.mk |   14 ++++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index cab9382..a37e519 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -577,6 +577,7 @@ menu "external python modules"
 	source "package/python-setuptools/Config.in"
 	source "package/python-simplejson/Config.in"
 	source "package/python-six/Config.in"
+	source "package/python-spidev/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-twisted/Config.in"
diff --git a/package/python-spidev/Config.in b/package/python-spidev/Config.in
new file mode 100644
index 0000000..8540d55
--- /dev/null
+++ b/package/python-spidev/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SPIDEV
+	bool "python-spidev"
+	help
+	  Python module for interfacing with SPI devices from user
+	  space via the spidev linux kernel driver.
+
+	  https://pypi.python.org/pypi/spidev
diff --git a/package/python-spidev/python-spidev.mk b/package/python-spidev/python-spidev.mk
new file mode 100644
index 0000000..14103f3
--- /dev/null
+++ b/package/python-spidev/python-spidev.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-spidev
+#
+################################################################################
+
+PYTHON_SPIDEV_VERSION = 3.0
+PYTHON_SPIDEV_SOURCE = spidev-$(PYTHON_SPIDEV_VERSION).tar.gz
+PYTHON_SPIDEV_SITE = https://pypi.python.org/packages/source/s/spidev
+PYTHON_SPIDEV_SETUP_TYPE = distutils
+PYTHON_SPIDEV_LICENSE = GPLv2
+PYTHON_SPIDEV_LICENSE_FILES = LICENSE.md
+
+$(eval $(python-package))

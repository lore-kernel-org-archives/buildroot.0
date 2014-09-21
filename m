From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:44:14 +0200
Subject: [Buildroot] [git commit] python-rtslib-fb: new package
Message-ID: <20140921174754.280A09D6A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a930816fec26ab3293e3e30c2b68d48c31fa9e25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rtslib-fb is an object-based Python library for configuring the
LIO generic SCSI target, present in 3.x Linux kernel versions.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                            |    1 +
 package/python-rtslib-fb/Config.in           |    9 +++++++++
 package/python-rtslib-fb/python-rtslib-fb.mk |   13 +++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 17930ea..7447036 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -503,6 +503,7 @@ menu "external python modules"
 	source "package/python-pysnmp-mibs/Config.in"
 	source "package/python-pyusb/Config.in"
 	source "package/python-pyzmq/Config.in"
+	source "package/python-rtslib-fb/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-setuptools/Config.in"
 	source "package/python-simplejson/Config.in"
diff --git a/package/python-rtslib-fb/Config.in b/package/python-rtslib-fb/Config.in
new file mode 100644
index 0000000..b2aebcf
--- /dev/null
+++ b/package/python-rtslib-fb/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_RTSLIB_FB
+	bool "python-rtslib-fb"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  rtslib-fb is an object-based Python library for configuring
+	  the LIO generic SCSI target, present in 3.x Linux kernel
+	  versions.
+
+	  https://github.com/agrover/rtslib-fb
diff --git a/package/python-rtslib-fb/python-rtslib-fb.mk b/package/python-rtslib-fb/python-rtslib-fb.mk
new file mode 100644
index 0000000..70b0257
--- /dev/null
+++ b/package/python-rtslib-fb/python-rtslib-fb.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-rtslib-fb
+#
+################################################################################
+
+PYTHON_RTSLIB_FB_VERSION = v2.1.fb49
+PYTHON_RTSLIB_FB_SITE = $(call github,agrover,rtslib-fb,$(PYTHON_RTSLIB_FB_VERSION))
+PYTHON_RTSLIB_FB_LICENSE = Apache-2.0
+PYTHON_RTSLIB_FB_LICENSE_FILES = COPYING
+PYTHON_RTSLIB_FB_SETUP_TYPE = setuptools
+
+$(eval $(python-package))

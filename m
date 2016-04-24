From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 00:00:04 +0200
Subject: [Buildroot] [git commit] python-iowait: new package
Message-ID: <20160424220127.CD49B7F9A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a115cbe589047bc348ff8ba88ef6335bd628178
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |  1 +
 package/python-iowait/Config.in          |  6 ++++++
 package/python-iowait/python-iowait.hash |  4 ++++
 package/python-iowait/python-iowait.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 5103621..e860f72 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -663,6 +663,7 @@ menu "External python modules"
 	source "package/python-id3/Config.in"
 	source "package/python-idna/Config.in"
 	source "package/python-iniparse/Config.in"
+	source "package/python-iowait/Config.in"
 	source "package/python-ipaddr/Config.in"
 	source "package/python-ipaddress/Config.in"
 	source "package/python-ipy/Config.in"
diff --git a/package/python-iowait/Config.in b/package/python-iowait/Config.in
new file mode 100644
index 0000000..ebe96db
--- /dev/null
+++ b/package/python-iowait/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_IOWAIT
+	bool "python-iowait"
+	help
+	  Platform-independent module for I/O completion events.
+
+	  https://launchpad.net/python-iowait
diff --git a/package/python-iowait/python-iowait.hash b/package/python-iowait/python-iowait.hash
new file mode 100644
index 0000000..67dac15
--- /dev/null
+++ b/package/python-iowait/python-iowait.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/iowait/json
+md5	f49ca7766fe4a67e03a731e575614f87  iowait-0.2.tar.gz
+# sha256 calculated by scanpypi
+sha256	ab1bc2eb84c22ccf61f17a0024f9fb6df781b39f1852764a66a7769d5adfb299  iowait-0.2.tar.gz
diff --git a/package/python-iowait/python-iowait.mk b/package/python-iowait/python-iowait.mk
new file mode 100644
index 0000000..99c2922
--- /dev/null
+++ b/package/python-iowait/python-iowait.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-iowait
+#
+################################################################################
+
+PYTHON_IOWAIT_VERSION = 0.2
+PYTHON_IOWAIT_SOURCE = iowait-$(PYTHON_IOWAIT_VERSION).tar.gz
+PYTHON_IOWAIT_SITE = https://pypi.python.org/packages/65/30/e953673fe9619938e9c74408401cf865f37716da89f61f6e5d9328c0f71e
+PYTHON_IOWAIT_SETUP_TYPE = distutils
+PYTHON_IOWAIT_LICENSE = LGPLv3+
+PYTHON_IOWAIT_LICENSE_FILES = COPYING.LESSER
+
+$(eval $(python-package))

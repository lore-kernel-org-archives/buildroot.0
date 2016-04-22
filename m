From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 22 Apr 2016 15:36:28 +0200
Subject: [Buildroot] [PATCH 1/3] python-iowait: new package
Message-ID: <1461332190-18340-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                        |  1 +
 package/python-iowait/Config.in          |  6 ++++++
 package/python-iowait/python-iowait.hash |  4 ++++
 package/python-iowait/python-iowait.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/python-iowait/Config.in
 create mode 100644 package/python-iowait/python-iowait.hash
 create mode 100644 package/python-iowait/python-iowait.mk

diff --git a/package/Config.in b/package/Config.in
index a07c1bc..2f45582 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -664,6 +664,7 @@ menu "External python modules"
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
-- 
2.8.0.rc3

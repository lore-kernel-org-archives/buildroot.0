From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon,  6 Nov 2017 10:28:23 -0800
Subject: [Buildroot] [PATCH 1/1] python-schedule: new package
Message-ID: <20171106182823.28656-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-schedule/Config.in            |  6 ++++++
 package/python-schedule/python-schedule.hash |  5 +++++
 package/python-schedule/python-schedule.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-schedule/Config.in
 create mode 100644 package/python-schedule/python-schedule.hash
 create mode 100644 package/python-schedule/python-schedule.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c651bf26fa..7f6f2a276b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -789,6 +789,7 @@ F:	configs/qemu_ppc64le_pseries_defconfig
 
 N:	Joseph Kogut <joseph.kogut@gmail.com>
 F:	package/python-websockets/
+F:	package/python-schedule/
 
 N:	Johan Derycke <johanderycke@gmail.com>
 F:	package/python-libconfig/
diff --git a/package/Config.in b/package/Config.in
index fe5ccc434e..c14cbe85a4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -880,6 +880,7 @@ menu "External python modules"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-scandir/Config.in"
 	source "package/python-scapy3k/Config.in"
+	source "package/python-schedule/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-service-identity/Config.in"
diff --git a/package/python-schedule/Config.in b/package/python-schedule/Config.in
new file mode 100644
index 0000000000..d00c245948
--- /dev/null
+++ b/package/python-schedule/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_SCHEDULE
+	bool "python-schedule"
+	help
+	  Job scheduling for humans.
+
+	  https://github.com/dbader/schedule
diff --git a/package/python-schedule/python-schedule.hash b/package/python-schedule/python-schedule.hash
new file mode 100644
index 0000000000..9f64cc4373
--- /dev/null
+++ b/package/python-schedule/python-schedule.hash
@@ -0,0 +1,5 @@
+# md5 from https://pypi.python.org/pypi/schedule/json, sha256 locally computed
+md5	ab135a73458547d2b836beddd168528b  schedule-0.4.3.tar.gz
+sha256	31a160546a17838842199c792ba267575cf41339ca730aaf060567b798f4f46e  schedule-0.4.3.tar.gz
+# License file, locally calculated
+30a8352c318ce1b645acde0299697342d4380ed2637d7ca18a8ad25661e3b41b  LICENSE.txt
diff --git a/package/python-schedule/python-schedule.mk b/package/python-schedule/python-schedule.mk
new file mode 100644
index 0000000000..26a3f5bce1
--- /dev/null
+++ b/package/python-schedule/python-schedule.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-schedule
+#
+################################################################################
+
+PYTHON_SCHEDULE_VERSION = 0.4.3
+PYTHON_SCHEDULE_SOURCE = schedule-$(PYTHON_SCHEDULE_VERSION).tar.gz
+PYTHON_SCHEDULE_SITE = https://pypi.python.org/packages/ee/68/ba6b0bb69b2be13b32983971bca6c5adf22df6321945232e1419bc34a82f
+PYTHON_SCHEDULE_SETUP_TYPE = setuptools
+PYTHON_SCHEDULE_LICENSE = MIT
+PYTHON_SCHEDULE_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.15.0

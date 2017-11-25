From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Nov 2017 13:33:55 +0100
Subject: [Buildroot] [git commit] python-schedule: new package
Message-ID: <20171201205337.BE3CE7FF82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0954a0372ba8c690f34d9c99e923a013304f751c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-schedule/Config.in            |  6 ++++++
 package/python-schedule/python-schedule.hash |  5 +++++
 package/python-schedule/python-schedule.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8a44e04..7dcc95b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -805,6 +805,7 @@ F:	configs/qemu_ppc64le_pseries_defconfig
 
 N:	Joseph Kogut <joseph.kogut@gmail.com>
 F:	package/python-raven/
+F:	package/python-schedule/
 F:	package/python-websockets/
 
 N:	Johan Derycke <johanderycke@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index a8f3f7c..86acab6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -885,6 +885,7 @@ menu "External python modules"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-scandir/Config.in"
 	source "package/python-scapy3k/Config.in"
+	source "package/python-schedule/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-service-identity/Config.in"
diff --git a/package/python-schedule/Config.in b/package/python-schedule/Config.in
new file mode 100644
index 0000000..d00c245
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
index 0000000..9f64cc4
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
index 0000000..26a3f5b
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

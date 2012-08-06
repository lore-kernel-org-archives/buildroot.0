From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Mon,  6 Aug 2012 10:26:26 +0800
Subject: [Buildroot]  [PATCH v2] Add new package: cpuload
Message-ID: <1344219986-8638-1-git-send-email-keguang.zhang@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpuload is a simple tool to obtain intuitive vision of CPU load
(including total, user, system, irq and softirq) within a certain
time, which is especially useful for embedded system without GUI.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
---
Updated cpuload to version 0.3 to remove unnecessary
wide-character string code.

Add license info.
---
 package/Config.in          |    1 +
 package/cpuload/Config.in  |    8 ++++++++
 package/cpuload/cpuload.mk |   13 +++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/cpuload/Config.in
 create mode 100644 package/cpuload/cpuload.mk

diff --git a/package/Config.in b/package/Config.in
index f308de7..c9ad06a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -663,6 +663,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
 endif
 source "package/bwm-ng/Config.in"
+source "package/cpuload/Config.in"
 source "package/htop/Config.in"
 source "package/kmod/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/cpuload/Config.in b/package/cpuload/Config.in
new file mode 100644
index 0000000..82bc450
--- /dev/null
+++ b/package/cpuload/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CPULOAD
+	bool "cpuload"
+	help
+	  cpuload is a simple tool to obtain intuitive vision of CPU load
+	  (including total, user, system, irq and softirq) within a certain
+	  time, which is especially useful for embedded system without GUI.
+
+	  https://github.com/kelvincheung/cpuload
diff --git a/package/cpuload/cpuload.mk b/package/cpuload/cpuload.mk
new file mode 100644
index 0000000..d25c504
--- /dev/null
+++ b/package/cpuload/cpuload.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# cpuload
+#
+#############################################################
+
+CPULOAD_VERSION = v0.3
+CPULOAD_SITE = git://github.com/kelvincheung/cpuload.git
+CPULOAD_LICENSE = GPLv2
+CPULOAD_LICENSE_FILES = COPYING
+
+
+$(eval $(autotools-package))
-- 
1.7.1

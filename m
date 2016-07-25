From: Joel Stanley <joel@jms.id.au>
Date: Mon, 25 Jul 2016 15:46:32 +0930
Subject: [Buildroot] [PATCH] package/pdbg: new package
Message-ID: <1469427392-25228-1-git-send-email-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PowerPC FSI Debugger, for low level debugging of a Power8 CPU over FSI.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/pdbg/Config.in |  6 ++++++
 package/pdbg/pdbg.mk   | 14 ++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/pdbg/Config.in
 create mode 100644 package/pdbg/pdbg.mk

diff --git a/package/pdbg/Config.in b/package/pdbg/Config.in
new file mode 100644
index 000000000000..f25867fa2c41
--- /dev/null
+++ b/package/pdbg/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PDBG
+	bool "pdbg"
+	depends on BR2_arm
+	help
+	  PowerPC FSI Debugger, for low level debugging of a PowerPC CPU
+	  over FSI.
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
new file mode 100644
index 000000000000..48444567bee3
--- /dev/null
+++ b/package/pdbg/pdbg.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# pdbg
+#
+################################################################################
+
+PDBG_VERSION = 90a7370a11e727f1482dea6ff2bd6aec20c64805
+
+PDBG_SITE = $(call github,open-power,pdbg,$(PDBG_VERSION))
+PDBG_LICENSE = Apache 2.0
+PDBG_LICENSE_FILES = COPYING
+PDBG_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.8.1

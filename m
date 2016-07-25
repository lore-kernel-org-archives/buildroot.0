From: Joel Stanley <joel@jms.id.au>
Date: Mon, 25 Jul 2016 16:23:12 +0930
Subject: [Buildroot] [PATCH v2] package/pdbg: new package
In-Reply-To: <1469427392-25228-1-git-send-email-joel@jms.id.au>
References: <1469427392-25228-1-git-send-email-joel@jms.id.au>
Message-ID: <1469429593-28546-1-git-send-email-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PowerPC FSI Debugger, for low level debugging of a Power8 CPU over FSI.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - Fix whitespace in pdbg.mk
 - Add URL to help text

 package/pdbg/Config.in |  8 ++++++++
 package/pdbg/pdbg.mk   | 13 +++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 package/pdbg/Config.in
 create mode 100644 package/pdbg/pdbg.mk

diff --git a/package/pdbg/Config.in b/package/pdbg/Config.in
new file mode 100644
index 000000000000..cf37eb8aca41
--- /dev/null
+++ b/package/pdbg/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PDBG
+	bool "pdbg"
+	depends on BR2_arm
+	help
+	  PowerPC FSI Debugger, for low level debugging of a PowerPC CPU
+	  over FSI.
+
+	  https://github.com/open-power/pdbg
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
new file mode 100644
index 000000000000..9cc05cd728c0
--- /dev/null
+++ b/package/pdbg/pdbg.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# pdbg
+#
+################################################################################
+
+PDBG_VERSION = 90a7370a11e727f1482dea6ff2bd6aec20c64805
+PDBG_SITE = $(call github,open-power,pdbg,$(PDBG_VERSION))
+PDBG_LICENSE = Apache 2.0
+PDBG_LICENSE_FILES = COPYING
+PDBG_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.8.1

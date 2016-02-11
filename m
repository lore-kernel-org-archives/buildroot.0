From: Julian Scheel <julian@jusst.de>
Date: Thu, 11 Feb 2016 10:05:08 -0500
Subject: [Buildroot] [RFC PATCH 1/3] Add package tegrarcm
In-Reply-To: <1455203110-16759-1-git-send-email-julian@jusst.de>
References: <1455203110-16759-1-git-send-email-julian@jusst.de>
Message-ID: <1455203110-16759-2-git-send-email-julian@jusst.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add package for the tegrarcm host utility that allows loading data to tegra
processors in recovery mode.

Signed-off-by: Julian Scheel <julian@jusst.de>
---
 package/Config.in.host          |  1 +
 package/tegrarcm/Config.in.host |  7 +++++++
 package/tegrarcm/tegrarcm.hash  |  2 ++
 package/tegrarcm/tegrarcm.mk    | 15 +++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/tegrarcm/Config.in.host
 create mode 100644 package/tegrarcm/tegrarcm.hash
 create mode 100644 package/tegrarcm/tegrarcm.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index ce1b6bc..05e0644 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -27,6 +27,7 @@ menu "Host utilities"
 	source "package/sam-ba/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
+	source "package/tegrarcm/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
 
diff --git a/package/tegrarcm/Config.in.host b/package/tegrarcm/Config.in.host
new file mode 100644
index 0000000..fb28d2a
--- /dev/null
+++ b/package/tegrarcm/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_TEGRARCM
+	bool "host tegrarcm"
+	help
+	  This program is used to send code to a Tegra device in recovery
+	  mode.
+
+	  https://github.com/NVIDIA/tegrarcm
diff --git a/package/tegrarcm/tegrarcm.hash b/package/tegrarcm/tegrarcm.hash
new file mode 100644
index 0000000..965c9ac
--- /dev/null
+++ b/package/tegrarcm/tegrarcm.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  538cb0af237ab33e070d3aeb6cc828cd7ef453753ba2ccc21b87ed43faac51bd  v1.7.tar.gz
diff --git a/package/tegrarcm/tegrarcm.mk b/package/tegrarcm/tegrarcm.mk
new file mode 100644
index 0000000..9f8f017
--- /dev/null
+++ b/package/tegrarcm/tegrarcm.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# tegrarcm
+#
+################################################################################
+
+TEGRARCM_VERSION = 1.7
+TEGRARCM_SOURCE = v$(TEGRARCM_VERSION).tar.gz
+TEGRARCM_SITE = https://github.com/NVIDIA/tegrarcm/archive
+TEGRARCM_LICENSE = NVIDIA Software License
+TEGRARCM_LICENSE_FILE = LICENSE
+TEGRARCM_AUTORECONF = YES
+HOST_TEGRARCM_DEPENDENCIES = host-libusb host-pkgconf
+
+$(eval $(host-autotools-package))
-- 
2.7.0

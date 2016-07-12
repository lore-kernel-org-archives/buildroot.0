From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 12 Jul 2016 10:26:26 +0200
Subject: [Buildroot] [PATCH 5/7] new package: ti-sgx/ti-sgx-demos SGX binary
	demos
In-Reply-To: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
References: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <1468311988-22059-6-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package adds the SGX demos from Imagination Technologies.
The demos are available as binaries only.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 package/ti-sgx/ti-sgx-demos/Config.in         |  4 ++++
 package/ti-sgx/ti-sgx-demos/ti-sgx-demos.hash |  2 ++
 package/ti-sgx/ti-sgx-demos/ti-sgx-demos.mk   | 20 ++++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/ti-sgx/ti-sgx-demos/Config.in
 create mode 100644 package/ti-sgx/ti-sgx-demos/ti-sgx-demos.hash
 create mode 100644 package/ti-sgx/ti-sgx-demos/ti-sgx-demos.mk

diff --git a/package/ti-sgx/ti-sgx-demos/Config.in b/package/ti-sgx/ti-sgx-demos/Config.in
new file mode 100644
index 0000000..e4d4321
--- /dev/null
+++ b/package/ti-sgx/ti-sgx-demos/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_TI_SGX_DEMOS
+	bool "sgx powervr demo binaries"
+	help
+	  TI SGX powervr demos
diff --git a/package/ti-sgx/ti-sgx-demos/ti-sgx-demos.hash b/package/ti-sgx/ti-sgx-demos/ti-sgx-demos.hash
new file mode 100644
index 0000000..43acf91
--- /dev/null
+++ b/package/ti-sgx/ti-sgx-demos/ti-sgx-demos.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 9d1d4da2c2b35303e239f99eb4003b8b206078a682aa083d5fb831ee4197f3bf ti-sgx-demos-f24650bc8243b25c23d6a0a502ed79fc472ac424.tar.gz
diff --git a/package/ti-sgx/ti-sgx-demos/ti-sgx-demos.mk b/package/ti-sgx/ti-sgx-demos/ti-sgx-demos.mk
new file mode 100644
index 0000000..04389f1
--- /dev/null
+++ b/package/ti-sgx/ti-sgx-demos/ti-sgx-demos.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# ti-sgx-demos
+#
+################################################################################
+
+# This correpsonds to SDK 02.00.00.00
+TI_SGX_DEMOS_VERSION = f24650bc8243b25c23d6a0a502ed79fc472ac424
+TI_SGX_DEMOS_SITE = git://git.ti.com/graphics/img-pvr-sdk.git
+TI_SGX_DEMOS_LICENSE = Imagination Technogolies License Agreement 
+TI_SGX_DEMOS_LICENSE_FILES = LegalNotice.txt
+
+TI_SGX_DEMOS_DEPENDENCIES =  ti-sgx-km ti-sgx-um 
+
+define TI_SGX_DEMOS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0555 -t $(TARGET_DIR)/usr/bin \
+                $(@D)/targetfs/Examples/Advanced/OGLES* 
+endef
+
+$(eval $(generic-package))
-- 
1.9.1

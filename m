From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
Date: Thu,  5 Jul 2018 08:57:53 +0200
Subject: [Buildroot] [PATCH 1/3] ti-sgx-libgbm: new package
Message-ID: <1530773875-19452-1-git-send-email-tolvupostur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ti-sgx-libgbm is a required package for ti-sgx-um in SDK 4.00

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
---
 package/Config.in                        |  1 +
 package/ti-sgx-libgbm/Config.in          |  9 +++++++++
 package/ti-sgx-libgbm/ti-sgx-libgbm.hash |  3 +++
 package/ti-sgx-libgbm/ti-sgx-libgbm.mk   | 17 +++++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/ti-sgx-libgbm/Config.in
 create mode 100644 package/ti-sgx-libgbm/ti-sgx-libgbm.hash
 create mode 100644 package/ti-sgx-libgbm/ti-sgx-libgbm.mk

diff --git a/package/Config.in b/package/Config.in
index 20fe5ad..c2046a1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -522,6 +522,7 @@ endmenu
 	source "package/ti-sgx-demos/Config.in"
 	source "package/ti-sgx-km/Config.in"
 	source "package/ti-sgx-um/Config.in"
+	source "package/ti-sgx-libgbm/Config.in"
 	source "package/ti-uim/Config.in"
 	source "package/ti-utils/Config.in"
 	source "package/triggerhappy/Config.in"
diff --git a/package/ti-sgx-libgbm/Config.in b/package/ti-sgx-libgbm/Config.in
new file mode 100644
index 0000000..07536d9
--- /dev/null
+++ b/package/ti-sgx-libgbm/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_TI_SGX_LIBGBM
+	bool "ti-sgx-libgbm"
+	depends on BR2_PACKAGE_TI_SGX_KM
+	select BR2_PACKAGE_WAYLAND
+	help
+	  This package provides libgbm.so.2 for the
+	  TI SGX implementation
+
+	  https://git.ti.com/glsdk/libgbm
diff --git a/package/ti-sgx-libgbm/ti-sgx-libgbm.hash b/package/ti-sgx-libgbm/ti-sgx-libgbm.hash
new file mode 100644
index 0000000..ffcf134
--- /dev/null
+++ b/package/ti-sgx-libgbm/ti-sgx-libgbm.hash
@@ -0,0 +1,3 @@
+# locally computed:
+sha256 758872d87137a919274bdbb9b9c811e2f309ab0338e58a4c67df6db7b2a6c6f5 ti-sgx-libgbm-43cc786d0e5b8274fa93048c7f3bb8d6b62522db.tar.gz
+sha256 dd6e66175f7f4ffe27f5f4dcc35005e07e6ef3aae2ec6fafaf52a53adb450cc1 debian/copyright
diff --git a/package/ti-sgx-libgbm/ti-sgx-libgbm.mk b/package/ti-sgx-libgbm/ti-sgx-libgbm.mk
new file mode 100644
index 0000000..29f6866
--- /dev/null
+++ b/package/ti-sgx-libgbm/ti-sgx-libgbm.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# ti-sgx-libgbm
+#
+################################################################################
+
+# This is the current "next" branch, which corresponds to SDK 04.00.00.00
+TI_SGX_LIBGBM_VERSION = 43cc786d0e5b8274fa93048c7f3bb8d6b62522db
+TI_SGX_LIBGBM_SITE = git://git.ti.com/glsdk/libgbm.git
+TI_SGX_LIBGBM_INSTALL_STAGING = YES
+TI_SGX_LIBGBM_AUTORECONF = YES
+TI_SGX_LIBGBM_LICENSE = MIT
+TI_SGX_LIBGBM_LICENSE_FILES = debian/copyright
+
+TI_SGX_LIBGBM_DEPENDENCIES = wayland
+
+$(eval $(autotools-package))
-- 
2.7.4

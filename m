From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
Date: Fri, 30 Nov 2018 13:01:19 +0100
Subject: [Buildroot] [PATCH 1/5] package/ti-sgx-um: Add dependency on wayland
In-Reply-To: <1543579283-20496-1-git-send-email-tolvupostur@gmail.com>
References: <1543579283-20496-1-git-send-email-tolvupostur@gmail.com>
Message-ID: <1543579283-20496-2-git-send-email-tolvupostur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
---
 package/ti-sgx-um/Config.in    | 2 ++
 package/ti-sgx-um/ti-sgx-um.mk | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/ti-sgx-um/Config.in b/package/ti-sgx-um/Config.in
index e448a4b..7f0c386 100644
--- a/package/ti-sgx-um/Config.in
+++ b/package/ti-sgx-um/Config.in
@@ -11,8 +11,10 @@ config BR2_PACKAGE_TI_SGX_UM
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_OMAP
 	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_POWERVR
+	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_TI_SGX_LIBGBM
 	help
 	  Graphics libraries for TI CPUs with SGX5xx GPU.
diff --git a/package/ti-sgx-um/ti-sgx-um.mk b/package/ti-sgx-um/ti-sgx-um.mk
index c252ea1..47a3bb0 100644
--- a/package/ti-sgx-um/ti-sgx-um.mk
+++ b/package/ti-sgx-um/ti-sgx-um.mk
@@ -15,6 +15,7 @@ TI_SGX_UM_INSTALL_STAGING = YES
 TI_SGX_UM_DEPENDENCIES = libdrm
 # ti-sgx-libgbm must be built before QT to find EGL
 TI_SGX_UM_DEPENDENCIES += ti-sgx-libgbm
+TI_SGX_UM_DEPENDENCIES += wayland
 
 # NOTE: TI_SGX_UM is intentionally using TI_SGX_KM variables
 ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM335X),y)
-- 
2.7.4

From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 30 Oct 2020 08:50:45 +0100
Subject: [Buildroot] [PATCH 8/8] configs/qemu_arm_vexpress_tz_defconfig:
 embed openssl library
In-Reply-To: <20201030075045.6960-1-etienne.carriere@linaro.org>
References: <20201030075045.6960-1-etienne.carriere@linaro.org>
Message-ID: <20201030075045.6960-8-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Embed openssl library to enable some OP-TEE tests that relies on it.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 configs/qemu_arm_vexpress_tz_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index 66ce636ce0..c7de60a720 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -54,3 +54,7 @@ BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
 
 # optee-test needs toolchain C++
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+# Embed OpenSSL library for some optee-test tests
+BR2_PACKAGE_OPENSSL=y
+BR2_PACKAGE_LIBOPENSSL=y
-- 
2.17.1

From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 14 Dec 2017 23:54:26 +0100
Subject: [Buildroot] [PATCH 3/3] toolchain-external: bump version of Linaro
 AArch64 toolchain to 2017.11
In-Reply-To: <20171214225426.3654-1-romain.naour@gmail.com>
References: <20171214225426.3654-1-romain.naour@gmail.com>
Message-ID: <20171214225426.3654-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://releases.linaro.org/components/toolchain/binaries/6.4-2017.11

Tested with qemu_aarch64_virt_defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external/toolchain-external-linaro-aarch64/Config.in    | 2 +-
 .../toolchain-external-linaro-aarch64.hash                            | 4 ++--
 .../toolchain-external-linaro-aarch64.mk                              | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
index 0a9e60a..bcc1128 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
-	bool "Linaro AArch64 2017.08"
+	bool "Linaro AArch64 2017.11"
 	depends on BR2_aarch64
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
index 2360280..ecd4f31 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 6365480ab93e30185ffd33070b9332e0caa2c3c0813dd71bfbc83d300b76b4c9  gcc-linaro-6.4.1-2017.08-i686_aarch64-linux-gnu.tar.xz
-sha256 f507d071c6969665e26c595d6d952d7b18eb11609a71cb6debbafb55d700522a  gcc-linaro-6.4.1-2017.08-x86_64_aarch64-linux-gnu.tar.xz
+sha256 7c5af17ab8c9b29367f839639f165db0e341f732553953f88a37d0721d3536a7  gcc-linaro-6.4.1-2017.11-i686_aarch64-linux-gnu.tar.xz
+sha256 7929a58f2e461f614641ca3a90a64336bde2abe6925cf39d3846b50960249b15  gcc-linaro-6.4.1-2017.11-x86_64_aarch64-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
index 6053ea7..ed334fd 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION = 2017.08
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION = 2017.11
 TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SITE = https://releases.linaro.org/components/toolchain/binaries/6.4-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)/aarch64-linux-gnu
 
 ifeq ($(HOSTARCH),x86)
-- 
2.9.5

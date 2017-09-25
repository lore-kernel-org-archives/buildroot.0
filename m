From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 25 Sep 2017 22:08:12 +0200
Subject: [Buildroot] [PATCH 3/3] toolchain-external: bump version of Linaro
	AArch64 toolchain to 2017.08
In-Reply-To: <20170925200812.4917-1-romain.naour@gmail.com>
References: <20170925200812.4917-1-romain.naour@gmail.com>
Message-ID: <20170925200812.4917-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GDB has been updated to 8.0 version in the release.

https://releases.linaro.org/components/toolchain/binaries/6.4-2017.08

Tested with qemu_aarch64_virt_defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-linaro-aarch64/Config.in                   | 2 +-
 .../toolchain-external-linaro-aarch64.hash                        | 4 ++--
 .../toolchain-external-linaro-aarch64.mk                          | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
index caa5ed3..5f66f56 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
-	bool "Linaro AArch64 2017.02"
+	bool "Linaro AArch64 2017.08"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
index 2379290..2360280 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e8d1dba8712e3f3994faf742d5c5dff7deba69f94e9655b1e673df7f26b0908b  gcc-linaro-6.3.1-2017.02-i686_aarch64-linux-gnu.tar.xz
-sha256 10670e1c5d2ab77b937a26cc7f2a22e8eb6cb223e2df7c763f02ce63339e66bc  gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu.tar.xz
+sha256 6365480ab93e30185ffd33070b9332e0caa2c3c0813dd71bfbc83d300b76b4c9  gcc-linaro-6.4.1-2017.08-i686_aarch64-linux-gnu.tar.xz
+sha256 f507d071c6969665e26c595d6d952d7b18eb11609a71cb6debbafb55d700522a  gcc-linaro-6.4.1-2017.08-x86_64_aarch64-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
index ff3d3db..6053ea7 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION = 2017.02
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SITE = https://releases.linaro.org/components/toolchain/binaries/6.3-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)/aarch64-linux-gnu
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION = 2017.08
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SITE = https://releases.linaro.org/components/toolchain/binaries/6.4-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)/aarch64-linux-gnu
 
 ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-6.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-i686_aarch64-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-i686_aarch64-linux-gnu.tar.xz
 else
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-6.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-x86_64_aarch64-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-x86_64_aarch64-linux-gnu.tar.xz
 endif
 
 $(eval $(toolchain-external-package))
-- 
2.9.5

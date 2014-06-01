From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  1 Jun 2014 12:47:44 +0200
Subject: [Buildroot] [PATCH 07/11] toolchain-external: bump Linaro AArch64
	toolchain to 2014.05
In-Reply-To: <1401619668-28062-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1401619668-28062-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1401619668-28062-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             | 2 +-
 toolchain/toolchain-external/toolchain-external.mk | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index dcdd383..8fca01a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -782,7 +782,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	  http://wiki.xilinx.com/mb-gnu-tools
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
-	bool "Linaro AArch64 14.02"
+	bool "Linaro AArch64 14.05"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_PREFER_STATIC_LIB
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 8185c89..a6c4061 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -351,8 +351,8 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
 TOOLCHAIN_EXTERNAL_SOURCE = microblaze-unknown-linux-gnu.tgz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64),y)
-TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.02/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2014.02_linux.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.05/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.05_linux.tar.xz
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
 TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-1.0.0/
-- 
1.9.3

From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  6 May 2019 20:30:03 +0200
Subject: [Buildroot] [PATCH 07/15] toolchain-external: add gcc 9 entry
In-Reply-To: <20190506183011.4856-1-romain.naour@gmail.com>
References: <20190506183011.4856-1-romain.naour@gmail.com>
Message-ID: <20190506183011.4856-8-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allows to use an external toolchain based on gcc 9.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external/toolchain-external-custom/Config.in.options  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index cb7095632f..a2cc97f936 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -27,6 +27,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 choice
 	bool "External toolchain gcc version"
+	default BR2_TOOLCHAIN_EXTERNAL_GCC_9   if BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 	default BR2_TOOLCHAIN_EXTERNAL_GCC_8   if BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	default BR2_TOOLCHAIN_EXTERNAL_GCC_7   if BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	default BR2_TOOLCHAIN_EXTERNAL_GCC_6   if BR2_ARCH_NEEDS_GCC_AT_LEAST_6
@@ -38,8 +39,13 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_9
+	bool "9.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_8
 	bool "8.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_7
-- 
2.14.5

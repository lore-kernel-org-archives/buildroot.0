From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 27 May 2018 22:30:27 +0200
Subject: [Buildroot] [PATCH v2 for-next 3/4] toolchain-external: add gcc 8
 entry
In-Reply-To: <20180527203028.26146-1-romain.naour@gmail.com>
References: <20180527203028.26146-1-romain.naour@gmail.com>
Message-ID: <20180527203028.26146-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allow to use an external toolchain based on gcc 8.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external/toolchain-external-custom/Config.in.options  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 55370e967a..2ef1126740 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -27,6 +27,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 choice
 	bool "External toolchain gcc version"
+	default BR2_TOOLCHAIN_EXTERNAL_GCC_8   if BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	default BR2_TOOLCHAIN_EXTERNAL_GCC_7   if BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	default BR2_TOOLCHAIN_EXTERNAL_GCC_6   if BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	default BR2_TOOLCHAIN_EXTERNAL_GCC_5   if BR2_ARCH_NEEDS_GCC_AT_LEAST_5
@@ -37,8 +38,13 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_8
+	bool "8.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_7
 	bool "7.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_6
-- 
2.14.3

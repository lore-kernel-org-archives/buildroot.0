From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 May 2018 21:45:19 +0200
Subject: [Buildroot] [git commit branch/next] toolchain-external: add gcc 8
 entry
Message-ID: <20180530202335.C29F28351F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86220d0973bbf24113fa57368bf2d8bbc57e98a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch allows to use an external toolchain based on gcc 8.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

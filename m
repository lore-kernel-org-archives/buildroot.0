From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Mar 2012 23:38:39 +0100
Subject: [Buildroot] [git commit] toolchain-external: add linaro 2012.02
Message-ID: <20120306223952.86F6690D16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6131e47af0359c1cfb92bfebebb1890802e8cfb0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in   |   15 +++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    3 +++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 9db5cb6..7f57952 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -3,6 +3,20 @@ if BR2_TOOLCHAIN_EXTERNAL
 choice
 	prompt "Toolchain"
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_02
+	bool "Linaro 2012.02"
+	depends on BR2_arm
+	depends on BR2_cortex_a8 || BR2_cortex_a9
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Linaro toolchain for the ARM architecture. It uses Linaro
+	  GCC 2012.02 (based on gcc 4.6), Linaro GDB 2012.02, eglibc
+	  2.13. It generates code that runs on all Cortex-A profile
+	  devices, but tuned for the Cortex-A9. The code generated is
+	  Thumb 2, with the softfp calling convention, and uses the
+	  VFPv3-D16 FPU instructions.
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_01
 	bool "Linaro 2012.01"
 	depends on BR2_arm
@@ -448,6 +462,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
 	default "arm-linux-gnueabi"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_01
+	default "arm-linux-gnueabi"	 if BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_02
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index a638381..01ab91f 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -190,6 +190,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gn
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_01),y)
 TOOLCHAIN_EXTERNAL_SITE=http://launchpad.net/linaro-toolchain-binaries/trunk/2012.01/+download/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabi-2012.01-20120125_linux.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_02),y)
+TOOLCHAIN_EXTERNAL_SITE=http://launchpad.net/linaro-toolchain-binaries/trunk/2012.02/+download/
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabi-2012.02-20120222_linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/mips/portal/package7401/public/mips-linux-gnu/
 TOOLCHAIN_EXTERNAL_SOURCE=mips-4.4-303-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2

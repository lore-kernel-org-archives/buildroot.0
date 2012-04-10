From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Apr 2012 18:10:46 +0200
Subject: [Buildroot] [PATCH 2/5] toolchain: add Coldfire external toolchain
	from Sourcery CodeBench
In-Reply-To: <cover.1334074065.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334074065.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b8f16be0b2356d468d5f3f95bd525fb6d94159fe.1334074065.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   41 ++++++++++++++++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    3 ++
 2 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 49ea7fa..d7b694a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -470,6 +470,46 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	  Toolchain for the Microblaze architecture, from
 	  http://wiki.xilinx.com/mb-gnu-tools
 
+config BR2_TOOLCHAIN_EXTERNAL_SOURCERY_CODEBENCH_FREESCALE_COLDFIRE_201109
+        bool "Sourcery CodeBench Freescale Coldfire 2011.09"
+	depends on BR2_m68k
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_LARGEFILE
+	select BR2_INET_RPC
+	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	help
+	  Sourcery CodeBench toolchain for the m68k Coldfire
+	  architecture, from Mentor Graphics. It uses gcc 4.6.1,
+	  binutils 2.21.53, uClibc 0.9.30, gdb 7.2.50 and kernel
+	  headers 3.0.1. It has support for the following variants:
+	    - MCF5206
+	    - MCF51QE
+	    - MCF5206E
+	    - MCF5208
+	    - MCF5307
+	    - MCF532X/7X
+	    - MCF5407
+	    - MCF54455
+	    - MCF5206, with separated data
+	    - MCF5206, with ID-shared-library
+	    - MCF51QE, with separated data
+	    - MCF51QE, with ID-shared-library
+	    - MCF5206E, with separated data
+	    - MCF5206E, with ID-shared-library
+	    - MCF5208, with separated data
+	    - MCF5208, with ID-shared-library
+	    - MCF5307, with separated data
+	    - MCF5307, with ID-shared-library
+	    - MCF532X/7X, with separated data
+	    - MCF532X/7X, with ID-shared-library
+	    - MCF5407, with separated data
+	    - MCF5407, with ID-shared-library
+	    - MCF54455, with separated data
+	    - MCF54455, with ID-shared-library
+
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM
        bool "Custom toolchain"
        help
@@ -525,6 +565,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1 && BR2_BFIN_FDPIC
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1 && !BR2_BFIN_FDPIC
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1 && BR2_BFIN_FDPIC
+	default "m68k-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_SOURCERY_CODEBENCH_FREESCALE_COLDFIRE_201109
 	default $(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX) \
 					 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 0a997a5..5700b0e 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -248,6 +248,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=microblazeel-unknown-linux-gnu.tgz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
 TOOLCHAIN_EXTERNAL_SITE=http://git.xilinx.com/?p=xldk/microblaze_v2.0.git;a=blob;h=71e031ae990e063a5718f90d30cf97ad85e2f565;hb=569081301f0f1d8d3b24335a364e8ff1774190d4;f=
 TOOLCHAIN_EXTERNAL_SOURCE=microblaze-unknown-linux-gnu.tgz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SOURCERY_CODEBENCH_FREESCALE_COLDFIRE_201109),y)
+TOOLCHAIN_EXTERNAL_SITE=???
+TOOLCHAIN_EXTERNAL_SOURCE=freescale-coldfire-2011.09-23-m68k-uclinux-i686-pc-linux-gnu.tar.bz2
 else
 # A value must be set (even if unused), otherwise the
 # $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) rule would override the main
-- 
1.7.4.1

From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun,  1 Apr 2018 02:08:40 -0300
Subject: [Buildroot] [PATCH v2 27/37] arch/Config.in*: re-wrap help text
In-Reply-To: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
Message-ID: <20180401050850.5701-28-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... to follow the convention <tab><2 spaces><62 chars>.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - no changes
---
 arch/Config.in        | 97 ++++++++++++++++++++++++++++-----------------------
 arch/Config.in.mips   |  4 +--
 arch/Config.in.xtensa | 12 +++----
 3 files changed, 61 insertions(+), 52 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index dd972bc0ee..65448e9339 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -28,24 +28,25 @@ config BR2_arcle
 	bool "ARC (little endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
-	  Synopsys' DesignWare ARC Processor Cores are a family of 32-bit CPUs
-	  that can be used from deeply embedded to high performance host
-	  applications. Little endian.
+	  Synopsys' DesignWare ARC Processor Cores are a family of
+	  32-bit CPUs that can be used from deeply embedded to high
+	  performance host applications. Little endian.
 
 config BR2_arceb
 	bool "ARC (big endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
-	  Synopsys' DesignWare ARC Processor Cores are a family of 32-bit CPUs
-	  that can be used from deeply embedded to high performance host
-	  applications. Big endian.
+	  Synopsys' DesignWare ARC Processor Cores are a family of
+	  32-bit CPUs that can be used from deeply embedded to high
+	  performance host applications. Big endian.
 
 config BR2_arm
 	bool "ARM (little endian)"
 	# MMU support is set by the subarchitecture file, arch/Config.in.arm
 	help
-	  ARM is a 32-bit reduced instruction set computer (RISC) instruction
-	  set architecture (ISA) developed by ARM Holdings. Little endian.
+	  ARM is a 32-bit reduced instruction set computer (RISC)
+	  instruction set architecture (ISA) developed by ARM Holdings.
+	  Little endian.
 	  http://www.arm.com/
 	  http://en.wikipedia.org/wiki/ARM
 
@@ -53,8 +54,9 @@ config BR2_armeb
 	bool "ARM (big endian)"
 	# MMU support is set by the subarchitecture file, arch/Config.in.arm
 	help
-	  ARM is a 32-bit reduced instruction set computer (RISC) instruction
-	  set architecture (ISA) developed by ARM Holdings. Big endian.
+	  ARM is a 32-bit reduced instruction set computer (RISC)
+	  instruction set architecture (ISA) developed by ARM Holdings.
+	  Big endian.
 	  http://www.arm.com/
 	  http://en.wikipedia.org/wiki/ARM
 
@@ -81,8 +83,8 @@ config BR2_bfin
 	select BR2_ARCH_HAS_FDPIC_SUPPORT
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	help
-	  The Blackfin is a family of 16 or 32-bit microprocessors developed,
-	  manufactured and marketed by Analog Devices.
+	  The Blackfin is a family of 16 or 32-bit microprocessors
+	  developed, manufactured and marketed by Analog Devices.
 	  http://www.analog.com/
 	  http://en.wikipedia.org/wiki/Blackfin
 
@@ -113,8 +115,8 @@ config BR2_microblazeel
 	bool "Microblaze AXI (little endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
-	  Soft processor core designed for Xilinx FPGAs from Xilinx. AXI bus
-	  based architecture (little endian)
+	  Soft processor core designed for Xilinx FPGAs from Xilinx. AXI
+	  bus based architecture (little endian)
 	  http://www.xilinx.com
 	  http://en.wikipedia.org/wiki/Microblaze
 
@@ -122,8 +124,8 @@ config BR2_microblazebe
 	bool "Microblaze non-AXI (big endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
-	  Soft processor core designed for Xilinx FPGAs from Xilinx. PLB bus
-	  based architecture (non-AXI, big endian)
+	  Soft processor core designed for Xilinx FPGAs from Xilinx. PLB
+	  bus based architecture (non-AXI, big endian)
 	  http://www.xilinx.com
 	  http://en.wikipedia.org/wiki/Microblaze
 
@@ -131,7 +133,8 @@ config BR2_mips
 	bool "MIPS (big endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
-	  MIPS is a RISC microprocessor from MIPS Technologies. Big endian.
+	  MIPS is a RISC microprocessor from MIPS Technologies. Big
+	  endian.
 	  http://www.mips.com/
 	  http://en.wikipedia.org/wiki/MIPS_Technologies
 
@@ -139,7 +142,8 @@ config BR2_mipsel
 	bool "MIPS (little endian)"
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
-	  MIPS is a RISC microprocessor from MIPS Technologies. Little endian.
+	  MIPS is a RISC microprocessor from MIPS Technologies. Little
+	  endian.
 	  http://www.mips.com/
 	  http://en.wikipedia.org/wiki/MIPS_Technologies
 
@@ -148,7 +152,8 @@ config BR2_mips64
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
-	  MIPS is a RISC microprocessor from MIPS Technologies. Big endian.
+	  MIPS is a RISC microprocessor from MIPS Technologies. Big
+	  endian.
 	  http://www.mips.com/
 	  http://en.wikipedia.org/wiki/MIPS_Technologies
 
@@ -157,7 +162,8 @@ config BR2_mips64el
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
-	  MIPS is a RISC microprocessor from MIPS Technologies. Little endian.
+	  MIPS is a RISC microprocessor from MIPS Technologies. Little
+	  endian.
 	  http://www.mips.com/
 	  http://en.wikipedia.org/wiki/MIPS_Technologies
 
@@ -180,8 +186,8 @@ config BR2_powerpc
 	bool "PowerPC"
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
-	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
-	  Big endian.
+	  PowerPC is a RISC architecture created by Apple-IBM-Motorola
+	  alliance. Big endian.
 	  http://www.power.org/
 	  http://en.wikipedia.org/wiki/Powerpc
 
@@ -190,8 +196,8 @@ config BR2_powerpc64
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
-	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
-	  Big endian.
+	  PowerPC is a RISC architecture created by Apple-IBM-Motorola
+	  alliance. Big endian.
 	  http://www.power.org/
 	  http://en.wikipedia.org/wiki/Powerpc
 
@@ -200,8 +206,8 @@ config BR2_powerpc64le
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
-	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
-	  Little endian.
+	  PowerPC is a RISC architecture created by Apple-IBM-Motorola
+	  alliance. Little endian.
 	  http://www.power.org/
 	  http://en.wikipedia.org/wiki/Powerpc
 
@@ -209,8 +215,9 @@ config BR2_sh
 	bool "SuperH"
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	help
-	  SuperH (or SH) is a 32-bit reduced instruction set computer (RISC)
-	  instruction set architecture (ISA) developed by Hitachi.
+	  SuperH (or SH) is a 32-bit reduced instruction set computer
+	  (RISC) instruction set architecture (ISA) developed by
+	  Hitachi.
 	  http://www.hitachi.com/
 	  http://en.wikipedia.org/wiki/SuperH
 
@@ -218,8 +225,9 @@ config BR2_sparc
 	bool "SPARC"
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
-	  SPARC (from Scalable Processor Architecture) is a RISC instruction
-	  set architecture (ISA) developed by Sun Microsystems.
+	  SPARC (from Scalable Processor Architecture) is a RISC
+	  instruction set architecture (ISA) developed by Sun
+	  Microsystems.
 	  http://www.oracle.com/sun
 	  http://en.wikipedia.org/wiki/Sparc
 
@@ -228,8 +236,9 @@ config BR2_sparc64
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
-	  SPARC (from Scalable Processor Architecture) is a RISC instruction
-	  set architecture (ISA) developed by Sun Microsystems.
+	  SPARC (from Scalable Processor Architecture) is a RISC
+	  instruction set architecture (ISA) developed by Sun
+	  Microsystems.
 	  http://www.oracle.com/sun
 	  http://en.wikipedia.org/wiki/Sparc
 
@@ -349,27 +358,27 @@ config BR2_BINFMT_ELF
 	depends on BR2_USE_MMU
 	select BR2_BINFMT_SUPPORTS_SHARED
 	help
-	  ELF (Executable and Linkable Format) is a format for libraries and
-	  executables used across different architectures and operating
-	  systems.
+	  ELF (Executable and Linkable Format) is a format for libraries
+	  and executables used across different architectures and
+	  operating systems.
 
 config BR2_BINFMT_FDPIC
 	bool "FDPIC"
 	depends on BR2_ARCH_HAS_FDPIC_SUPPORT
 	select BR2_BINFMT_SUPPORTS_SHARED
 	help
-	  ELF FDPIC binaries are based on ELF, but allow the individual load
-	  segments of a binary to be located in memory independently of each
-	  other. This makes this format ideal for use in environments where no
-	  MMU is available.
+	  ELF FDPIC binaries are based on ELF, but allow the individual
+	  load segments of a binary to be located in memory
+	  independently of each other. This makes this format ideal for
+	  use in environments where no MMU is available.
 
 config BR2_BINFMT_FLAT
 	bool "FLAT"
 	depends on !BR2_USE_MMU
 	help
-	  FLAT binary is a relatively simple and lightweight executable format
-	  based on the original a.out format. It is widely used in environment
-	  where no MMU is available.
+	  FLAT binary is a relatively simple and lightweight executable
+	  format based on the original a.out format. It is widely used
+	  in environment where no MMU is available.
 
 endchoice
 
@@ -393,8 +402,8 @@ config BR2_BINFMT_FLAT_SEP_DATA
 	# absolute jump" or "error: value -yyyyy out of range".
 	depends on BR2_bfin
 	help
-	  Allow for the data and text segments to be separated and placed in
-	  different regions of memory.
+	  Allow for the data and text segments to be separated and
+	  placed in different regions of memory.
 
 config BR2_BINFMT_FLAT_SHARED
 	bool "Shared binary"
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index cc11744f04..e45299f818 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -147,8 +147,8 @@ choice
 	default BR2_MIPS_FP32_MODE_XX
 	depends on !BR2_ARCH_IS_64 && !BR2_MIPS_SOFT_FLOAT
 	help
-	  MIPS32 supports different FP modes (32,xx,64). Information about FP
-	  modes can be found here:
+	  MIPS32 supports different FP modes (32,xx,64). Information
+	  about FP modes can be found here:
 	  https://sourceware.org/binutils/docs/as/MIPS-Options.html
 	  https://dmz-portal.imgtec.com/wiki/MIPS_O32_ABI_-_FR0_and_FR1_Interlinking#5._Generating_modeless_code
 
diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index 49e93a4774..14049480ec 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -20,13 +20,13 @@ config BR2_XTENSA_OVERLAY_FILE
 	  Enter the path to the overlay tarball for a custom processor
 	  configuration.
 
-	  These overlay files are tar packages with updated configuration
-	  files for various toolchain packages and Xtensa processor
-	  configurations. They are provided by the processor vendor or
-	  directly from Tensilica.
+	  These overlay files are tar packages with updated
+	  configuration files for various toolchain packages and Xtensa
+	  processor configurations. They are provided by the processor
+	  vendor or directly from Tensilica.
 
-	  The path can be either absolute, or relative to the top directory
-	  of buildroot.
+	  The path can be either absolute, or relative to the top
+	  directory of buildroot.
 
 choice
 	prompt "Target Architecture Endianness"
-- 
2.14.1

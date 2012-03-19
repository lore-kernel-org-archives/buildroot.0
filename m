From: Alvaro G. M <alvaro.gamez@hazent.com>
Date: Mon, 19 Mar 2012 22:56:06 +0100
Subject: [Buildroot] [PATCH] Config.in.arch: add help and less cryptic names
	to architecture menu
In-Reply-To: <1332112382-30786-1-git-send-email-alvaro.gamez@hazent.com>
References: <1332112382-30786-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <1332194166-30225-1-git-send-email-alvaro.gamez@hazent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Alvaro G. M" <alvaro.gamez@hazent.com>

Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
---
My editor previously tricked me with the tabs. This solves that and adds
newline after help. It's also prettier on menuconfig.
---
 target/Config.in.arch |  110 +++++++++++++++++++++++++++++++++++++++++++-----
 1 files changed, 98 insertions(+), 12 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 17e0236..a72ce80 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -8,40 +8,126 @@ choice
 	  Select the target architecture family to build for.
 
 config BR2_arm
-	bool "arm"
+	bool "ARM (little endian)"
+	help
+	  ARM is a 32-bit reduced instruction set computer (RISC) instruction
+	  set architecture (ISA) developed by ARM Holdings. Little endian.
+	  http://www.arm.com/
+	  http://en.wikipedia.org/wiki/ARM
+
 config BR2_armeb
-	bool "armeb"
+	bool "ARM (big endian)"
+	help
+	  ARM is a 32-bit reduced instruction set computer (RISC) instruction
+	  set architecture (ISA) developed by ARM Holdings. Big endian.
+	  http://www.arm.com/
+	  http://en.wikipedia.org/wiki/ARM
+
 config BR2_avr32
-	bool "avr32"
+	bool "AVR32"
 	select BR2_SOFT_FLOAT
+	help
+	  The AVR32 is a 32-bit RISC microprocessor architecture designed by
+	  Atmel.
+	  http://www.atmel.com/
+	  http://en.wikipedia.org/wiki/Avr32
+
 config BR2_bfin
-	bool "bfin"
+	bool "Blackfin"
+	help
+	  The Blackfin is a family of 16 or 32-bit microprocessors developed,
+	  manufactured and marketed by Analog Devices.
+	  http://www.analog.com/
+	  http://en.wikipedia.org/wiki/Blackfin
+
 config BR2_i386
 	bool "i386"
+	help
+	  Intel i386 architecture compatible microprocessor
+	  http://en.wikipedia.org/wiki/I386
+
 config BR2_m68k
 	bool "m68k"
 	depends on BROKEN # ice in uclibc / inet_ntoa_r
+	help
+	  Motorola 68000 family microprocessor
+	  http://en.wikipedia.org/wiki/M68k
+
 config BR2_microblazeel
-	bool "Microblaze AXI (little-endian)"
+	bool "Microblaze AXI (little endian)"
+	help
+	  Soft processor core designed for Xilinx FPGAs from Xilinx. AXI bus
+	  based architecture (little endian)
+	  http://www.xilinx.com
+	  http://en.wikipedia.org/wiki/Microblaze
+
 config BR2_microblazebe
 	bool "Microblaze non-AXI (big-endian)"
+	help
+	  Soft processor core designed for Xilinx FPGAs from Xilinx. PLB bus
+	  based architecture (non-AXI, big endian)
+	  http://www.xilinx.com
+	  http://en.wikipedia.org/wiki/Microblaze
+
 config BR2_mips
-	bool "mips"
+	bool "MIPS (big endian)"
+	help
+	  MIPS is a RISC microprocessor from MIPS Technologies. Big endian.
+	  http://www.mips.com/
+	  http://en.wikipedia.org/wiki/MIPS_Technologies
+
 config BR2_mipsel
-	bool "mipsel"
+	bool "MIPS (little endian)"
+	help
+	  MIPS is a RISC microprocessor from MIPS Technologies. Little endian.
+	  http://www.mips.com/
+	  http://en.wikipedia.org/wiki/MIPS_Technologies
+
 config BR2_powerpc
-	bool "powerpc"
+	bool "PowerPC"
+	help
+	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
+	  http://www.power.org/
+	  http://en.wikipedia.org/wiki/Powerpc
+
 config BR2_sh
-	bool "superh"
+	bool "SuperH"
+	help
+	  SuperH (or SH) is a 32-bit reduced instruction set computer (RISC)
+	  instruction set architecture (ISA) developed by Hitachi.
+	  http://www.hitachi.com/
+	  http://en.wikipedia.org/wiki/SuperH
+
 config BR2_sh64
-	bool "superh64"
+	bool "SuperH64"
+	help
+	  SuperH64 (or SH) is a 64-bit reduced instruction set computer (RISC)
+	  instruction set architecture (ISA) developed by Hitachi.
+	  http://www.hitachi.com/
+	  http://en.wikipedia.org/wiki/SuperH
+
 config BR2_sparc
-	bool "sparc"
+	bool "SPARC"
+	help
+	  SPARC (from Scalable Processor Architecture) is a RISC instruction
+	  set architecture (ISA) developed by Sun Microsystems.
+	  http://www.oracle.com/sun
+	  http://en.wikipedia.org/wiki/Sparc
+
 config BR2_x86_64
 	bool "x86_64"
 	select BR2_ARCH_IS_64
+	help
+	  x86-64 is an extension of the x86 instruction set (Intel i386
+	  architecture compatible microprocessor).
+	  http://en.wikipedia.org/wiki/X86_64
+
 config BR2_xtensa
-	bool "xtensa"
+	bool "Xtensa"
+	help
+	  Xtensa is a Tensilica processor IP architecture.
+	  http://en.wikipedia.org/wiki/Xtensa
+	  http://www.tensilica.com/
 endchoice
 
 config BR2_microblaze
-- 
1.7.9.1

From: mark roths <mroths@gmail.com>
Date: Thu, 14 Dec 2006 10:59:52 -0800
Subject: [Buildroot] problems building buildroot
Message-ID: <cd7850860612141059p73e6fcdu52f1b697737b0875@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to use buildroot to create an RFS for an ARM926 variant (Atmel
9261)
and I have the following problems:

- despite running 'make menuconfig' and selecting EABI and my target arch
and variant,
I am always prompted for 3 config variables as in the following:

Target Architecture
  1. alpha (TARGET_alpha)
> 2. arm (TARGET_arm)
  3. bfin (TARGET_bfin)
  4. cris (TARGET_cris)
  5. e1 (BROKEN) (TARGET_e1)
  6. frv (BROKEN) (TARGET_frv)
  7. h8300 (BROKEN) (TARGET_h8300)
  8. hppa (TARGET_hppa)
  9. i386 (TARGET_i386)
  10. i960 (BROKEN) (TARGET_i960)
  11. ia64 (TARGET_ia64)
  12. m68k (TARGET_m68k)
  13. microblaze (BROKEN) (TARGET_microblaze)
  14. mips (TARGET_mips)
  15. nios (TARGET_nios)
  16. nios2 (TARGET_nios2)
  17. powerpc (TARGET_powerpc)
  18. superh (TARGET_sh)
  19. sh64 (TARGET_sh64)
  20. sparc (TARGET_sparc)
  21. v850 (BROKEN) (TARGET_v850)
  22. vax (TARGET_vax)
  23. x86_64 (TARGET_x86_64)
choice[1-23?]: 2
*
* Target Architecture Features and Options
*
Target ABI
> 1. OABI (CONFIG_ARM_OABI) (NEW)
  2. EABI (CONFIG_ARM_EABI) (NEW)
choice[1-2?]: 2
Target Processor Type
> 1. Generic Arm (CONFIG_GENERIC_ARM) (NEW)
  2. Arm 610 (CONFIG_ARM610) (NEW)
  3. Arm 710 (CONFIG_ARM710) (NEW)
  4. Arm 7TDMI (CONFIG_ARM7TDMI) (NEW)
  5. Arm 720T (CONFIG_ARM720T) (NEW)
  6. Arm 920T (CONFIG_ARM920T) (NEW)
  7. Arm 922T (CONFIG_ARM922T) (NEW)
  8. Arm 926T (CONFIG_ARM926T) (NEW)
  9. Arm 10T (CONFIG_ARM10T) (NEW)
  10. Arm 1136JF-S (CONFIG_ARM1136JF_S) (NEW)
  11. Intel StrongArm SA-110 (CONFIG_ARM_SA110) (NEW)
  12. Intel StrongArm SA-1100 (CONFIG_ARM_SA1100) (NEW)
  13. Intel Xscale (CONFIG_ARM_XSCALE) (NEW)
  14. Intel Xscale With WMMX PXA27x (CONFIG_ARM_IWMMXT) (NEW)
choice[1-14?]:8

Next, some header files turn up missing during the build of busybox and it
seems that the arch info is not
getting communicated to the busybox build.  I saw some other posts on this,
but the fix suggested seems to be
a part of my makefiles already.  My work around is as follows:

made 2 softlinks in this dir:
buildroot/build_arm/staging_dir/arm-linux-uclibc/sys-include/asm
proc-armv -> proc
arch-at91rm9200 -> arch

Mark Roths
Softair Microsystems
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061214/bd581156/attachment.htm 

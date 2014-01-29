From: Peter Kuemmel <syntheticpp@gmx.net>
Date: Wed, 29 Jan 2014 21:04:48 +0100 (CET)
Subject: [Buildroot] Checking external toolchain for eabihf
Message-ID: <trinity-4638a8ed-2273-43ae-98d4-7c397937de06-1391025888641@3capp-gmx-bs12>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using only crtl1.o for detecting ABI is not enough here:
http://git.buildroot.net/buildroot/commit/?id=b2e88073dbf05faa47475bf96d5ccf8a45906a3c

I've build the compiler by buildroot:

.../usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/crt1.o:
Attribute Section: aeabi
File Attributes
  Tag_CPU_name: "7-A"
  Tag_CPU_arch: v7
  Tag_CPU_arch_profile: Application
  Tag_ARM_ISA_use: Yes
  Tag_THUMB_ISA_use: Thumb-2
  Tag_FP_arch: VFPv3


.../usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libm.so 
Attribute Section: aeabi
File Attributes
  Tag_CPU_name: "7-A"
  Tag_CPU_arch: v7
  Tag_CPU_arch_profile: Application
  Tag_ARM_ISA_use: Yes
  Tag_THUMB_ISA_use: Thumb-2
  Tag_FP_arch: VFPv3
  Tag_ABI_PCS_wchar_t: 4
  Tag_ABI_FP_denormal: Needed
  Tag_ABI_FP_exceptions: Needed
  Tag_ABI_FP_number_model: IEEE 754
  Tag_ABI_align_needed: 8-byte
  Tag_ABI_align_preserved: 8-byte, except leaf SP
  Tag_ABI_enum_size: int
  Tag_ABI_HardFP_use: SP and DP
  Tag_ABI_VFP_args: VFP registers
  Tag_ABI_optimization_goals: Aggressive Size
  Tag_CPU_unaligned_access: v6

Attached patch uses libm.so

Peter
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ext_abi.patch
Type: text/x-diff
Size: 662 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140129/ba183925/attachment.bin>

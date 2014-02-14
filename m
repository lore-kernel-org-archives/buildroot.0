From: Marcelo Gutierrez <kuyurix@gmail.com>
Date: Fri, 14 Feb 2014 14:02:58 -0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx: bump to version 5_01_00_01
In-Reply-To: <trinity-3b023d3c-da74-4988-b5b0-903e733840ee-1392375827799@3capp-gmx-bs16>
References: <52fd38fd.870eec0a.7f7f.13a5@mx.google.com>
 <CAEBucnAUUP3==KSjx_uXZpcjfk9KNwOQqhQ0Eb-hu2+J7wfcKQ@mail.gmail.com>
 <CA+kK6Ws34CaJSSsk1cjg1=OKUXpoURarO9d9sTS8CGO7dXqNtQ@mail.gmail.com>
 <trinity-1946d258-c976-4ab8-8bd0-b43588728ea6-1392371833737@3capp-gmx-bs31>
 <trinity-3b023d3c-da74-4988-b5b0-903e733840ee-1392375827799@3capp-gmx-bs16>
Message-ID: <CA+kK6WvnKsgiAeb3XZZ+vM=Xp2KHPOLu9Q2BKXJ5_jMahamQpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm using hardfloat:

$readelf -A output/target/bin/busybox
Attribute Section: aeabi
File Attributes
  Tag_CPU_name: "7-A"
  Tag_CPU_arch: v7
  Tag_CPU_arch_profile: Application
  Tag_ARM_ISA_use: Yes
  Tag_THUMB_ISA_use: Thumb-2
  Tag_FP_arch: VFPv3
  Tag_Advanced_SIMD_arch: NEONv1
  Tag_ABI_PCS_wchar_t: 4
  Tag_ABI_FP_rounding: Needed
  Tag_ABI_FP_denormal: Needed
  Tag_ABI_FP_exceptions: Needed
  Tag_ABI_FP_number_model: IEEE 754
  Tag_ABI_align_needed: 8-byte
  Tag_ABI_align_preserved: 8-byte, except leaf SP
  Tag_ABI_enum_size: int
  Tag_ABI_HardFP_use: SP and DP
  Tag_ABI_VFP_args: VFP registers
  Tag_CPU_unaligned_access: v6
  Tag_Virtualization_use: TrustZone

$readelf -A pvrsrvctl
Attribute Section: aeabi
File Attributes
  Tag_CPU_name: "7-A"
  Tag_CPU_arch: v7
  Tag_CPU_arch_profile: Application
  Tag_ARM_ISA_use: Yes
  Tag_THUMB_ISA_use: Thumb-2
  Tag_FP_arch: VFPv3-D16
  Tag_ABI_PCS_wchar_t: 4
  Tag_ABI_FP_denormal: Needed
  Tag_ABI_FP_exceptions: Needed
  Tag_ABI_FP_number_model: IEEE 754
  Tag_ABI_align_needed: 8-byte
  Tag_ABI_align_preserved: 8-byte, except leaf SP
  Tag_ABI_enum_size: int
  Tag_ABI_HardFP_use: SP and DP
  Tag_ABI_VFP_args: VFP registers
  Tag_CPU_unaligned_access: v6
  Tag_DIV_use: Not allowed

I tested 5_01_00_01 version on BBB.

>[   15.008605] CPU: 0    Tainted: G        W    (3.0.50-vallon #1)

Your kernel version is 3.0.50 and that could be the issue.

The release notes contain this instruction:
>Pre-requisites
>
>Kernel(Linux PSP) versions supported or used for validation
>
>Only the following devices have been tested & details below -
>
>AM335x & AM43x -
>
>Tree: git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
>Branch: ti-linux-3.12.y
>commit - dfea149efb32485f17bb7440eb326549c8f647e2, tag - ti2013.12.00
>
>NOTE-
>1.Ensure the reset controller driver is enabled in kernel menuconfig if not enabled by default as below-
>CONFIG_ARCH_HAS_RESET_CONTROLLER=y
>CONFIG_RESET_CONTROLLER=y
>CONFIG_RESET_TI=y

Regards,
Marcelo

From: Adrian martinez munera <adrianmartinezmunera@gmail.com>
Date: Tue, 7 Jan 2020 09:59:53 +0100
Subject: [Buildroot] Fwd:  Zynqmp ZCU-102 Xilinx
In-Reply-To: <CADDW7LPYECM6B1p1WvrU9GeYAK9Y1qrH2-5tJHTWMs9d=MfdKA@mail.gmail.com>
References: <CADDW7LPbh8ep74a5kcu1CZQuaFxuUGyCUxuJT6uo6Y=m9ftmOA@mail.gmail.com>
 <d46c58a9-4b07-878f-b638-1a4d1554e9b1@lucaceresoli.net>
 <CADDW7LPZ+oD9NzjqvbjVBDYj59K_6q1d8beoqwyQ==jFNTq=KA@mail.gmail.com>
 <6efe98a4-0570-32fa-c2f4-c692907815a4@lucaceresoli.net>
 <CADDW7LNdqK-6fw-hRF5HcCWN7s6Spyq-KGm9O3XcV-tX3O1NwA@mail.gmail.com>
 <95b0cf7d-204c-92f0-a236-beae2a5d0477@lucaceresoli.net>
 <CADDW7LOAUTVqHJHDc5po--YcqunHV01OfSRCY12mytvob14geg@mail.gmail.com>
 <CADDW7LPYECM6B1p1WvrU9GeYAK9Y1qrH2-5tJHTWMs9d=MfdKA@mail.gmail.com>
Message-ID: <CADDW7LNtKTzF+gYpB-j7QcHjcQPi+D9X9JKqnghvWeQVh8QfaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---------- Forwarded message ---------
De: Adrian martinez munera <adrianmartinezmunera@gmail.com>
Date: mar., 7 ene. 2020 a las 9:55
Subject: Re: [Buildroot] Zynqmp ZCU-102 Xilinx
To: Luca Ceresoli <luca@lucaceresoli.net>, <buildroot@busybox.net>, Thomas
Petazzoni <thomas.petazzoni@bootlin.com>


Hi Luca and Thomas and happy new year!

Finally I could build a ZCU-102 image using pmufw v2017.4. This two lines
has been crucial:
  git checkout v2017.4
  git sumbodule update
Also. I've used the pm_cfg_obj.c of your repository, Luca.
But, I have to work with v2018.3. I have built pmufw.bin using this version
and, when I'm going to build the ZCU102 image (using Buidroot), I get this
errors for each patch:

- 0001-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch







*Applying 0001-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch using patch:
patching file board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.cReversed
(or previously applied) patch detected!  Skipping patch.1 out of 1 hunk
ignored -- saving rejects to file
board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c.rejpackage/pkg-generic.mk:202
<http://pkg-generic.mk:202>: recipe for target
'/home/adrian/Documents/ZCU-102/buildroot-2019.02.3/output/build/uboot-xilinx-v2018.3/.stamp_patched'
failedmake[1]: ***
[/home/adrian/Documents/ZCU-102/buildroot-2019.02.3/output/build/uboot-xilinx-v2018.3/.stamp_patched]
Error 1Makefile:84: recipe for target '_all' failedmake: *** [_all] Error 2*

- 0002-arm64-zynqmp-Enable-booting-to-ATF.patch

























*Applying 0002-arm64-zynqmp-Enable-booting-to-ATF.patch using patch:
patching file configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfigReversed (or
previously applied) patch detected!  Skipping patch.1 out of 1 hunk ignored
-- saving rejects to file
configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig.rejpatching file
configs/xilinx_zynqmp_zc1751_xm016_dc2_defconfigReversed (or previously
applied) patch detected!  Skipping patch.1 out of 1 hunk ignored -- saving
rejects to file
configs/xilinx_zynqmp_zc1751_xm016_dc2_defconfig.rejpatching file
configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfigReversed (or previously
applied) patch detected!  Skipping patch.1 out of 1 hunk ignored -- saving
rejects to file
configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig.rejpatching file
configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfigReversed (or previously
applied) patch detected!  Skipping patch.1 out of 1 hunk ignored -- saving
rejects to file
configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig.rejpatching file
configs/xilinx_zynqmp_zcu102_rev1_0_defconfigReversed (or previously
applied) patch detected!  Skipping patch.1 out of 1 hunk ignored -- saving
rejects to file configs/xilinx_zynqmp_zcu102_rev1_0_defconfig.rejpatching
file configs/xilinx_zynqmp_zcu102_revA_defconfigReversed (or previously
applied) patch detected!  Skipping patch.1 out of 1 hunk ignored -- saving
rejects to file configs/xilinx_zynqmp_zcu102_revA_defconfig.rejpatching
file configs/xilinx_zynqmp_zcu102_revB_defconfigReversed (or previously
applied) patch detected!  Skipping patch.1 out of 1 hunk ignored -- saving
rejects to file
configs/xilinx_zynqmp_zcu102_revB_defconfig.rejpackage/pkg-generic.mk:202
<http://pkg-generic.mk:202>: recipe for target
'/home/adrian/Documents/ZCU-102/buildroot-2019.02.3/output/build/uboot-xilinx-v2018.3/.stamp_patched'
failedmake[1]: ***
[/home/adrian/Documents/ZCU-102/buildroot-2019.02.3/output/build/uboot-xilinx-v2018.3/.stamp_patched]
Error 1Makefile:84: recipe for target '_all' failedmake: *** [_all] Error 2*

- 0003-arm64-zynqmp-accept-an-absolute-path-for-PMUFW_INIT_.patch







*Applying 0003-arm64-zynqmp-accept-an-absolute-path-for-PMUFW_INIT_.patch
using patch: patching file scripts/Makefile.splReversed (or previously
applied) patch detected!  Skipping patch.1 out of 1 hunk ignored -- saving
rejects to file scripts/Makefile.spl.rejpackage/pkg-generic.mk:202
<http://pkg-generic.mk:202>: recipe for target
'/home/adrian/Documents/ZCU-102/buildroot-2019.02.3/output/build/uboot-xilinx-v2018.3/.stamp_patched'
failedmake[1]: ***
[/home/adrian/Documents/ZCU-102/buildroot-2019.02.3/output/build/uboot-xilinx-v2018.3/.stamp_patched]
Error 1Makefile:84: recipe for target '_all' failedmake: *** [_all] Error 2*


- 0004-arm-arm64-zynq-zynqmp-pass-the-PS-init-file-as-a-kco.patch
















*Applying 0004-arm-arm64-zynq-zynqmp-pass-the-PS-init-file-as-a-kco.patch
using patch: patching file arch/arm/KconfigHunk #1 FAILED at 1293.1 out of
1 hunk FAILED -- saving rejects to file arch/arm/Kconfig.rejThe next patch
would create the file board/xilinx/Kconfig,which already exists!  Skipping
patch.1 out of 1 hunk ignoredpatching file
board/xilinx/zynq/MakefileReversed (or previously applied) patch detected!
Skipping patch.1 out of 1 hunk ignored -- saving rejects to file
board/xilinx/zynq/Makefile.rejpatching file
board/xilinx/zynqmp/MakefileReversed (or previously applied) patch
detected!  Skipping patch.1 out of 1 hunk ignored -- saving rejects to file
board/xilinx/zynqmp/Makefile.rejpackage/pkg-generic.mk:202
<http://pkg-generic.mk:202>: recipe for target
'/home/adrian/Documents/ZCU-102/buildroot-2019.02.3/output/build/uboot-xilinx-v2018.3/.stamp_patched'
failedmake[1]: ***
[/home/adrian/Documents/ZCU-102/buildroot-2019.02.3/output/build/uboot-xilinx-v2018.3/.stamp_patched]
Error 1Makefile:84: recipe for target '_all' failedmake: *** [_all] Error 2*

The only way to make disappear these errors is delete each patch and run
'make'. Then, it builds correctly but I get this boot log:



























































































*U-Boot 2018.01 (Jan 07 2020 - 09:25:14 +0100) Xilinx ZynqMP ZCU102
rev1.0I2C:   readyDRAM:  4 GiBEL Level:       EL2Chip ID:        zu9egMMC:
  sdhci at ff170000: 0 (SD)*** Warning - bad CRC, using default environmentIn:
   serial at ff000000Out:   serial at ff000000Err:   serial at ff000000Bootmode:
LVL_SHFT_SD_MODE1Net:   ZYNQ GEM: ff0e0000, phyaddr c, interface
rgmii-idWarning: ethernet at ff0e0000 (eth0) using random MAC address -
5a:a3:fb:ee:f8:87eth0: ethernet at ff0e0000Hit any key to stop autoboot:
 0switch to partitions #0, OKmmc0 is current deviceDevice:
sdhci at ff170000Manufacturer ID: 3OEM: 5344Name: SL16GTran Speed: 50000000Rd
Block Len: 512SD version 3.0High Capacity: YesCapacity: 14.8 GiBBus Width:
4-bitErase Group Size: 512 Bytesreading system.dtb37887 bytes read in 18 ms
(2 MiB/s)reading Image14825984 bytes read in 975 ms (14.5 MiB/s)##
Flattened Device Tree blob at 04000000   Booting using the fdt blob at
0x4000000   Loading Device Tree to 000000000fff3000, end 000000000ffff3fe
... OKStarting kernel ...[    0.000000] Booting Linux on physical CPU 0x0[
   0.000000] Linux version 4.14.0 (adrian at adrian) (gcc version 7.4.0
(Buildroot 2019.02.3)) #1 SMP Tue Jan 7 09:34:39 CET 2020[    0.000000]
Boot CPU: AArch64 Processor [410fd034][    0.000000] Machine model: ZynqMP
ZCU102 Rev1.0[    0.000000] earlycon: cdns0 at MMIO 0x00000000ff000000
(options '115200n8')[    0.000000] bootconsole [cdns0] enabled[
 0.000000] efi: Getting EFI parameters from FDT:[    0.000000] efi: UEFI
not found.[    0.000000] cma: Reserved 256 MiB at 0x0000000070000000[
 0.000000] psci: probing for conduit method from DT.[    0.000000] psci:
PSCIv1.1 detected in firmware.[    0.000000] psci: Using standard PSCI v0.2
function IDs[    0.000000] psci: MIGRATE_INFO_TYPE not supported.[
 0.000000] percpu: Embedded 21 pages/cpu @ffffffc87ff66000 s45080 r8192
d32744 u86016[    0.000000] Detected VIPT I-cache on CPU0[    0.000000] CPU
features: enabling workaround for ARM erratum 845719[    0.000000] Built 1
zonelists, mobility grouping on.  Total pages: 1034240[    0.000000] Kernel
command line: earlycon clk_ignore_unused root=/dev/mmcblk0p2 rw rootwait[
 0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)[
 0.000000] Dentry cache hash table entries: 524288 (order: 10, 4194304
bytes)[    0.000000] Inode-cache hash table entries: 262144 (order: 9,
2097152 bytes)[    0.000000] software IO TLB [mem 0x6bfff000-0x6ffff000]
(64MB) mapped at [ffffffc06bfff000-ffffffc06fffefff][    0.000000] Memory:
3785368K/4194304K available (10108K kernel code, 654K rwdata, 3168K rodata,
512K init, 2157K bss, 146792K reserved, 262144K cma-reserved)[    0.000000]
Virtual kernel memory layout:[    0.000000]     modules :
0xffffff8000000000 - 0xffffff8008000000   (   128 MB)[    0.000000]
vmalloc : 0xffffff8008000000 - 0xffffffbebfff0000   (   250 GB)[
 0.000000]       .text : 0xffffff8008080000 - 0xffffff8008a60000   ( 10112
KB)[    0.000000]     .rodata : 0xffffff8008a60000 - 0xffffff8008d80000   (
 3200 KB)[    0.000000]       .init : 0xffffff8008d80000 -
0xffffff8008e00000   (   512 KB)[    0.000000]       .data :
0xffffff8008e00000 - 0xffffff8008ea3a00   (   655 KB)[    0.000000]
 .bss : 0xffffff8008ea3a00 - 0xffffff80090bf030   (  2158 KB)[    0.000000]
    fixed   : 0xffffffbefe7fd000 - 0xffffffbefec00000   (  4108 KB)[
 0.000000]     PCI I/O : 0xffffffbefee00000 - 0xffffffbeffe00000   (    16
MB)[    0.000000]     vmemmap : 0xffffffbf00000000 - 0xffffffc000000000   (
    4 GB maximum)[    0.000000]               0xffffffbf00000000 -
0xffffffbf1dc00000   (   476 MB actual)[    0.000000]     memory  :
0xffffffc000000000 - 0xffffffc880000000   ( 34816 MB)[    0.000000]
Hierarchical RCU implementation.[    0.000000]  RCU event tracing is
enabled.[    0.000000]  RCU restricting CPUs from NR_CPUS=8 to
nr_cpu_ids=4.[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16,
nr_cpu_ids=4[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0[
   0.000000] GIC: Adjusting CPU interface base to 0x00000000f902f000[
 0.000000] GIC: Using split EOI/Deactivate mode[    0.000000] arch_timer:
cp15 timer(s) running at 100.00MHz (phys).[    0.000000] clocksource:
arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x171024e7e0,
max_idle_ns: 440795205315 ns[    0.000003] sched_clock: 56 bits at 100MHz,
resolution 10ns, wraps every 4398046511100ns[    0.008382] Console: colour
dummy device 80x25[    0.012463] console [tty0] enabled[    0.015830]
bootconsole [cdns0] disabled*

Is there anything I'm doing wrong?

Thanks and best regards, Adri?n.



> El jue., 12 dic. 2019 a las 18:09, Luca Ceresoli (<luca@lucaceresoli.net>)
> escribi?:
>
>> Hi Adrian,
>>
>> please keep the Buildroot mailing-list in Cc when replying.
>>
>> On 10/12/19 10:34, Adrian martinez munera wrote:
>> > Hi Luca,
>> > when I say that the rootfs is empty I mean that if you use 'ls' command
>> > there are no directories. Looks that there is a boot console to start,
>> > halt or reboot the ZCU102. ---> " ZynqMP> "
>>
>> This is the U-Boot prompt. This explains why "the rootfs is empty":
>> there's no such thing as a root filesystem in U-Boot.
>>
>> Now the question is: why U-Boot stops instead of loading a kernel?
>> Please send the entire boot log or other people can only do guesswork.
>>
>> > I think that 'mmcblkt' is the name that the board assigns to the sdcard.
>> >
>> > As you said me, I've used the same version for all (--> 2017.04) but I
>> > dont know how to create pmufw with the version 2017.04. Using Vivado
>> > 2017.04?
>>
>> Using zynqmp-pumfw-builder:
>>
>>   git clone --recursive \
>>       https://github.com/lucaceresoli/zynqmp-pmufw-builder.git
>>   cd zynqmp-pmufw-builder
>>   git checkout v2017.4
>>   git sumbodule update
>>   cp /your/own/zcu102/pm_cfg_obj.c .
>>   ./build.sh pmufw-patch
>>   ./build.sh pmufw-build
>>
>> Otherwise you can use the Xilinx XSDK.
>>
>> > The defconfig would be this:
>> > *
>> > *
>> > *BR2_aarch64=y
>> > #BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"  *--> By default, the
>> > patches of Buidlroot only work for ZCU106
>>
>> Those patches should work (or at least not hurt) on any board. Which
>> one(s) do you think is giving troubles?
>>
>> > *BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>> > BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>> > BR2_LINUX_KERNEL=y
>> > BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> > BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://
>> github.com/Xilinx/linux-xlnx.git
>> > <http://github.com/Xilinx/linux-xlnx.git>"
>> > BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.4"
>> > BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
>> > BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> > BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
>> > BR2_TARGET_ROOTFS_EXT2=y
>> > BR2_TARGET_ROOTFS_EXT2_4=y
>> > # BR2_TARGET_ROOTFS_TAR is not set
>> > BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>> > BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
>> > BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="
>> https://github.com/ARM-software/arm-trusted-firmware.git"
>> > BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.5"
>> > BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
>> > BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
>> > BR2_TARGET_UBOOT=y
>> > BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>> > BR2_TARGET_UBOOT_CUSTOM_GIT=y
>> > BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://
>> github.com/xilinx/u-boot-xlnx.git <
>> http://github.com/xilinx/u-boot-xlnx.git>"
>> > BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2017.4"
>> > BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_zcu102_rev1_0"
>> > BR2_TARGET_UBOOT_NEEDS_DTC=y
>> > BR2_TARGET_UBOOT_SPL=y
>> > BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
>> > BR2_TARGET_UBOOT_ZYNQMP=y
>> >
>> BR2_TARGET_UBOOT_ZYNQMP_PMUFW="/home/adrian/Documents/ZCU-102/pmufw_builder/zynqmp-pmufw-builder/pmufw.bin"
>> > BR2_PACKAGE_HOST_DOSFSTOOLS=y
>> > BR2_PACKAGE_HOST_GENIMAGE=y
>> > BR2_PACKAGE_HOST_MTOOLS=y*
>>
>> Ok, so your config is quite similar to the zcu106 one in mainline
>> Buildroot:
>>
>> $ diff -u0 configs/zynqmp_zcu106_defconfig  adrian-zcu102
>> --- configs/zynqmp_zcu106_defconfig     2019-08-30 15:24:02.493487657
>> +0200
>> +++ adrian-zcu102       2019-12-12 17:27:28.885746282 +0100
>> @@ -2 +2 @@
>> -BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"
>> +#BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"  --> By default, the
>> patches of Buidlroot only work for ZCU106
>>
>> Not OK, as above.
>>
>> @@ -11 +11 @@
>> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
>>
>> OK, just changing the board.
>>
>> @@ -25,2 +25,2 @@
>>
>> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="228801a215909365ae1dcdd799034195ad7264f7"
>> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2017.4"
>>
>> I don't remember why I used that specific commit instead of
>> xilinx-v2017.4, but since that's the one I had tested and running, I'd
>> stick to that.
>>
>> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_zcu106_revA"
>> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_zcu102_rev1_0"
>>
>> OK
>>
>> @@ -31 +31 @@
>> -BR2_TARGET_UBOOT_ZYNQMP_PMUFW="
>> https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/53fdb7b6c92860ceb0ec5fd14deee302f4a84269/bin/pmufw-zcu106-default-v2017.4.bin
>> "
>>
>> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW="/home/adrian/Documents/ZCU-102/pmufw_builder/zynqmp-pmufw-builder/pmufw.bin"
>>
>> OK
>>
>>
>> > This defconfig builds a project which returns this error:
>> >
>> > *<debug_uart> Debug uart enabled
>> >
>> >
>> >
>> > U-Boot SPL 2017.01 (Dec 05 2019 - 13:16:42)
>> >
>> > EL Level:       EL3
>> >
>> > Trying to boot from MMC1
>> >
>> > reading u-boot.bin
>> > reading atf-uboot.ub
>> > reading atf-uboot.ub
>> > NOTICE:  ATF running on XCZU9EG/silicon v3/RTL5.1 at 0xfffea000
>> > NOTICE:  BL31: Secure code at 0x0
>> > NOTICE:  BL31: Non secure code at 0x8000000
>> > NOTICE:  BL31: v1.5(release):
>> > NOTICE:  BL31: Built : 13:16:32, Dec  5 2019
>> > PMUFW is not found - Please load it!
>>
>> I think this is due to the fact that you didn't apply the u-boot
>> patches. Patch 3 is needed for Buildroot to tell U-Boot where the pmufw
>> file is, I'm not surprised U-Boot won't find it without the patch.
>>
>> Retry with a defconfig that is equal to the original one, except for the
>> board changes and the change in the pmufw path (i.e. the changes that I
>> commented with "OK" above).
>>
>> Indeed having these machines booting is tricky. Damn tricky. Be very,
>> very, very cautious and conservative about the things you do and always
>> stay as similar as possible to a working configuration. Once you have
>> something booting you can try to modify one piece at a time and see what
>> happens.
>>
>> --
>> Luca
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200107/f6582452/attachment.html>

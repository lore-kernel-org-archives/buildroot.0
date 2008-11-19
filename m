From: =?windows-1251?B?1+jt6u7iIMDt5PDl6Q==?= <blackmesa@rambler.ru>
Date: Wed, 19 Nov 2008 13:21:22 +0300
Subject: [Buildroot] Buildroot failed
Message-ID: <1124903421.1227090082.149213860.26212@mcgi54.rambler.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

I have been unsuccessfully trying to build target jffs2 image for 
several weeks :(

I have Ubuntu8.04 x86 host machine.
My goal is to build jffs2 image for mipsel platform.

Steps I made are:
1) download buildroot-XXXXXXXX.tar.bz2
2) unpack
3) invoke this command in terminal: make menuconfig
4) Select mipsel in first item
5) Select mips32 in second item
6) Goto "Kernel" menu item and select "none" in configuration ("advanced 
configuration" did not works also :( )
7) Save configuration
8) And invoke 'make all' in terminal

It is inexplicable that each new attempt to perform these 8 steps
crashes with different errors :(

I made tens of attemps to execute these 8 steps (during last 2 weeks) - 
but all of them crushed with different errors :(
Latest errors I got are:

1) .....
...........
........... "no rule to make 'mtd-host'"

or

2) ....
.........
  AR      arch/mips/lib/lib.a
  LD      vmlinux.o
  MODPOST vmlinux.o
  GEN     .version
  CHK     include/linux/compile.h
  SKIPPED include/linux/compile.h
  LD      .tmp_vmlinux1
arch/mips/au1000/common/built-in.o: In function `au1x_pci_setup':
/mnt/local_storage/buildroo_snapshot/project_build_mipsel/uclibc/linux-2.6.26.3/arch/mips/au1000/common/pci.c:98: 
undefined reference to `au1x_pci_cfg_init'
/mnt/local_storage/buildroo_snapshot/project_build_mipsel/uclibc/linux-2.6.26.3/arch/mips/au1000/common/pci.c:98: 
relocation truncated to fit: R_MIPS_26 against `au1x_pci_cfg_init'
arch/mips/au1000/common/built-in.o:(.data+0x798): undefined reference to 
`au1x_pci_ops'
arch/mips/pci/built-in.o: In function `pcibios_enable_device':
/mnt/local_storage/buildroo_snapshot/project_build_mipsel/uclibc/linux-2.6.26.3/arch/mips/pci/pci.c:237: 
undefined reference to `pcibios_plat_dev_init'
/mnt/local_storage/buildroo_snapshot/project_build_mipsel/uclibc/linux-2.6.26.3/arch/mips/pci/pci.c:237: 
relocation truncated to fit: R_MIPS_26 against `pcibios_plat_dev_init'
arch/mips/pci/built-in.o: In function `pcibios_init':
/mnt/local_storage/buildroo_snapshot/project_build_mipsel/uclibc/linux-2.6.26.3/arch/mips/pci/pci.c:159: 
undefined reference to `pcibios_map_irq'
/mnt/local_storage/buildroo_snapshot/project_build_mipsel/uclibc/linux-2.6.26.3/arch/mips/pci/pci.c:159: 
undefined reference to `pcibios_map_irq'
make[1]: *** [.tmp_vmlinux1] Error 1
make[1]: Leaving directory 
`/mnt/local_storage/buildroo_snapshot/project_build_mipsel/uclibc/linux-2.6.26.3'
make: *** 
[/mnt/local_storage/buildroo_snapshot/project_build_mipsel/uclibc/linux-2.6.26.3/vmlinux] 
Error 2


So can you help me?

Or may be someone did build buildroot for mipsel target architecture and 
can tell me what make command should I invoke
 or
what setting in 'make menuconfig' should I set?

Thanks)

From: Will Wagner <will_wagner@carallon.com>
Date: Fri, 21 Dec 2007 17:27:04 +0000
Subject: [Buildroot] Build error
In-Reply-To: <476A9199.4080900@promwad.com>
References: <476A7DA6.7000102@carallon.com> <476A9199.4080900@promwad.com>
Message-ID: <476BF768.3050201@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the hint.

I have compiled both with and without qtopia4 and got the verbose log. I 
can not see any difference on what is on the command line between the 
two versions.

Output is now:

   set -e; if [ ! -r .version ]; then rm -f .version; echo 1 >.version; 
else mv .version .old_version; expr 0$(cat .old_version) + 1 >.version; 
fi; /usr/bin/make -f scripts/Makefile.build obj=init
   CHK     include/linux/compile.h
/bin/sh 
/home/willw/buildroot/project_build_arm/badger/linux-2.6.19.2/scripts/mkcompile_h 
include/linux/compile.h \
	"arm" "" "y" 
"/home/willw/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc 
-Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing 
-fno-common -Os -fno-omit-frame-pointer -mapcs -mno-sched-prolog 
-mabi=aapcs-linux -mno-thumb-interwork -D__LINUX_ARM_ARCH__=6 
-march=armv6 -mtune=arm1136j-s  -msoft-float -Uarm 
-fno-omit-frame-pointer -fno-optimize-sibling-calls 
-fno-stack-protector -Wdeclaration-after-statement -Wno-pointer-sign"
   UPD     include/linux/compile.h
 
/home/willw/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc 
-Wp,-MD,init/.version.o.d  -nostdinc -isystem 
/home/willw/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.2.1/include 
-D__KERNEL__ -Iinclude  -include include/linux/autoconf.h 
-mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs 
-fno-strict-aliasing -fno-common -Os -fno-omit-frame-pointer -mapcs 
-mno-sched-prolog -mabi=aapcs-linux -mno-thumb-interwork 
-D__LINUX_ARM_ARCH__=6 -march=armv6 -mtune=arm1136j-s  -msoft-float 
-Uarm -fno-omit-frame-pointer -fno-optimize-sibling-calls 
-fno-stack-protector -Wdeclaration-after-statement -Wno-pointer-sign 
-Os -pipe -I/home/willw/buildroot/build_arm/staging_dir/usr/include 
-I/home/willw/buildroot/build_arm/staging_dir/include 
--sysroot=/home/willw/buildroot/build_arm/staging_dir/ -isysroot 
/home/willw/buildroot/build_arm/staging_dir -mtune=arm1136jf-s 
-D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(version)" 
-D"KBUILD_MODNAME=KBUILD_STR(version)" -c -o init/.tmp_version.o 
init/version.c
 
/home/willw/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-ld 
-EL -L/home/willw/buildroot/build_arm/staging_dir/lib 
-L/home/willw/buildroot/build_arm/staging_dir/usr/lib 
--sysroot=/home/willw/buildroot/build_arm/staging_dir/  -r -o 
init/built-in.o init/main.o init/version.o init/mounts.o 
init/initramfs.o init/calibrate.o
 
/home/willw/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-ld 
-EL -L/home/willw/buildroot/build_arm/staging_dir/lib 
-L/home/willw/buildroot/build_arm/staging_dir/usr/lib 
--sysroot=/home/willw/buildroot/build_arm/staging_dir/ -p --no-undefined 
-X -o .tmp_vmlinux1 -T arch/arm/kernel/vmlinux.lds 
arch/arm/kernel/head.o arch/arm/kernel/init_task.o  init/built-in.o 
--start-group  usr/built-in.o  arch/arm/kernel/built-in.o 
arch/arm/mm/built-in.o  arch/arm/common/built-in.o 
arch/arm/mach-mx3/built-in.o  arch/arm/vfp/built-in.o 
arch/arm/plat-mxc/built-in.o  kernel/built-in.o  mm/built-in.o 
fs/built-in.o  ipc/built-in.o  security/built-in.o  crypto/built-in.o 
block/built-in.o  arch/arm/lib/lib.a  lib/lib.a  arch/arm/lib/built-in.o 
  lib/built-in.o  drivers/built-in.o  sound/built-in.o 
arch/arm/oprofile/built-in.o  net/built-in.o --end-group
init/built-in.o: In function `init':
calibrate.c:(.text+0x68): relocation truncated to fit: R_ARM_CALL 
against symbol `spawn_ksoftirqd' defined in .init.text section in 
kernel/built-in.o
calibrate.c:(.text+0x6c): relocation truncated to fit: R_ARM_CALL 
against symbol `sched_init_smp' defined in .init.text section in 
kernel/built-in.o
calibrate.c:(.text+0x70): relocation truncated to fit: R_ARM_CALL 
against symbol `populate_rootfs' defined in .init.text section in 
init/built-in.o
calibrate.c:(.text+0x78): relocation truncated to fit: R_ARM_CALL 
against symbol `usermodehelper_init' defined in .init.text section in 
kernel/built-in.o
calibrate.c:(.text+0x7c): relocation truncated to fit: R_ARM_CALL 
against symbol `driver_init' defined in .init.text section in 
drivers/built-in.o
calibrate.c:(.text+0x80): relocation truncated to fit: R_ARM_CALL 
against symbol `sysctl_init' defined in .init.text section in 
kernel/built-in.o
calibrate.c:(.text+0x194): relocation truncated to fit: R_ARM_CALL 
against symbol `prepare_namespace' defined in .init.text section in 
init/built-in.o
init/built-in.o: In function `loglevel':
calibrate.c:(.init.text+0x174): relocation truncated to fit: R_ARM_CALL 
against symbol `get_option' defined in .text section in lib/lib.a(cmdline.o)
init/built-in.o: In function `maxcpus':
calibrate.c:(.init.text+0x1a8): relocation truncated to fit: R_ARM_CALL 
against symbol `get_option' defined in .text section in lib/lib.a(cmdline.o)
init/built-in.o: In function `unknown_bootoption':
calibrate.c:(.init.text+0x1d8): relocation truncated to fit: R_ARM_CALL 
against symbol `strlen' defined in .text section in lib/lib.a(string.o)
calibrate.c:(.init.text+0x214): additional relocation overflows omitted 
from the output
make[1]: *** [.tmp_vmlinux1] Error 1
make[1]: Leaving directory 
`/home/willw/buildroot/project_build_arm/badger/linux-2.6.19.2'
make: *** 
[/home/willw/buildroot/binaries/badger/linux-kernel-2.6.19.2-arm] Error 2

It seems to be failing when building init, is that right? What files are 
taken from the staging dir for this step? Presumably the qtopia4 build 
process must be overwriting one of these? I assume this is the case as 
if I now deselect qtopia4 package the build still fails in the same way.

Anyone able to give me any help on what is mean to be happening here 
would be great.

Thanks

Will.

Ivan Kuten wrote:
>> Can someone explain what the errors mean? It appears to be an error when 
>> linking the kernel but how can adding a package cause this?
>>
>> Any help is much appreciated.
>>
>> Will.
>>
> 
> Hi Will,
> 
> try to compile kernel/buildroot with make V=1
> and compare compiler options passed to kernel in both cases - with and without qtopia
> 
> Regards,
> Ivan

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------

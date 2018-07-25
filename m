From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Jul 2018 08:58:30 +0000
Subject: [Buildroot] [Bug 10861] Package batman_adv Makefile is missing
 include header directory
In-Reply-To: <bug-10861-163@https.bugs.busybox.net/>
References: <bug-10861-163@https.bugs.busybox.net/>
Message-ID: <bug-10861-163-3cLH52llUZ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10861

--- Comment #3 from Miltiadis Koutsokeras <miltos.koutsokeras@iccs.gr> ---
Hi again and sorry for the delayed response,

I managed to strip down my external configuration directory to a version that
reproduces the problem exactly as I encountered it months ago. I will attach
the external configuration directory and the captured standard output of the
process.

The build was performed with these commands in a Debian 9 host:
cd path/to/reproduce
make V=1 O="$(pwd)" -C "path/to/buildroot-2018.02"
BR2_EXTERNAL="path/to/buildroot-external"
"shiratech_sparkgate-7_InternalNAND_defconfig"
make V=1 O="$(pwd)" -C "path/to/buildroot-2018.02"

I will attach the external configuration directory archived in
'buildroot-external-bug-10861.tar.gz' and the standard output of the commands
in 'reproduce.log'. The errors at the end summarized (paths changed for easier
searching):

--------------------------------------------
/usr/bin/make -f ./scripts/Makefile.build
obj=path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv
  path/to/reproduce/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
-Wp,-MD,path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/.bat_algo.o.d
-Ipath/to/reproduce/build/batman-adv-2017.0.1/compat-include/ -include
path/to/reproduce/build/batman-adv-2017.0.1/compat.h
-DBATADV_SOURCE_VERSION="\"2017.0.1\"" -I./arch/arm/include
-Iarch/arm/include/generated/uapi -Iarch/arm/include/generated  -Iinclude
-I./arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I./include/uapi
-Iinclude/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__
-mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs
-fno-strict-aliasing -fno-common -Werror-implicit-function-declaration
-Wno-format-security -std=gnu89 -fno-dwarf2-cfi-asm -fno-ipa-sra
-mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm
-D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm
-fno-delete-null-pointer-checks -Wno-maybe-uninitialized -O2
--param=allow-store-data-races=0 -Wframe-larger-than=1024 -fno-stack-protector
-Wno-unused-but-set-variable -Wno-unused-const-variable -fomit-frame-pointer
-fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign
-fno-strict-overflow -fconserve-stack -Werror=implicit-int
-Werror=strict-prototypes -Werror=date-time -DCC_HAVE_ASM_GOTO  -DMODULE 
-D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(bat_algo)" 
-D"KBUILD_MODNAME=KBUILD_STR(batman_adv)" -c -o
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bat_algo.o
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bat_algo.c
  path/to/reproduce/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
-Wp,-MD,path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/.bat_iv_ogm.o.d
-Ipath/to/reproduce/build/batman-adv-2017.0.1/compat-include/ -include
path/to/reproduce/build/batman-adv-2017.0.1/compat.h
-DBATADV_SOURCE_VERSION="\"2017.0.1\"" -I./arch/arm/include
-Iarch/arm/include/generated/uapi -Iarch/arm/include/generated  -Iinclude
-I./arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I./include/uapi
-Iinclude/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__
-mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs
-fno-strict-aliasing -fno-common -Werror-implicit-function-declaration
-Wno-format-security -std=gnu89 -fno-dwarf2-cfi-asm -fno-ipa-sra
-mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm
-D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm
-fno-delete-null-pointer-checks -Wno-maybe-uninitialized -O2
--param=allow-store-data-races=0 -Wframe-larger-than=1024 -fno-stack-protector
-Wno-unused-but-set-variable -Wno-unused-const-variable -fomit-frame-pointer
-fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign
-fno-strict-overflow -fconserve-stack -Werror=implicit-int
-Werror=strict-prototypes -Werror=date-time -DCC_HAVE_ASM_GOTO  -DMODULE 
-D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(bat_iv_ogm)" 
-D"KBUILD_MODNAME=KBUILD_STR(batman_adv)" -c -o
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bat_iv_ogm.o
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bat_iv_ogm.c
  path/to/reproduce/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
-Wp,-MD,path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/.bitarray.o.d
-Ipath/to/reproduce/build/batman-adv-2017.0.1/compat-include/ -include
path/to/reproduce/build/batman-adv-2017.0.1/compat.h
-DBATADV_SOURCE_VERSION="\"2017.0.1\"" -I./arch/arm/include
-Iarch/arm/include/generated/uapi -Iarch/arm/include/generated  -Iinclude
-I./arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I./include/uapi
-Iinclude/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__
-mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs
-fno-strict-aliasing -fno-common -Werror-implicit-function-declaration
-Wno-format-security -std=gnu89 -fno-dwarf2-cfi-asm -fno-ipa-sra
-mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm
-D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm
-fno-delete-null-pointer-checks -Wno-maybe-uninitialized -O2
--param=allow-store-data-races=0 -Wframe-larger-than=1024 -fno-stack-protector
-Wno-unused-but-set-variable -Wno-unused-const-variable -fomit-frame-pointer
-fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign
-fno-strict-overflow -fconserve-stack -Werror=implicit-int
-Werror=strict-prototypes -Werror=date-time -DCC_HAVE_ASM_GOTO  -DMODULE 
-D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(bitarray)" 
-D"KBUILD_MODNAME=KBUILD_STR(batman_adv)" -c -o
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bitarray.o
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bitarray.c
  path/to/reproduce/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
-Wp,-MD,path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/.distributed-arp-table.o.d
-Ipath/to/reproduce/build/batman-adv-2017.0.1/compat-include/ -include
path/to/reproduce/build/batman-adv-2017.0.1/compat.h
-DBATADV_SOURCE_VERSION="\"2017.0.1\"" -I./arch/arm/include
-Iarch/arm/include/generated/uapi -Iarch/arm/include/generated  -Iinclude
-I./arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I./include/uapi
-Iinclude/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__
-mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs
-fno-strict-aliasing -fno-common -Werror-implicit-function-declaration
-Wno-format-security -std=gnu89 -fno-dwarf2-cfi-asm -fno-ipa-sra
-mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm
-D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm
-fno-delete-null-pointer-checks -Wno-maybe-uninitialized -O2
--param=allow-store-data-races=0 -Wframe-larger-than=1024 -fno-stack-protector
-Wno-unused-but-set-variable -Wno-unused-const-variable -fomit-frame-pointer
-fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign
-fno-strict-overflow -fconserve-stack -Werror=implicit-int
-Werror=strict-prototypes -Werror=date-time -DCC_HAVE_ASM_GOTO  -DMODULE 
-D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(distributed_arp_table)" 
-D"KBUILD_MODNAME=KBUILD_STR(batman_adv)" -c -o
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/distributed-arp-table.o
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/distributed-arp-table.c
  path/to/reproduce/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
-Wp,-MD,path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/.bridge_loop_avoidance.o.d
-Ipath/to/reproduce/build/batman-adv-2017.0.1/compat-include/ -include
path/to/reproduce/build/batman-adv-2017.0.1/compat.h
-DBATADV_SOURCE_VERSION="\"2017.0.1\"" -I./arch/arm/include
-Iarch/arm/include/generated/uapi -Iarch/arm/include/generated  -Iinclude
-I./arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I./include/uapi
-Iinclude/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__
-mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs
-fno-strict-aliasing -fno-common -Werror-implicit-function-declaration
-Wno-format-security -std=gnu89 -fno-dwarf2-cfi-asm -fno-ipa-sra
-mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm
-D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm
-fno-delete-null-pointer-checks -Wno-maybe-uninitialized -O2
--param=allow-store-data-races=0 -Wframe-larger-than=1024 -fno-stack-protector
-Wno-unused-but-set-variable -Wno-unused-const-variable -fomit-frame-pointer
-fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign
-fno-strict-overflow -fconserve-stack -Werror=implicit-int
-Werror=strict-prototypes -Werror=date-time -DCC_HAVE_ASM_GOTO  -DMODULE 
-D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(bridge_loop_avoidance)" 
-D"KBUILD_MODNAME=KBUILD_STR(batman_adv)" -c -o
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bridge_loop_avoidance.o
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bridge_loop_avoidance.c
In file included from
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/main.h:196:0,
                 from
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bat_algo.c:18:
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/types.h:37:10: fatal
error: uapi/linux/batman_adv.h: No such file or directory
 #include <uapi/linux/batman_adv.h>
          ^~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
scripts/Makefile.build:258: recipe for target
'path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bat_algo.o' failed
make[2]: ***
[path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bat_algo.o] Error 1
make[2]: *** Waiting for unfinished jobs....
In file included from
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/main.h:196:0,
                 from
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bridge_loop_avoidance.h:21,
                 from
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bridge_loop_avoidance.c:18:
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/types.h:37:10: fatal
error: uapi/linux/batman_adv.h: No such file or directory
 #include <uapi/linux/batman_adv.h>
          ^~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
In file included from
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/main.h:196:0,
                 from
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/distributed-arp-table.h:21,
                 from
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/distributed-arp-table.c:18:
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/types.h:37:10: fatal
error: uapi/linux/batman_adv.h: No such file or directory
 #include <uapi/linux/batman_adv.h>
          ^~~~~~~~~~~~~~~~~~~~~~~~~
scripts/Makefile.build:258: recipe for target
'path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bridge_loop_avoidance.o'
failed
make[2]: ***
[path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bridge_loop_avoidance.o]
Error 1
compilation terminated.
scripts/Makefile.build:258: recipe for target
'path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/distributed-arp-table.o'
failed
make[2]: ***
[path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/distributed-arp-table.o]
Error 1
In file included from
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/main.h:196:0,
                 from
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bat_iv_ogm.h:21,
                 from
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bat_iv_ogm.c:18:
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/types.h:37:10: fatal
error: uapi/linux/batman_adv.h: No such file or directory
 #include <uapi/linux/batman_adv.h>
          ^~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
In file included from
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/main.h:196:0,
                 from
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bitarray.h:21,
                 from
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bitarray.c:18:
path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/types.h:37:10: fatal
error: uapi/linux/batman_adv.h: No such file or directory
 #include <uapi/linux/batman_adv.h>
          ^~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
scripts/Makefile.build:258: recipe for target
'path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bat_iv_ogm.o'
failed
make[2]: ***
[path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bat_iv_ogm.o] Error
1
scripts/Makefile.build:258: recipe for target
'path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bitarray.o' failed
make[2]: ***
[path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv/bitarray.o] Error 1
Makefile:1400: recipe for target
'_module_path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv' failed
make[1]: ***
[_module_path/to/reproduce/build/batman-adv-2017.0.1/net/batman-adv] Error 2
make[1]: Leaving directory 'path/to/reproduce/build/linux-linux4sam_5.5'
package/pkg-generic.mk:247: recipe for target
'path/to/reproduce/build/batman-adv-2017.0.1/.stamp_built' failed
make: *** [path/to/reproduce/build/batman-adv-2017.0.1/.stamp_built] Error 2
make: Leaving directory
'/home/isense/Development/Embedded/Buildroot/buildroot-2018.02'
--------------------------------------------

Again, I'm really sorry for the delay.

Thank you for your time,
Miltos

-- 
You are receiving this mail because:
You are on the CC list for the bug.

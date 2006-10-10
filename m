From: Michael <abechen@giga.net.tw>
Date: Tue, 10 Oct 2006 21:25:24 +0800
Subject: [Buildroot]  ld.real: cannot find -lgcc_s
References: 901e5e350610100356t2524befep22a71d924c4961ce@mail.gmail.com
Message-ID: <452B9F44.9000708@giga.net.tw>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When I unset BR2_GCC_SHARED_LIBGCC in the buildroot
configuration.  The following error messages appeared.

How do I need to do to resolve the problem?
Thanks in advance,



/home/mike/Buildroot/buildroot-20061009-ARM-NOMM/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc 
-Wall -Wstrict-prototypes -Wshadow -Os -fstrict-aliasing 
-fomit-frame-pointer -Dfork=vfork -D__PIC__ -fpic -msingle-pic-base -c 
hello.c
/home/mike/Buildroot/buildroot-20061009-ARM-NOMM/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc 
-Wl,-elf2flt=-s32768 -fpic -msingle-pic-base -o hello hello.o
hello.elf2flt: In function `__uClibc_fini':
/home/mike/Buildroot/buildroot-20061009-ARM-NOMM/toolchain_build_arm_nofpu/gcc-3.4.2/gcc/config/arm/lib1funcs.asm:(.text+0x888): 
undefined reference to `__fini_array_start'
/home/mike/Buildroot/buildroot-20061009-ARM-NOMM/toolchain_build_arm_nofpu/gcc-3.4.2/gcc/config/arm/lib1funcs.asm:(.text+0x88c): 
undefined reference to `__fini_array_end'
hello.elf2flt: In function `__uClibc_main':
/home/mike/Buildroot/buildroot-20061009-ARM-NOMM/toolchain_build_arm_nofpu/gcc-3.4.2/gcc/config/arm/lib1funcs.asm:(.text+0xa1c): 
undefined reference to `__preinit_array_end'
/home/mike/Buildroot/buildroot-20061009-ARM-NOMM/toolchain_build_arm_nofpu/gcc-3.4.2/gcc/config/arm/lib1funcs.asm:(.text+0xa20): 
undefined reference to `__preinit_array_start'
/home/mike/Buildroot/buildroot-20061009-ARM-NOMM/toolchain_build_arm_nofpu/gcc-3.4.2/gcc/config/arm/lib1funcs.asm:(.text+0xa2c): 
undefined reference to `__init_array_end'
/home/mike/Buildroot/buildroot-20061009-ARM-NOMM/toolchain_build_arm_nofpu/gcc-3.4.2/gcc/config/arm/lib1funcs.asm:(.text+0xa30): 
undefined reference to `__init_array_start'
collect2: ld returned 1 exit status
make: *** [hello] Error 1

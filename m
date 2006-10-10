From: Michael <michtw@gmail.com>
Date: Tue, 10 Oct 2006 21:30:58 +0800
Subject: [Buildroot]  ld.real: cannot find -lgcc_s
Message-ID: <901e5e350610100630t23eae663u1b0f89742734cd0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue Oct 10 04:16:50 PDT 2006, Fredrik Roubert wrote:

>One possible solution is to unset BR2_GCC_SHARED_LIBGCC in the buildroot
>configuration, to get rid of the shared libgcc alltogether.

When I unset BR2_GCC_SHARED_LIBGCC in the buildroot
configuration.  The following messages appeared.
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

From: Michael <michtw@gmail.com>
Date: Wed, 11 Oct 2006 20:09:32 +0800
Subject: [Buildroot] undefined reference to `__fini_array_start'
	`__fini_array_end'
Message-ID: <901e5e350610110509jc9e9b84tc0c91f45216b3f37@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When I trying to complie  the source,  I got the following error messages.
What means of this?
How do I need to do to resolve the problem?

Thanks in advance,


/home/mike/Buildroot/buildroot-20061011-ARM-NOMMU-NOFPU/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc
-Wall -Wstrict-prototypes -Wshadow -Os -fstrict-aliasing
-fomit-frame-pointer -Dfork=vfork -D__PIC__ -fpic -msingle-pic-base -c
hello.c
/home/mike/Buildroot/buildroot-20061011-ARM-NOMMU-NOFPU/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc
-Wl,-elf2flt="-s32768" -static-libgcc -lgcc -fPIC -o hello hello.o
hello.elf2flt: In function `__uClibc_fini':
/home/mike/Buildroot/buildroot-20061011-ARM-NOMMU-NOFPU/toolchain_build_arm_nofpu/gcc-3.4.2/gcc/config/arm/lib1funcs.asm:(.text+0x888):
undefined reference to `__fini_array_start'
/home/mike/Buildroot/buildroot-20061011-ARM-NOMMU-NOFPU/toolchain_build_arm_nofpu/gcc-3.4.2/gcc/config/arm/lib1funcs.asm:(.text+0x88c):
undefined reference to `__fini_array_end'
hello.elf2flt: In function `__uClibc_main':
/home/mike/Buildroot/buildroot-20061011-ARM-NOMMU-NOFPU/toolchain_build_arm_nofpu/gcc-3.4.2/gcc/config/arm/lib1funcs.asm:(.text+0xa1c):
undefined reference to `__preinit_array_end'
/home/mike/Buildroot/buildroot-20061011-ARM-NOMMU-NOFPU/toolchain_build_arm_nofpu/gcc-3.4.2/gcc/config/arm/lib1funcs.asm:(.text+0xa20):
undefined reference to `__preinit_array_start'
/home/mike/Buildroot/buildroot-20061011-ARM-NOMMU-NOFPU/toolchain_build_arm_nofpu/gcc-3.4.2/gcc/config/arm/lib1funcs.asm:(.text+0xa2c):
undefined reference to `__init_array_end'
/home/mike/Buildroot/buildroot-20061011-ARM-NOMMU-NOFPU/toolchain_build_arm_nofpu/gcc-3.4.2/gcc/config/arm/lib1funcs.asm:(.text+0xa30):
undefined reference to `__init_array_start'
collect2: ld returned 1 exit status
make: *** [hello] Error 1

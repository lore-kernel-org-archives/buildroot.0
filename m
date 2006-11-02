From: renxuefeng <renxf_maillist@126.com>
Date: Thu, 02 Nov 2006 14:42:30 +0800
Subject: [Buildroot] link error "undefined reference to `__fini_array_start'"
Message-ID: <45499356.7000505@126.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i was build bash with buildroot.
my target platform was arm720t, uclibc.
when i compiling the bash-3.1 without -Wl,-elf2flt ,there was no error.
but when i added the ldflags -Wl,-elf2flt , some link error showed as
follows.

bash.elf2flt: In function `__uClibc_fini':
/home/renxf/uclinux/cross_tool/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3/gcc/config/arm/lib1funcs.asm:(.text+0x876f8):
undefined reference to `__fini_array_start'
/home/renxf/uclinux/cross_tool/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3/gcc/config/arm/lib1funcs.asm:(.text+0x876fc):
undefined reference to `__fini_array_end'
bash.elf2flt: In function `__uClibc_main':
/home/renxf/uclinux/cross_tool/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3/gcc/config/arm/lib1funcs.asm:(.text+0x8788c):
undefined reference to `__preinit_array_end'
/home/renxf/uclinux/cross_tool/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3/gcc/config/arm/lib1funcs.asm:(.text+0x87890):
undefined reference to `__preinit_array_start'
/home/renxf/uclinux/cross_tool/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3/gcc/config/arm/lib1funcs.asm:(.text+0x8789c):
undefined reference to `__init_array_end'
/home/renxf/uclinux/cross_tool/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3/gcc/config/arm/lib1funcs.asm:(.text+0x878a0):
undefined reference to `__init_array_start'
collect2: ld returned 1 exit status
make[1]: *** [bash] Error 1

anyone can help me?

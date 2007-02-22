From: Naval Saini <navalnovel@gmail.com>
Date: Thu, 22 Feb 2007 21:34:59 +0530
Subject: [Buildroot] Problems with toolchain 4.1.1 + eabi
Message-ID: <d8dd82df0702220804s5cf98ac5o60c5bc7edcb9a56e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi:

Our Configuration:-
    Architecture - arm920 ( arm v4 )  +  without FPU unit
    Toolchain - gcc-4.1.1 + eabi
     Kernel - linux 2.6.18.2 + NWFPE emulator


Problem :-
    After i applied my patch to eabi toolchain to work for v4
architecture, my kernel boots up and i get a fine shell prompt.

However, my LKM gives me following error :-
              Unknown symbol __aeabi_uldivmod

Ok, at ..

1) Some uclibc options ,

UCLIBC_HAS_FPU = y
Kernel NWFPE is selected

Other symbols that are present in my module and not giving unknown
sumbols are, for example __eabi_idiv, etc...

2)
toolchain_build_arm_nofpu/gcc-4.1.1/gcc/config/arm/t-bpabi    -->
LIB1ASMFUNCS has __aeabi_uldivmod and LIB2FUNCS_EXTRA includes bpabi.c

3)
also in,
toolchain_build_arm_nofpu/gcc-4.1.1-final/gcc/libgcc.a    -->  when i
take the objdump, it shows the pirticular function __aeabi_uldivmod


TIA,
Naval

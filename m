From: Hamish Moffatt <hamish@cloud.net.au>
Date: Mon, 15 Oct 2007 15:48:21 +1000
Subject: [Buildroot] buildroot for armeb, gcc-4.2.1 fails to build
Message-ID: <20071015054821.GA5245@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to build the current buildroot for armeb/xscale with the
default settings (including gcc-4.2.1, uClibc 0.9.29) plus EABI.

The build fails trying to link libgcc_s.so during gcc-4.2.1-final:

/home/hamish/tmp/br/buildroot/toolchain_build_armeb/gcc-4.2.1-final/./gcc/xgcc -B/home/hamish/tmp/br/buildroot/toolchain_build_armeb/gcc-4.2.1-final/./gcc/ -B/usr/armeb-linux-uclibcgnueabi/bin/ -B/usr/armeb-linux-uclibcgnueabi/lib/ -isystem /usr/armeb-linux-uclibcgnueabi/include -isystem /usr/armeb-linux-uclibcgnueabi/sys-include -O2  -g -Os -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition  -isystem ./include  -fPIC -g -DHAVE_GTHR_DEFAULT -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED  -shared -nodefaultlibs -Wl,--soname=libgcc_s.so.1 -Wl,--version-script=libgcc/./libgcc.map -o ./libgcc_s.so.1.tmp  libgcc/./_udivsi3_s.o libgcc/./_divsi3_s.o libgcc/./_umodsi3_s.o libgcc/./_modsi3_s.o libgcc/./_bb_init_func_s.o libgcc/./_call_via_rX_s.o libgcc/./_interwork_call_via_rX_s.o libgcc/./_lshrdi3_s.o libgcc/./_ashrdi3_s.o libgcc/./_ashldi3_s.o libgcc/./_negdf2_s.o libgcc/./_addsubdf3_s.o libgcc/./_muldivdf3_s.o libgcc/./_cmpdf2_s.o libgcc/./_unorddf2_s.o libgcc/./_fixdfsi_s.o libgcc/./_fixunsdfsi_s.o libgcc/./_truncdfsf2_s.o libgcc/./_negsf2_s.o libgcc/./_addsubsf3_s.o libgcc/./_muldivsf3_s.o libgcc/./_cmpsf2_s.o libgcc/./_unordsf2_s.o libgcc/./_fixsfsi_s.o libgcc/./_fixunssfsi_s.o libgcc/./_floatdidf_s.o libgcc/./_floatdisf_s.o libgcc/./_floatundidf_s.o libgcc/./_floatundisf_s.o libgcc/./_aeabi_lcmp_s.o libgcc/./_aeabi_ulcmp_s.o libgcc/./_aeabi_ldivmod_s.o libgcc/./_aeabi_uldivmod_s.o libgcc/./_dvmd_lnx_s.o libgcc/./_muldi3_s.o libgcc/./_negdi2_s.o libgcc/./_cmpdi2_s.o libgcc/./_ucmpdi2_s.o libgcc/./_clear_cache_s.o libgcc/./_enable_execute_stack_s.o libgcc/./_trampoline_s.o libgcc/./__main_s.o libgcc/./_absvsi2_s.o libgcc/./_absvdi2_s.o libgcc/./_addvsi3_s.o libgcc/./_addvdi3_s.o libgcc/./_subvsi3_s.o libgcc/./_subvdi3_s.o libgcc/./_mulvsi3_s.o libgcc/./_mulvdi3_s.o libgcc/./_negvsi2_s.o libgcc/./_negvdi2_s.o libgcc/./_ctors_s.o libgcc/./_ffssi2_s.o libgcc/./_ffsdi2_s.o libgcc/./_clz_s.o libgcc/./_clzsi2_s.o libgcc/./_clzdi2_s.o libgcc/./_ctzsi2_s.o libgcc/./_ctzdi2_s.o libgcc/./_popcount_tab_s.o libgcc/./_popcountsi2_s.o libgcc/./_popcountdi2_s.o libgcc/./_paritysi2_s.o libgcc/./_paritydi2_s.o libgcc/./_powisf2_s.o libgcc/./_powidf2_s.o libgcc/./_powixf2_s.o libgcc/./_powitf2_s.o libgcc/./_mulsc3_s.o libgcc/./_muldc3_s.o libgcc/./_mulxc3_s.o libgcc/./_multc3_s.o libgcc/./_divsc3_s.o libgcc/./_divdc3_s.o libgcc/./_divxc3_s.o libgcc/./_divtc3_s.o libgcc/./_fixunsxfsi_s.o libgcc/./_fixsfdi_s.o libgcc/./_fixunssfdi_s.o libgcc/./_fixdfdi_s.o libgcc/./_fixunsdfdi_s.o libgcc/./_fixxfdi_s.o libgcc/./_fixunsxfdi_s.o libgcc/./_floatdixf_s.o libgcc/./_floatundixf_s.o libgcc/./_fixtfdi_s.o libgcc/./_fixunstfdi_s.o libgcc/./_floatditf_s.o libgcc/./_floatunditf_s.o libgcc/./_divdi3_s.o libgcc/./_moddi3_s.o libgcc/./_udivdi3_s.o libgcc/./_umoddi3_s.o libgcc/./_udiv_w_sdiv_s.o libgcc/./_udivmoddi4_s.o libgcc/./bpabi_s.o libgcc/./unaligned-funcs_s.o libgcc/./unwind-arm_s.o libgcc/./libunwind_s.o libgcc/./pr-support_s.o libgcc/./unwind-c_s.o -lc && rm -f ./libgcc_s.so && if [ -f ./libgcc_s.so.1 ]; then mv -f ./libgcc_s.so.1 ./libgcc_s.so.1.backup; else true; fi && mv ./libgcc_s.so.1.tmp ./libgcc_s.so.1 && ln -s libgcc_s.so.1 ./libgcc_s.so
/home/hamish/tmp/br/buildroot/build_armeb/staging_dir/lib/libc.so.0: could not read symbols: File in wrong format

objdump shows that the files look correct and there's not a single little-endian .o 
in the tree so I'm a bit stumped.

Comparing libc.so.0 with a random object out of the above list it seems the flags are identical.
objdump -p says:

/home/hamish/tmp/br/buildroot/build_armeb/staging_dir/lib/libc.so.0:     file format elf32-bigarm

Program Header:
0x70000001 off    0x00038858 vaddr 0x00038858 paddr 0x00038858 align 2**2
         filesz 0x00000020 memsz 0x00000020 flags r--
    PHDR off    0x00000034 vaddr 0x00000034 paddr 0x00000034 align 2**2
         filesz 0x000000e0 memsz 0x000000e0 flags r-x
  INTERP off    0x00038828 vaddr 0x00038828 paddr 0x00038828 align 2**3
         filesz 0x00000018 memsz 0x00000018 flags r--
    LOAD off    0x00000000 vaddr 0x00000000 paddr 0x00000000 align 2**15
         filesz 0x00038878 memsz 0x00038878 flags r-x
    LOAD off    0x00038cd0 vaddr 0x00040cd0 paddr 0x00040cd0 align 2**15
         filesz 0x00000690 memsz 0x0000484c flags rw-
 DYNAMIC off    0x00038dc4 vaddr 0x00040dc4 paddr 0x00040dc4 align 2**2
         filesz 0x000000b8 memsz 0x000000b8 flags rw-
   RELRO off    0x00038cd0 vaddr 0x00040cd0 paddr 0x00040cd0 align 2**0
         filesz 0x00000330 memsz 0x00000330 flags r--

Dynamic Section:
  NEEDED      ld-uClibc.so.0
  SONAME      libc.so.0
  INIT        0x3412c
  HASH        0x114
  STRTAB      0x632c
  SYMTAB      0x219c
  STRSZ       0x2755
  SYMENT      0x10
  PLTGOT      0x40e7c
  PLTRELSZ    0x188
  PLTREL      0x11
  JMPREL      0x8eac
  REL         0x8a84
  RELSZ       0x428
  RELENT      0x8
  BIND_NOW    0x0
  FLAGS_1     0x1
  RELCOUNT    0x5b
private flags = 4000002: [Version4 EABI] [has entry point]


toolchain_build_armeb/gcc-4.2.1-final/gcc/libgcc/bpabi.o:     file format elf32-bigarm
private flags = 4000000: [Version4 EABI]

Has anyone else encountered this?

arm (little-endian) seems to build ok.

thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>

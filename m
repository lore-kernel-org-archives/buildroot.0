From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:12 -0800
Subject: [Buildroot] [buildroot 0000929]: MIPS build fail on gcc 4.0.2
Message-ID: <931419e7a67bcb38c9e1794c13831407@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=929 
====================================================================== 
Reported By:                mcallegari1979
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   929
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-02-2006 12:25 PDT
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    MIPS build fail on gcc 4.0.2
Description: 
Hi, I'm trying to compile buildroot (buildroot-20060702) for a MIPS EL
architecture but it fails compiling the libstdc++ of several compilers
(4.0.2, 4.1.0, 4.1.1)
I'm using a FC4 (gcc 4.1.1). Same happens on FC5.
Following the build messages...very similar to bug 0000925, considered
fixed.
Please help.
Thanx in advance,
Massimo 

/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/gcc/xgcc
-shared-libgcc
-B/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/gcc/
-nostdinc++
-L/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/src
-L/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/src/.libs
-B/home/develop/calmas/buildroot/build_mips/staging_dir/mips-linux-uclibc/bin/
-B/home/develop/calmas/buildroot/build_mips/staging_dir/mips-linux-uclibc/lib/
-isystem
/home/develop/calmas/buildroot/build_mips/staging_dir/mips-linux-uclibc/include
-isystem
/home/develop/calmas/buildroot/build_mips/staging_dir/mips-linux-uclibc/sys-include
-I/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/mips-linux-uclibc
-I/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include
-I/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2/libstdc++-v3/libsupc++
-g -Os -fno-implicit-templates -Wall -Wextra -Wwrite-strings -Wcast-qual
-fdiagnostics-show-location=once -ffunction-sections -fdata-sections -c
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2/libstdc++-v3/src/ext-inst.cc
 -fPIC -DPIC -o .libs/ext-inst.o
In file included from
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2/libstdc++-v3/src/ext-inst.cc:34:
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:1085:21:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2325:19:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2332:19:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2338:19:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2345:19:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2352:19:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2359:19:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2367:19:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2375:19:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2383:19:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2390:27:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2390:40:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2390:54:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2394:27:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2394:40:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2394:54:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2399:27:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2399:40:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2399:54:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2404:27:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2404:40:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2404:54:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2409:27:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2409:40:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2409:54:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2414:27:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2414:40:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2414:54:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2419:27:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2419:40:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2419:54:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2424:27:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2428:27:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2432:27:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2436:27:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2440:27:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2444:27:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2448:27:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2454:31:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2455:29:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2462:31:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2479:22:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2480:20:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2486:31:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2497:22:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2498:20:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2504:31:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2520:32:
error: macro "index" requires 2 arguments, but only 1 given
In file included from
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:2897,
                 from
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2/libstdc++-v3/src/ext-inst.cc:34:
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1665:67:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1667:26:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1667:55:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1669:28:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1669:44:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1669:63:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1671:27:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1671:45:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1671:63:
error: macro "index" requires 2 arguments, but only 1 given
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:1085:
error: expected ';' before 'const'
/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/include/ext/rope:1087:
error: expected `;' before '_Rope_iterator_base'
make[4]: *** [ext-inst.lo] Error 1
make[4]: Leaving directory
`/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3/src'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3'
make[2]: *** [all] Error 2
make[2]: Leaving directory
`/home/develop/calmas/buildroot/toolchain_build_mips/gcc-4.0.2-final/mips-linux-uclibc/libstdc++-v3'
make[1]: *** [all-target-libstdc++-v3] Error 2
====================================================================== 

---------------------------------------------------------------------- 
 anemo - 07-05-06 00:18  
---------------------------------------------------------------------- 
This error can heppen by index() macro in uClibc/include/string.h.
UCLIBC_SUSV3_LEGACY=y would be an quick workaroud. 

---------------------------------------------------------------------- 
 mcallegari1979 - 07-05-06 03:07  
---------------------------------------------------------------------- 
Hi anemo, thanx for the hint but now it breaks somewhere else during the
building of GCC:
****************************************************************
Current kernel version is 2.4.31

Using kernel headers from 2.4.31 for architecture 'mips'
        provided in directory
/home/develop/calmas/buildroot/toolchain_build_mipsel/linux/

  CC ldso/ldso/ldso.oS
ldso/ldso/ldso.c:179: error: conflicting types for '_dl_get_ready_to_run'
./ldso/include/ldso.h:92: error: previous declaration of
'_dl_get_ready_to_run' was here
make[1]: *** [ldso/ldso/ldso.oS] Error 1
**************************************************************

I needed to patch ldso.h:
extern void _dl_get_ready_to_run(struct elf_resolve *tpnt, ElfW(Addr)
load_addr,
		ElfW(auxv_t) auxvt[AT_EGID + 1], char **envp, char **argv);

Then it goes on...
If the build of java compiler is enabled then it blocks again on libjava.
In my case i don't need it so I disabled it.
If I have any other info I'll post them here.

Cheers by now
Massimo 

---------------------------------------------------------------------- 
 bowerymarc - 07-16-06 18:53  
---------------------------------------------------------------------- 
I got the same bug trying to build gcc-3.4.3 for arm:

/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/gcc/xgcc
-shared-libgcc
-B/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/gcc/
-nostdinc++
-L/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/src
-L/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/src/.libs
-B/home/tools/buildroot/build_arm_nofpu/staging_dir/arm-linux-uclibc/bin/
-B/home/tools/buildroot/build_arm_nofpu/staging_dir/arm-linux-uclibc/lib/
-isystem
/home/tools/buildroot/build_arm_nofpu/staging_dir/arm-linux-uclibc/include
-isystem
/home/tools/buildroot/build_arm_nofpu/staging_dir/arm-linux-uclibc/sys-include
-I/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/arm-linux-uclibc
-I/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include
-I/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3/libstdc++-v3/libsupc++
-g -Os -g -Os -fno-implicit-templates -Wall -W -Wwrite-strings -Wcast-qual
-fdiagnostics-show-location=once -ffunction-sections -fdata-sections -c
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3/libstdc++-v3/src/ext-inst.cc
 -fPIC -DPIC -o .libs/ext-inst.o
In file included from
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3/libstdc++-v3/src/ext-inst.cc:34:
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:934:18:
macro "index" requires 2 arguments, but only 1 given
In file included from
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3/libstdc++-v3/src/ext-inst.cc:34:
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:934:
error: expected `;' before "const"
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:935:
error: expected `;' before "_Rope_iterator_base"
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2011:36:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2013:36:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2015:36:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2017:36:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2019:36:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2021:36:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2024:36:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2027:36:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2030:36:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2035:37:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2035:50:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2035:64:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2037:37:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2037:50:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2037:64:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2040:37:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2040:50:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2040:64:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2043:37:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2043:50:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2043:64:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2046:37:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2046:50:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2046:64:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2049:37:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2049:50:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2049:64:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2052:37:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2052:50:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2052:64:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2056:37:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2058:37:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2060:37:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2062:37:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2064:37:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2067:37:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2069:37:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2073:42:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2074:40:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2078:42:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2093:23:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2094:21:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2098:42:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2107:61:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2107:76:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2111:42:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2124:43:
macro "index" requires 2 arguments, but only 1 given
In file included from
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/rope:2492,
                 from
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3/libstdc++-v3/src/ext-inst.cc:34:
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1497:62:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1499:29:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1499:58:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1501:31:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1501:47:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1501:66:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1503:30:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1503:48:
macro "index" requires 2 arguments, but only 1 given
/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/include/ext/ropeimpl.h:1503:66:
macro "index" requires 2 arguments, but only 1 given
make[4]: *** [ext-inst.lo] Error 1
make[4]: Leaving directory
`/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3/src'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3'
make[2]: *** [all] Error 2
make[2]: Leaving directory
`/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/arm-linux-uclibc/libstdc++-v3'
make[1]: *** [all-target-libstdc++-v3] Error 2
make[1]: Leaving directory
`/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final'
make: ***
[/home/tools/buildroot/toolchain_build_arm_nofpu/gcc-3.4.3-final/.compiled]
Error 2 

---------------------------------------------------------------------- 
 bowerymarc - 07-16-06 19:14  
---------------------------------------------------------------------- 
I manually edited rope and ropeimpl.h to reflect the patch in the 4.1.0
branch and that lets it compile (haven't tested it further than that)...
so it looks like that patch should be more widely applied (some of us have
to use 3.4.3 etc.)

Found the patch here:
http://www.uclibc.org/cgi-bin/viewcvs.cgi/trunk/buildroot/toolchain/gcc/4.1.0/304-index_macro.patch?rev=14655&view=markup


---------------------------------------------------------------------- 
 sven - 11-07-06 02:32  
---------------------------------------------------------------------- 
Same issue at gcc 3.4.2, 
cross compiling - Host: AMD64, Target: i686
Patch worked. 

---------------------------------------------------------------------- 
 bernhardf - 11-22-06 14:12  
---------------------------------------------------------------------- 
This is fixed with the 304-index-macro patch for gcc-3.4.6 and later. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-02-06 12:25  mcallegari1979 New Issue                                    
07-02-06 12:25  mcallegari1979 Status                   new => assigned     
07-02-06 12:25  mcallegari1979 Assigned To               => uClibc          
07-05-06 00:18  anemo          Note Added: 0001495                          
07-05-06 03:07  mcallegari1979 Note Added: 0001496                          
07-16-06 18:53  bowerymarc     Note Added: 0001525                          
07-16-06 19:14  bowerymarc     Note Added: 0001526                          
11-07-06 02:32  sven           Note Added: 0001735                          
11-22-06 14:12  bernhardf      Status                   assigned => closed  
11-22-06 14:12  bernhardf      Note Added: 0001779                          
11-22-06 14:12  bernhardf      Resolution               open => fixed       
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================

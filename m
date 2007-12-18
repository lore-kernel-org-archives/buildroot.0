From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 18 Dec 2007 04:30:00 -0800
Subject: [Buildroot] [buildroot 0001804]: gcc-4.2.1-final compilation error
Message-ID: <9a5b5d44c6be782d89e22bb9fa8189df@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1804 
====================================================================== 
Reported By:                dl9pf
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1804
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-18-2007 04:21 PST
Last Modified:              12-18-2007 04:29 PST
====================================================================== 
Summary:                    gcc-4.2.1-final compilation error
Description: 
Buildhost is Core2Duo
Target is avr32

buildroot is rev. 20657 / svn HEAD


/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-final/./gcc/xgcc
-shared-libgcc
-B/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-final/./gcc
-nostdinc++
-L/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-final/avr32-linux-uclibc/libstdc++-v3/src
-L/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-final/avr32-linux-uclibc/libstdc++-v3/src/.libs
-B/build/buildroot/build_avr32/staging_dir/avr32-linux-uclibc/bin/
-B/build/buildroot/build_avr32/staging_dir/avr32-linux-uclibc/lib/
-isystem
/build/buildroot/build_avr32/staging_dir/avr32-linux-uclibc/include
-isystem
/build/buildroot/build_avr32/staging_dir/avr32-linux-uclibc/sys-include
-I/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-final/avr32-linux-uclibc/libstdc++-v3/include/avr32-linux-uclibc
-I/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-final/avr32-linux-uclibc/libstdc++-v3/include
-I/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-avr32-2.1.3/libstdc++-v3/libsupc++
-fno-implicit-templates -Wall -Wextra -Wwrite-strings -Wcast-qual
-fdiagnostics-show-location=once -ffunction-sections -fdata-sections -g
-Os -c
/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-avr32-2.1.3/libstdc++-v3/src/fstream-inst.cc
-o fstream-inst.o
/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-final/./gcc/xgcc
-shared-libgcc
-B/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-final/./gcc
-nostdinc++
-L/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-final/avr32-linux-uclibc/libstdc++-v3/src
-L/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-final/avr32-linux-uclibc/libstdc++-v3/src/.libs
-B/build/buildroot/build_avr32/staging_dir/avr32-linux-uclibc/bin/
-B/build/buildroot/build_avr32/staging_dir/avr32-linux-uclibc/lib/
-isystem
/build/buildroot/build_avr32/staging_dir/avr32-linux-uclibc/include
-isystem
/build/buildroot/build_avr32/staging_dir/avr32-linux-uclibc/sys-include
-I/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-final/avr32-linux-uclibc/libstdc++-v3/include/avr32-linux-uclibc
-I/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-final/avr32-linux-uclibc/libstdc++-v3/include
-I/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-avr32-2.1.3/libstdc++-v3/libsupc++
-fno-implicit-templates -Wall -Wextra -Wwrite-strings -Wcast-qual
-fdiagnostics-show-location=once -ffunction-sections -fdata-sections -g
-Os
-I/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-final/avr32-linux-uclibc/libstdc++-v3/include/backward
-Wno-deprecated -c
/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-avr32-2.1.3/libstdc++-v3/src/strstream.cc
-o strstream.o
/tmp/ccML2EFb.s: Assembler messages:
/tmp/ccML2EFb.s:333: Error: operand out of range (-4294967288 not between
-1048576 and 1048576)
/tmp/ccML2EFb.s:482: Error: operand out of range (-4294967288 not between
-1048576 and 1048576)
make[5]: *** [strstream.lo] Fehler 1
make[5]: *** Warte auf noch nicht beendete Prozesse...
/tmp/cc9US4e7.s: Assembler messages:
/tmp/cc9US4e7.s:3506: Error: operand out of range (-4294967288 not between
-1048576 and 1048576)
/tmp/cc9US4e7.s:3654: Error: operand out of range (-4294967288 not between
-1048576 and 1048576)
/tmp/cc9US4e7.s:6352: Error: operand out of range (-4294967288 not between
-1048576 and 1048576)
/tmp/cc9US4e7.s:6500: Error: operand out of range (-4294967288 not between
-1048576 and 1048576)
make[5]: *** [fstream-inst.lo] Fehler 1
make[5]: Leaving directory
`/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-final/avr32-linux-uclibc/libstdc++-v3/src'
make[4]: *** [all-recursive] Fehler 1
make[4]: Leaving directory
`/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-final/avr32-linux-uclibc/libstdc++-v3'
make[3]: *** [all] Fehler 2
make[3]: Leaving directory
`/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-final/avr32-linux-uclibc/libstdc++-v3'
make[2]: *** [all-target-libstdc++-v3] Fehler 2
make[2]: Leaving directory
`/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-final'
make[1]: *** [all] Fehler 2
make[1]: Leaving directory
`/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-final'
make: ***
[/build/buildroot/toolchain_build_avr32_nofpu/gcc-4.2.1-final/.compiled]


====================================================================== 

---------------------------------------------------------------------- 
 hcegtvedt - 12-18-07 04:29  
---------------------------------------------------------------------- 
Bug in GCC 4.2.1 when built on 64-bit hosts, see the attached patch. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-18-07 04:21  dl9pf          New Issue                                    
12-18-07 04:21  dl9pf          Status                   new => assigned     
12-18-07 04:21  dl9pf          Assigned To               => buildroot       
12-18-07 04:29  hcegtvedt      File Added:
908-avr32-fix-invalid-assembler-code-on-64bit-hosts.patch                    
12-18-07 04:29  hcegtvedt      Note Added: 0003239                          
======================================================================

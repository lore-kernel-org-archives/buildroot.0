From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:42 -0800
Subject: [Buildroot] [buildroot 0000818]: GDB fails to compile
Message-ID: <da193fbc1167d986ccebe839145cb5bc@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=818 
====================================================================== 
Reported By:                blurgk
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   818
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-07-2006 04:54 PDT
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    GDB fails to compile
Description: 
GDB 6.4 fails to compile for ARM. When enabling "Build GDB debugger for the
Target", it gives the following error:

make[3]: Entering directory
`/usr/src/buildroot-20060308/build_arm/gdb-6.4-target/gdb'
rm -f gdb
/usr/src/buildroot-20060308/build_arm/staging_dir/bin/arm-linux-uclibc-gcc
-g -O2  -Os -pipe       \
        -o gdb gdb.o libgdb.a \
           ../readline/libreadline.a ../opcodes/libopcodes.a
../bfd/libbfd.a  ../libiberty/libiberty.a     -lncurses -lm 
../libiberty/libiberty.a  -ldl -rdynamic
libgdb.a(breakpoint.o): In function `watchpoint_check':
/usr/src/buildroot-20060308/toolchain_build_arm/gdb-6.4/gdb/breakpoint.c:2560:
undefined reference to `async_reason_lookup'
libgdb.a(breakpoint.o): In function `print_it_typical':
/usr/src/buildroot-20060308/toolchain_build_arm/gdb-6.4/gdb/breakpoint.c:2118:
undefined reference to `async_reason_lookup'
/usr/src/buildroot-20060308/toolchain_build_arm/gdb-6.4/gdb/breakpoint.c:2254:
undefined reference to `async_reason_lookup'
/usr/src/buildroot-20060308/toolchain_build_arm/gdb-6.4/gdb/breakpoint.c:2276:
undefined reference to `async_reason_lookup'
/usr/src/buildroot-20060308/toolchain_build_arm/gdb-6.4/gdb/breakpoint.c:2294:
undefined reference to `async_reason_lookup'
libgdb.a(breakpoint.o):/usr/src/buildroot-20060308/toolchain_build_arm/gdb-6.4/gdb/breakpoint.c:2310:
more undefined references to `async_reason_lookup' follow
collect2: ld returned 1 exit status
make[3]: *** [gdb] Error 1
make[3]: Leaving directory
`/usr/src/buildroot-20060308/build_arm/gdb-6.4-target/gdb'
make[2]: *** [all-gdb] Error 2
make[2]: Leaving directory
`/usr/src/buildroot-20060308/build_arm/gdb-6.4-target'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/usr/src/buildroot-20060308/build_arm/gdb-6.4-target'
make: *** [/usr/src/buildroot-20060308/build_arm/gdb-6.4-target/gdb/gdb]
Error 
====================================================================== 

---------------------------------------------------------------------- 
 blurgk - 04-18-06 04:13  
---------------------------------------------------------------------- 
This problem is solved by disabling the disable GDBMI option:
http://bugs.uclibc.org/view.php?id=602 

---------------------------------------------------------------------- 
 bernhardf - 12-01-06 10:05  
---------------------------------------------------------------------- 
Looks like this was fixed by sjhill in r15611.

Thanks for your report. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-07-06 04:54  blurgk         New Issue                                    
04-07-06 04:54  blurgk         Status                   new => assigned     
04-07-06 04:54  blurgk         Assigned To               => uClibc          
04-18-06 04:13  blurgk         Note Added: 0001307                          
12-01-06 10:05  bernhardf      Status                   assigned => closed  
12-01-06 10:05  bernhardf      Note Added: 0001849                          
12-01-06 10:05  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================

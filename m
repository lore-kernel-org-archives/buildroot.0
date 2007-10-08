From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 8 Oct 2007 07:32:48 -0700
Subject: [Buildroot] [buildroot 0001523]: Failed to compile native target
	gcc ( using host header files? )
Message-ID: <18f1474fdb693bce58845c4985aca186@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1523 
====================================================================== 
Reported By:                ndsal
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1523
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-08-2007 07:32 PDT
Last Modified:              10-08-2007 07:32 PDT
====================================================================== 
Summary:                    Failed to compile native target gcc ( using host
header files? )
Description: 

Using X86_64 host to build a i386 target - the log below shows an error
which stops the building/installing of a native compiler in the target.

I suspect the fact that the compile is using the hosts header files is a
problem.

buildroot .config also attached.

-- Error/Log below --

i386-linux-uclibc-gcc  -O2 -O2 -Os -pipe 
-I/home/harry/nds/buildroot/build_i386/staging_dir/usr/include
-I/home/harry/nds/buildroot/build_i386/staging_dir/include
--sysroot=/home/harry/nds/buildroot/build_i386/staging_dir/ -isysroot
/home/harry/nds/buildroot/build_i386/staging_dir -mtune=i386 -march=i386  
-DIN_GCC    -W -Wall -Wwrite-strings -Wstrict-prototypes
-Wmissing-prototypes -Wold-style-definition  -isystem ./include  -I. -I.
-I/home/harry/nds/buildroot/toolchain_build_i386/gcc-4.2.1/gcc
-I/home/harry/nds/buildroot/toolchain_build_i386/gcc-4.2.1/gcc/.
-I/home/harry/nds/buildroot/toolchain_build_i386/gcc-4.2.1/gcc/../include
-I./../intl
-I/home/harry/nds/buildroot/toolchain_build_i386/gcc-4.2.1/gcc/../libcpp/include
 -I/home/harry/nds/buildroot/toolchain_build_i386/gcc-4.2.1/gcc/../libdecnumber
-I../libdecnumber  -g0 -finhibit-size-directive -fno-inline-functions
-fno-exceptions -fno-zero-initialized-in-bss -fno-toplevel-reorder 
-fno-omit-frame-pointer \
	  -c
/home/harry/nds/buildroot/toolchain_build_i386/gcc-4.2.1/gcc/crtstuff.c
-DCRT_BEGIN \
	  -o crtbegin.o
make[3]: Leaving directory
`/home/harry/nds/buildroot/build_i386/gcc-4.2.1-target/gcc'
make[2]: Leaving directory
`/home/harry/nds/buildroot/build_i386/gcc-4.2.1-target'
make[1]: Leaving directory
`/home/harry/nds/buildroot/build_i386/gcc-4.2.1-target'
In file included from
/home/harry/nds/buildroot/toolchain_build_i386/gcc-4.2.1/gcc/tsystem.h:90,
                 from
/home/harry/nds/buildroot/toolchain_build_i386/gcc-4.2.1/gcc/crtstuff.c:68:
./include/stdio.h:18:40: error: gentoo-multilib/x86/stdio.h: No such file
or directory
make[3]: *** [crtbegin.o] Error 1
make[2]: *** [all-gcc] Error 2
make[1]: *** [all] Error 2
make: ***
[/home/harry/nds/buildroot/build_i386/gcc-4.2.1-target/.compiled] Error 2
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-08-07 07:32  ndsal          New Issue                                    
10-08-07 07:32  ndsal          Status                   new => assigned     
10-08-07 07:32  ndsal          Assigned To               => buildroot       
10-08-07 07:32  ndsal          File Added: .config                          
======================================================================

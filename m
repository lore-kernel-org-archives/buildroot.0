From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:10 -0800
Subject: [Buildroot] [buildroot 0000934]: gcc 4.1.0 fails to compile on
	x86_64 arch
Message-ID: <fa2ef5441f038d260f9a12459af115bf@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=934 
====================================================================== 
Reported By:                qmi
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   934
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-04-2006 05:39 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    gcc 4.1.0 fails to compile on x86_64 arch
Description: 
make[4]: Leaving directory
`/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0-initial/gcc'
/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0-initial/./gcc/xgcc
-B/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0-initial/./gcc/
-B/DEVEL/iCallBox/
iCallBox-SVN/build_x86_64/staging_dir/x86_64-linux-uclibc/bin/
-B/DEVEL/iCallBox/iCallBox-SVN/build_x86_64/staging_dir/x86_64-linux-uclibc/lib/
-isystem /DEVEL/iCallBox/iCallBox-
SVN/build_x86_64/staging_dir/x86_64-linux-uclibc/include -isystem
/DEVEL/iCallBox/iCallBox-SVN/build_x86_64/staging_dir/x86_64-linux-uclibc/sys-include
-O2  -g -Os -DIN_GCC -DCRO
SS_COMPILE -DNATIVE_CROSS   -W -Wall -Wwrite-strings -Wstrict-prototypes
-Wmissing-prototypes -Wold-style-definition  -isystem ./include  -fPIC -g
-DHAVE_GTHR_DEFAULT -DIN_LIBGCC
2 -D__GCC_FLOAT_NOT_NEEDED  -I. -I.
-I/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0/gcc
-I/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0/gcc/.
-I/D
EVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0/gcc/../include
-I/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0/gcc/../libcpp/include
 -m32  -fexceptio
ns -c
/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0/gcc/unwind-dw2.c
-o libgcc/32/unwind-dw2.o
In file included from
/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0/gcc/unwind-dw2.c:256:
/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0/gcc/config/i386/linux-unwi
nd.h: In function 'x86_fallback_frame_state':
/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0/gcc/config/i386/linux-unwind.h:152:
error: 'struct sigcontext' has no member named 'esp'
/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0/gcc/config/i386/linux-unwind.h:159:
error: 'struct sigcontext' has no member named 'eax'
/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0/gcc/config/i386/linux-unwind.h:161:
error: 'struct sigcontext' has no member named 'ebx'
/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0/gcc/config/i386/linux-unwind.h:163:
error: 'struct sigcontext' has no member named 'ecx'
/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0/gcc/config/i386/linux-unwind.h:165:
error: 'struct sigcontext' has no member named 'edx'
/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0/gcc/config/i386/linux-unwind.h:167:
error: 'struct sigcontext' has no member named 'esi'
/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0/gcc/config/i386/linux-unwind.h:169:
error: 'struct sigcontext' has no member named 'edi'
/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0/gcc/config/i386/linux-unwind.h:171:
error: 'struct sigcontext' has no member named 'ebp'
/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0/gcc/config/i386/linux-unwind.h:173:
error: 'struct sigcontext' has no member named 'eip'
make[3]: *** [libgcc/32/unwind-dw2.o] Error 1
make[3]: Leaving directory
`/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0-initial/gcc'
make[2]: *** [stmp-multilib] Error 2
make[2]: Leaving directory
`/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0-initial/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory
`/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0-initial'
make: ***
[/DEVEL/iCallBox/iCallBox-SVN/toolchain_build_x86_64/gcc-4.1.0-initial/.compiled]
Error 2

System info:
------------

uClibc version 0.9.28
gcc 4.1.0
multilib is disabled
BR2_ARCH="x86_64"
BR2_DEFAULT_KERNEL_HEADERS="2.6.12"

We cannot proceed compiling x86_64 architecture. Any progress, let us
know. TIA, Miklos
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 07-04-06 14:12  
---------------------------------------------------------------------- 
x86_64 is not usuable in the 0.9.28 release, you need the latest svn

i just built a 4.1.1 buildroot with svn and it seemed to work ok for me 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-04-06 05:39  qmi            New Issue                                    
07-04-06 05:39  qmi            Status                   new => assigned     
07-04-06 05:39  qmi            Assigned To               => uClibc          
07-04-06 05:40  qmi            File Added: make-x86_64.out                    
07-04-06 14:12  vapier         Note Added: 0001494                          
07-04-06 14:12  vapier         Status                   assigned => closed  
07-04-06 14:12  vapier         Resolution               open => unable to
reproduce
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================

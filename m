From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:52 -0800
Subject: [Buildroot] [buildroot 0000552]: File
	libpthread/linuxthreads/Makefile.in not found,
	causes buildroot to stop compiling
Message-ID: <e430144359c964067824635773a6753a@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=552 
====================================================================== 
Reported By:                swolfgarten
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   552
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-20-2005 15:01 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    File libpthread/linuxthreads/Makefile.in not found,
causes buildroot to stop compiling
Description: 
Hi,

I am trying to use buildroot to create busybox which is linked against
uclibc (rather than libc). Therefore I downloaded the daily snapshot of
buildroot, extracted it and issued the "make" command in order to
configure this thing. However even if I don't change anything in the
standard configation of the software I end up getting these error
messages:

$ make

[ ... ]

cp toolchain/uClibc/uClibc.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/bin/sed -i
-e
's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="/home/sebastian/test/buildroot/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-",g'
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/bin/sed -i
-e 's,^.*TARGET_i386.*,TARGET_i386=y,g' \
       
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/bin/sed -i
-e 's,^TARGET_ARCH.*,TARGET_ARCH=\"i386\",g'
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/bin/sed -i
-e
's,^KERNEL_SOURCE=.*,KERNEL_SOURCE=\"/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/linux\",g'
\
       
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/bin/sed -i
-e 's,^RUNTIME_PREFIX=.*,RUNTIME_PREFIX=\"/\",g' \
       
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/bin/sed -i
-e 's,^DEVEL_PREFIX=.*,DEVEL_PREFIX=\"/usr/\",g' \
       
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/bin/sed -i
-e 's,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX=\"/lib\",g' \
       
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/bin/sed -i
-e 's,^.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=y,g'
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/bin/sed -i
-e 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g'
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
mkdir -p
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc_dev/usr/include
mkdir -p
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc_dev/usr/lib
mkdir -p
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc_dev/lib
make -C
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc \
PREFIX=/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc_dev/
\
DEVEL_PREFIX=/usr/ \
RUNTIME_PREFIX=/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc_dev/
\
HOSTCC="gcc" \
        pregen install_dev;
make[1]:
/home/sebastian/test/buildroot/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-gcc:
Command not found
make[1]: Entering directory
`/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc'
make[1]:
/home/sebastian/test/buildroot/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-gcc:
Command not found
make[1]: Entering directory
`/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc'
make[1]: Entering directory
`/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc'
libpthread/Makefile.in:9: libpthread/linuxthreads/Makefile.in: No such
file or directory
make[1]: *** No rule to make target `libpthread/linuxthreads/Makefile.in'.
 Stop.
make[1]: Leaving directory
`/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc'
make: ***
[/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.configured]
Error 2

make
cp toolchain/uClibc/uClibc.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/bin/sed -i
-e
's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="/home/sebastian/test/buildroot/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-",g'
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/bin/sed -i
-e 's,^.*TARGET_i386.*,TARGET_i386=y,g' \
       
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/bin/sed -i
-e 's,^TARGET_ARCH.*,TARGET_ARCH=\"i386\",g'
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/bin/sed -i
-e
's,^KERNEL_SOURCE=.*,KERNEL_SOURCE=\"/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/linux\",g'
\
       
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/bin/sed -i
-e 's,^RUNTIME_PREFIX=.*,RUNTIME_PREFIX=\"/\",g' \
       
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/bin/sed -i
-e 's,^DEVEL_PREFIX=.*,DEVEL_PREFIX=\"/usr/\",g' \
       
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/bin/sed -i
-e 's,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX=\"/lib\",g' \
       
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/bin/sed -i
-e 's,^.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=y,g'
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/bin/sed -i
-e 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g'
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.config
mkdir -p
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc_dev/usr/include
mkdir -p
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc_dev/usr/lib
mkdir -p
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc_dev/lib
make -C
/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc \
PREFIX=/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc_dev/
\
DEVEL_PREFIX=/usr/ \
RUNTIME_PREFIX=/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc_dev/
\
HOSTCC="gcc" \
        pregen install_dev;
make[1]:
/home/sebastian/test/buildroot/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-gcc:
Command not found
make[1]: Entering directory
`/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc'
make[1]:
/home/sebastian/test/buildroot/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-gcc:
Command not found
make[1]: Entering directory
`/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc'
make[1]: Entering directory
`/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc'
libpthread/Makefile.in:9: libpthread/linuxthreads/Makefile.in: No such
file or directory
make[1]: *** No rule to make target `libpthread/linuxthreads/Makefile.in'.
 Stop.
make[1]: Leaving directory
`/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc'
make: ***
[/home/sebastian/test/buildroot/buildroot/toolchain_build_i686/uClibc/.configured]
Error 2

Any ideas what might cause this?

Thanks a lot and bye,
Sebastian

====================================================================== 

---------------------------------------------------------------------- 
 swolfgarten - 11-20-05 15:02  
---------------------------------------------------------------------- 
Hi,

I should probably add then I am using Gentoo and I unset CC and CXX before
executing "make" etc.

Bye,
Seb 

---------------------------------------------------------------------- 
 vapier - 11-20-05 16:00  
---------------------------------------------------------------------- 
changed default config to use linuxthreads.old

Gentoo no longer exports CC/CXX so that doesnt matter 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-20-05 15:01  swolfgarten    New Issue                                    
11-20-05 15:01  swolfgarten    Status                   new => assigned     
11-20-05 15:01  swolfgarten    Assigned To               => uClibc          
11-20-05 15:02  swolfgarten    Note Added: 0000683                          
11-20-05 16:00  vapier         Note Added: 0000684                          
11-20-05 16:00  vapier         Status                   assigned => closed  
11-20-05 16:00  vapier         Resolution               open => fixed       
11-20-05 16:00  vapier         View Status              private => public   
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================

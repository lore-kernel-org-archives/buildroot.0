From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:31 -0800
Subject: [Buildroot] [buildroot 0000497]: libpthreads is broken for sh4
Message-ID: <305949569e2df5505bcdc823aa3eabd5@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=497 
====================================================================== 
Reported By:                Masta-G
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   497
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-21-2005 07:35 PDT
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    libpthreads is broken for sh4
Description: 
Tried the latest cvs of buildroot to build a toolchain for sh4 little
endian.
I used the latest snapshot of uClibc, gcc 3.4.2 and the 2.6.12 headers.
When I try to build the toolchain it will give the following error:

/home/mastag/dc/buildroot/build_sh4/staging_dir/bin/sh4-linux-uclibc-strip
-X --strip-debug -R .note -R .comment attr.o cancel.o condvar.o errno.o
events.o join.o lockfile.o manager.o mutex.o oldsemaphore.o pt-machine.o
ptfork.o pthread.o ptlongjmp.o rwlock.o semaphore.o signals.o specific.o
spinlock.o
/home/mastag/dc/buildroot/build_sh4/staging_dir/bin/sh4-linux-uclibc-ar cr
../../lib/libpthread.a attr.o cancel.o condvar.o errno.o events.o join.o
lockfile.o manager.o mutex.o oldsemaphore.o pt-machine.o ptfork.o
pthread.o ptlongjmp.o rwlock.o semaphore.o signals.o specific.o
spinlock.o
/home/mastag/dc/buildroot/build_sh4/staging_dir/bin/sh4-linux-uclibc-ar cr
../../lib/libpthread.a
rm -f ../../lib/libpthread-0.9.28.so ../../lib/libpthread.so.0
../../lib/libpthread.so
/home/mastag/dc/buildroot/build_sh4/staging_dir/bin/sh4-linux-uclibc-ld
-EL -shared --warn-common --warn-once -z combreloc -z defs
-soname=libpthread.so.0 \
        -o ../../lib/libpthread-0.9.28.so ../../lib/crti.o
/home/mastag/dc/buildroot/build_sh4/staging_dir/lib/gcc/sh4-linux-uclibc/3.4.2/crtbeginS.o
--whole-archive ../../lib/libpthread.a \
        --no-whole-archive ../../libc/misc/internals/interp.o \
        -L../../lib -lc 
/home/mastag/dc/buildroot/build_sh4/staging_dir/lib/gcc/sh4-linux-uclibc/3.4.2/libgcc.a
/home/mastag/dc/buildroot/build_sh4/staging_dir/lib/gcc/sh4-linux-uclibc/3.4.2/crtendS.o
../../lib/crtn.o
../../lib/libpthread.a(attr.o): In function
`__pthread_attr_setstacksize':
: undefined reference to `__pthread_max_stacksize'
../../lib/libpthread.a(attr.o): In function
`__pthread_attr_setstacksize':
: undefined reference to `__pthread_init_max_stacksize'
make[3]: *** [../../lib/libpthread.so] Error 1
make[3]: Leaving directory
`/home/mastag/dc/buildroot/toolchain_build_sh4/uClibc/libpthread/linuxthreads'
make[2]: *** [_dir_linuxthreads] Error 2
make[2]: Leaving directory
`/home/mastag/dc/buildroot/toolchain_build_sh4/uClibc/libpthread'
make[1]: *** [_dir_libpthread] Fout 2
make[1]: Leaving directory
`/home/mastag/dc/buildroot/toolchain_build_sh4/uClibc'
make: ***
[/home/mastag/dc/buildroot/toolchain_build_sh4/uClibc/lib/libc.a] Fout 2
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-21-05 07:35  Masta-G        New Issue                                    
10-21-05 07:35  Masta-G        Status                   new => assigned     
10-21-05 07:35  Masta-G        Assigned To               => uClibc          
01-24-06 11:36  prpplague      Status                   assigned => resolved
01-24-06 11:36  prpplague      Resolution               open => fixed       
01-24-06 11:36  prpplague      Additional Information Updated                   

03-08-06 16:54  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================

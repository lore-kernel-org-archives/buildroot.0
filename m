From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:47:32 -0800
Subject: [Buildroot] [buildroot 0000621]: uClibc build for SuperH fails
Message-ID: <9ffb392f32d0f15289df8565ce0c27ff@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=621 
====================================================================== 
Reported By:                cfant
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   621
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             01-03-2006 11:06 PST
Last Modified:              02-12-2007 05:47 PST
====================================================================== 
Summary:                    uClibc build for SuperH fails
Description: 
When building uClibc for SuperH compilation fails, because compiler can't
find ubc.h. This file is in asm/cpu and not under asm. See file ptrace.h.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 01-03-06 11:50  
---------------------------------------------------------------------- 
considering you didnt post any real information (like a build error log)
and that it works just fine for me with SH4, and that nowhere in the
uClibc source is the header file "ubc.h" used, i have to assume your
kernel headers suck and thus this is not a uClibc issue 

---------------------------------------------------------------------- 
 cfant - 01-05-06 12:56  
---------------------------------------------------------------------- 
Here is the releavnt part of the build log:

  CC libc/inet/rpc/rpc_thread.os
In file included from ./include/asm/user.h:4,
                 from ./include/sys/user.h:24,
                 from ./include/sys/procfs.h:31,
                 from
./libpthread/linuxthreads.old/../linuxthreads.old_db/proc_service.h:20,
                 from
./libpthread/linuxthreads.old/../linuxthreads.old_db/thread_dbP.h:9,
                 from ./libpthread/linuxthreads.old/internals.h:30,
                 from
./libpthread/linuxthreads.old/sysdeps/pthread/bits/libc-tsd.h:38,
                 from libc/inet/rpc/rpc_thread.c:9:
./include/asm/ptrace.h:4:21: asm/ubc.h: No such file or directory
In file included from ./libpthread/linuxthreads.old/internals.h:323,
                 from
./libpthread/linuxthreads.old/sysdeps/pthread/bits/libc-tsd.h:38,
                 from libc/inet/rpc/rpc_thread.c:9:
./include/bits/uClibc_page.h:25:1: warning: "PAGE_SHIFT" redefined
In file included from ./include/asm/user.h:5,
                 from ./include/sys/user.h:24,
                 from ./include/sys/procfs.h:31,
                 from
./libpthread/linuxthreads.old/../linuxthreads.old_db/proc_service.h:20,
                 from
./libpthread/linuxthreads.old/../linuxthreads.old_db/thread_dbP.h:9,
                 from ./libpthread/linuxthreads.old/internals.h:30,
                 from
./libpthread/linuxthreads.old/sysdeps/pthread/bits/libc-tsd.h:38,
                 from libc/inet/rpc/rpc_thread.c:9:
./include/asm/page.h:7:1: warning: this is the location of the previous
definition
In file included from ./libpthread/linuxthreads.old/internals.h:323,
                 from
./libpthread/linuxthreads.old/sysdeps/pthread/bits/libc-tsd.h:38,
                 from libc/inet/rpc/rpc_thread.c:9:
./include/bits/uClibc_page.h:26:1: warning: "PAGE_SIZE" redefined
In file included from ./include/asm/user.h:5,
                 from ./include/sys/user.h:24,
                 from ./include/sys/procfs.h:31,
                 from
./libpthread/linuxthreads.old/../linuxthreads.old_db/proc_service.h:20,
                 from
./libpthread/linuxthreads.old/../linuxthreads.old_db/thread_dbP.h:9,
                 from ./libpthread/linuxthreads.old/internals.h:30,
                 from
./libpthread/linuxthreads.old/sysdeps/pthread/bits/libc-tsd.h:38,
                 from libc/inet/rpc/rpc_thread.c:9:
./include/asm/page.h:6:1: warning: this is the location of the previous
definition
make[2]: *** [libc/inet/rpc/rpc_thread.os] Error 1
make[2]: Leaving directory
`/opt/buildroot-20060105/toolchain_build_sh4/uClibc'
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory
`/opt/buildroot-20060105/toolchain_build_sh4/uClibc'
make: *** [/opt/buildroot-20060105/toolchain_build_sh4/uClibc/lib/libc.a]
Error 2

I used daily snapshot for uclibc and busybox dated 01/05/2006. Gcc is
3.4.3, binutils 2.15.94.0.2.2 and kernel headers are for 2.6.11 which were
provided with buildroot. So this can be a problem with buildroot also. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
01-03-06 11:06  cfant          New Issue                                    
01-03-06 11:06  cfant          Status                   new => assigned     
01-03-06 11:06  cfant          Assigned To               => uClibc          
01-03-06 11:50  vapier         Note Added: 0000844                          
01-03-06 11:50  vapier         Status                   assigned => closed  
01-03-06 11:50  vapier         Resolution               open => unable to
reproduce
01-05-06 12:56  cfant          Status                   closed => feedback  
01-05-06 12:56  cfant          Resolution               unable to reproduce =>
reopened
01-05-06 12:56  cfant          Note Added: 0000855                          
01-05-06 12:57  cfant          File Added: make.zip                         
01-05-06 18:51  vapier         Project                  uClibc => buildroot 
01-24-06 11:37  prpplague      version                  0.9.28 =>           
01-24-06 11:37  prpplague      Additional Information Updated                   

01-24-06 11:37  prpplague      Status                   feedback => resolved
01-24-06 11:37  prpplague      Resolution               reopened => fixed   
03-08-06 16:54  vapier         Status                   resolved => closed  
02-12-07 05:47  vapier         Status                   closed => assigned  
02-12-07 05:47  vapier         Assigned To              uClibc => buildroot 
======================================================================

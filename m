From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:51 -0800
Subject: [Buildroot] [buildroot 0000559]: Re-Open,
	nightly build of November 23rd still leads to "Your architecture
	doesn't seem to provide mmap()"
Message-ID: <bf676aa6071336e1f6f000084a51c3d1@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=559 
====================================================================== 
Reported By:                swolfgarten
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   559
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-23-2005 14:50 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    Re-Open, nightly build of November 23rd still leads
to "Your architecture doesn't seem to provide mmap()"
Description: 
Hi,

this kinda becomes my nightly task :-) I have again downloaded, extracted
and configured the latest (November 23rd) snapshot of buildroot and I am
still trying to build it (with syslinux and dhcp client support on a
Gentoo box with kernel 2.6.14). However as I have reported a couple of
days ago (it was fixed then but it is not back into the archive) I keep on
getting those error messages:

make
make -C /home/test/buildroot/buildroot/toolchain_build_i686/uClibc \
PREFIX= \
DEVEL_PREFIX=/ \
RUNTIME_PREFIX=/ \
HOSTCC="gcc" \
        all
make[1]: Entering directory
`/home/test/buildroot/buildroot/toolchain_build_i686/uClibc'
cd ./; make lib/ld-uClibc.so
make[2]: Entering directory
`/home/test/buildroot/buildroot/toolchain_build_i686/uClibc'
  CC ldso/ldso/ldso.os
In file included from ./ldso/include/ldso.h:34,
                 from ldso/ldso/ldso.c:33:
./ldso/include/dl-syscall.h: In function `_dl_exit':
./ldso/include/dl-syscall.h:69: error: `__NR_exit' undeclared (first use
in this function)
./ldso/include/dl-syscall.h:69: error: (Each undeclared identifier is
reported only once
./ldso/include/dl-syscall.h:69: error: for each function it appears in.)
./ldso/include/dl-syscall.h: In function `_dl_close':
./ldso/include/dl-syscall.h:72: error: `__NR_close' undeclared (first use
in this function)
./ldso/include/dl-syscall.h: In function `_dl_open':
./ldso/include/dl-syscall.h:75: error: `__NR_open' undeclared (first use
in this function)
./ldso/include/dl-syscall.h: In function `_dl_write':
./ldso/include/dl-syscall.h:78: error: `__NR_write' undeclared (first use
in this function)
./ldso/include/dl-syscall.h: In function `_dl_read':
./ldso/include/dl-syscall.h:82: error: `__NR_read' undeclared (first use
in this function)
./ldso/include/dl-syscall.h: In function `_dl_mprotect':
./ldso/include/dl-syscall.h:86: error: `__NR_mprotect' undeclared (first
use in this function)
./ldso/include/dl-syscall.h: In function `_dl_stat':
./ldso/include/dl-syscall.h:89: error: `__NR_stat' undeclared (first use
in this function)
./ldso/include/dl-syscall.h: In function `_dl_fstat':
./ldso/include/dl-syscall.h:92: error: `__NR_fstat' undeclared (first use
in this function)
./ldso/include/dl-syscall.h: In function `_dl_munmap':
./ldso/include/dl-syscall.h:95: error: `__NR_munmap' undeclared (first use
in this function)
./ldso/include/dl-syscall.h: In function `_dl_getuid':
./ldso/include/dl-syscall.h:98: error: `__NR_getuid' undeclared (first use
in this function)
./ldso/include/dl-syscall.h: In function `_dl_geteuid':
./ldso/include/dl-syscall.h:101: error: `__NR_geteuid' undeclared (first
use in this function)
./ldso/include/dl-syscall.h: In function `_dl_getgid':
./ldso/include/dl-syscall.h:104: error: `__NR_getgid' undeclared (first
use in this function)
./ldso/include/dl-syscall.h: In function `_dl_getegid':
./ldso/include/dl-syscall.h:107: error: `__NR_getegid' undeclared (first
use in this function)
./ldso/include/dl-syscall.h: In function `_dl_getpid':
./ldso/include/dl-syscall.h:110: error: `__NR_getpid' undeclared (first
use in this function)
./ldso/include/dl-syscall.h: In function `_dl_readlink':
./ldso/include/dl-syscall.h:113: error: `__NR_readlink' undeclared (first
use in this function)
In file included from ./ldso/include/ldso.h:34,
                 from ldso/ldso/ldso.c:33:
./ldso/include/dl-syscall.h:159:2: #error "Your architecture doesn't seem
to provide mmap() !?"
ldso/ldso/ldso.c: In function `_dl_malloc':
ldso/ldso/ldso.c:857: warning: implicit declaration of function
`_dl_mmap'
ldso/ldso/ldso.c:858: warning: assignment makes pointer from integer
without a cast
In file included from ldso/ldso/ldso.c:876:
ldso/ldso/dl-elf.c: In function `_dl_load_elf_shared_library':
ldso/ldso/dl-elf.c:372: warning: assignment makes pointer from integer
without a cast
ldso/ldso/dl-elf.c: In function `_dl_dprintf':
ldso/ldso/dl-elf.c:702: warning: assignment makes pointer from integer
without a cast
make[2]: *** [ldso/ldso/ldso.os] Error 1
make[2]: Leaving directory
`/home/test/buildroot/buildroot/toolchain_build_i686/uClibc'
make[1]: *** [lib/ld-uClibc.so.0] Error 2
make[1]: Leaving directory
`/home/test/buildroot/buildroot/toolchain_build_i686/uClibc'
make: ***
[/home/test/buildroot/buildroot/toolchain_build_i686/uClibc/lib/libc.a]
Error 2

How can I fix this?

Thanks a million!

Bye,
Seb

====================================================================== 

---------------------------------------------------------------------- 
 vapier - 11-23-05 23:22  
---------------------------------------------------------------------- 
fixed again 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-23-05 14:50  swolfgarten    New Issue                                    
11-23-05 14:50  swolfgarten    Status                   new => assigned     
11-23-05 14:50  swolfgarten    Assigned To               => uClibc          
11-23-05 23:22  vapier         Note Added: 0000693                          
11-23-05 23:22  vapier         Status                   assigned => closed  
11-23-05 23:22  vapier         Resolution               open => fixed       
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================

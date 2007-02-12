From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:52 -0800
Subject: [Buildroot] [buildroot 0000554]: uClibc doesnt rebuild headers
Message-ID: <2e1fc20f2edcba940cefaa456ac6cbbb@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=554 
====================================================================== 
Reported By:                swolfgarten
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   554
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-21-2005 17:00 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    uClibc doesnt rebuild headers
Description: 
Hi,

I am trying to compile buildroot on a Gentoo box and I therefore I have
downloaded, extracted and configured (basically busybox, dhcp client
support and optimized for syslinux) and the latest snapshot of buildroot.
It compiles alright, however after a couple of minutes I get the following
error messages:

$ make
mkdir -p /home/test/test/buildroot/dl
wget --passive-ftp -P /home/test/test/buildroot/dl
http://ep09.pld-linux.org/~mmazur/linux-libc-headers//linux-libc-headers-2.6.12.0.tar.bz2
--00:57:14-- 
http://ep09.pld-linux.org/~mmazur/linux-libc-headers//linux-libc-headers-2.6.12.0.tar.bz2
           =>
`/home/test/test/buildroot/dl/linux-libc-headers-2.6.12.0.tar.bz2'
Length: 2,539,721 (2.4M) [application/x-bzip2]

100%[=====================================================================>]
2,539,721    292.71K/s    ETA 00:00

00:57:21 (481.92 KB/s) -
`/home/test/test/buildroot/dl/linux-libc-headers-2.6.12.0.tar.bz2' saved
[2539721/2539721]

make -C /home/test/test/buildroot/toolchain_build_i686/uClibc \
PREFIX= \
DEVEL_PREFIX=/ \
RUNTIME_PREFIX=/ \
HOSTCC="gcc" \
        all
make[1]: Entering directory
`/home/test/test/buildroot/toolchain_build_i686/uClibc'
  CC ldso/ldso/ldso.os
In file included from ./ldso/include/ldso.h:27,
                 from ldso/ldso/ldso.c:33:
./ldso/include/dl-syscall.h: In function `_dl_exit':
./ldso/include/dl-syscall.h:62: error: `__NR_exit' undeclared (first use
in this function)
./ldso/include/dl-syscall.h:62: error: (Each undeclared identifier is
reported only once
./ldso/include/dl-syscall.h:62: error: for each function it appears in.)
./ldso/include/dl-syscall.h: In function `_dl_close':
./ldso/include/dl-syscall.h:65: error: `__NR_close' undeclared (first use
in this function)
./ldso/include/dl-syscall.h: In function `_dl_open':
./ldso/include/dl-syscall.h:68: error: `__NR_open' undeclared (first use
in this function)
./ldso/include/dl-syscall.h: In function `_dl_write':
./ldso/include/dl-syscall.h:71: error: `__NR_write' undeclared (first use
in this function)
./ldso/include/dl-syscall.h: In function `_dl_read':
./ldso/include/dl-syscall.h:75: error: `__NR_read' undeclared (first use
in this function)
./ldso/include/dl-syscall.h: In function `_dl_mprotect':
./ldso/include/dl-syscall.h:79: error: `__NR_mprotect' undeclared (first
use in this function)
./ldso/include/dl-syscall.h: In function `_dl_stat':
./ldso/include/dl-syscall.h:82: error: `__NR_stat' undeclared (first use
in this function)
./ldso/include/dl-syscall.h: In function `_dl_fstat':
./ldso/include/dl-syscall.h:85: error: `__NR_fstat' undeclared (first use
in this function)
./ldso/include/dl-syscall.h: In function `_dl_munmap':
./ldso/include/dl-syscall.h:88: error: `__NR_munmap' undeclared (first use
in this function)
./ldso/include/dl-syscall.h: In function `_dl_getuid':
./ldso/include/dl-syscall.h:91: error: `__NR_getuid' undeclared (first use
in this function)
./ldso/include/dl-syscall.h: In function `_dl_geteuid':
./ldso/include/dl-syscall.h:94: error: `__NR_geteuid' undeclared (first
use in this function)
./ldso/include/dl-syscall.h: In function `_dl_getgid':
./ldso/include/dl-syscall.h:97: error: `__NR_getgid' undeclared (first use
in this function)
./ldso/include/dl-syscall.h: In function `_dl_getegid':
./ldso/include/dl-syscall.h:100: error: `__NR_getegid' undeclared (first
use in this function)
./ldso/include/dl-syscall.h: In function `_dl_getpid':
./ldso/include/dl-syscall.h:103: error: `__NR_getpid' undeclared (first
use in this function)
./ldso/include/dl-syscall.h: In function `_dl_readlink':
./ldso/include/dl-syscall.h:106: error: `__NR_readlink' undeclared (first
use in this function)
In file included from ./ldso/include/ldso.h:27,
                 from ldso/ldso/ldso.c:33:
./ldso/include/dl-syscall.h:152:2: #error "Your architecture doesn't seem
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
make[1]: *** [ldso/ldso/ldso.os] Error 1
make[1]: Leaving directory
`/home/test/test/buildroot/toolchain_build_i686/uClibc'
make: ***
[/home/test/test/buildroot/toolchain_build_i686/uClibc/lib/libc.a] Error
2

Any ideas what might cause this? Any input is greatly appreciated.
Thanks a lot.

Best regards,
Sebastian

====================================================================== 

---------------------------------------------------------------------- 
 vapier - 11-21-05 17:13  
---------------------------------------------------------------------- 
there is no point at all in setting the status to Private, so dont do it

this is a bug in current uClibc svn which should be fixed in next snapshot 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-21-05 17:00  swolfgarten    New Issue                                    
11-21-05 17:00  swolfgarten    Status                   new => assigned     
11-21-05 17:00  swolfgarten    Assigned To               => uClibc          
11-21-05 17:13  vapier         Note Added: 0000686                          
11-21-05 17:13  vapier         Status                   assigned => closed  
11-21-05 17:13  vapier         Resolution               open => fixed       
11-21-05 17:13  vapier         Summary                  Unable to make buildroot
due to the error message "Your architecture doesn't seem to provide mmap() !?"
=> uClibc doesnt rebuild headers
11-21-05 17:13  vapier         Status                   closed => feedback  
11-21-05 17:13  vapier         Resolution               fixed => reopened   
11-21-05 17:14  vapier         Status                   feedback => closed  
11-21-05 17:14  vapier         Resolution               reopened => fixed   
11-21-05 17:14  vapier         View Status              private => public   
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================

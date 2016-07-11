From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 11 Jul 2016 06:34:53 +0200
Subject: [Buildroot] [uclibc-ng-devel] PPC e5500 build error:
 conflicting types for elf_vrreg_t
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C6EE832789@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C6EE832789@ex-mb1.corp.adtran.com>
Message-ID: <20160711043453.GA28468@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andy,
ANDY KENNEDY wrote,

> When building using BuildRoot, I get the below errors.

https://en.wikipedia.org/wiki/PowerPC_e5500

It is a PPC64 CPU core. PPC64 is not supported in uClibc-ng, only
PowerPC.

Not sure why it is listed in Buildroot as choice for PowerPC?

best regards
 Waldemar
 
> I have not dived into determine what the problem is yet,
> but was asking first in case anyone else has experienced
> this problem.
> 
> Thanks,
> Andy
> 
>   MKDIR lib
>   CC libm/acosf.os
>   CC libm/acoshf.os
> In file included from ./libpthread/nptl/../nptl_db/thread_db.h:28:0,
>                  from ./libpthread/nptl/descr.h:31,
>                  from ./libpthread/nptl/pthreadP.h:26,
>                  from <stdin>:2:
> ./include/sys/procfs.h:55:34: error: conflicting types for 'elf_vrreg_t'
>  } __attribute__ ((aligned (16))) elf_vrreg_t;
>                                   ^
> In file included from ./libpthread/nptl/../nptl_db/thread_db.h:28:0,
>                  from ./libpthread/nptl/descr.h:31,
>                  from ./libpthread/nptl/pthreadP.h:26,
>                  from <stdin>:1:
> ./include/sys/procfs.h:55:34: error: conflicting types for 'elf_vrreg_t'
>  } __attribute__ ((aligned (16))) elf_vrreg_t;
>                                   ^
> In file included from /home/akennedy/base_layer/build/rfs/t1010/buildroot-2016.02/output/build/linux-headers-3.12.55/usr/include/asm/sigcontext.h:13:0,
>                  from ./include/bits/sigcontext.h:30,
>                  from ./include/signal.h:420,
>                  from ./include/sys/procfs.h:26,
>                  from ./libpthread/nptl/../nptl_db/thread_db.h:28,
>                  from ./libpthread/nptl/descr.h:31,
>                  from ./libpthread/nptl/pthreadP.h:26,
>                  from <stdin>:2:
> /home/akennedy/base_layer/build/rfs/t1010/buildroot-2016.02/output/build/linux-headers-3.12.55/usr/include/asm/elf.h:153:21: note: previous declaration of 'elf_vrreg_t' was here
>  typedef __vector128 elf_vrreg_t;
>                      ^
> In file included from /home/akennedy/base_layer/build/rfs/t1010/buildroot-2016.02/output/build/linux-headers-3.12.55/usr/include/asm/sigcontext.h:13:0,
>                  from ./include/bits/sigcontext.h:30,
>                  from ./include/signal.h:420,
>                  from ./include/sys/procfs.h:26,
>                  from ./libpthread/nptl/../nptl_db/thread_db.h:28,
>                  from ./libpthread/nptl/descr.h:31,
>                  from ./libpthread/nptl/pthreadP.h:26,
>                  from <stdin>:1:
> /home/akennedy/base_layer/build/rfs/t1010/buildroot-2016.02/output/build/linux-headers-3.12.55/usr/include/asm/elf.h:153:21: note: previous declaration of 'elf_vrreg_t' was here
>  typedef __vector128 elf_vrreg_t;
>                      ^
> In file included from ./libpthread/nptl/../nptl_db/thread_db.h:28:0,
>                  from ./libpthread/nptl/descr.h:31,
>                  from ./libpthread/nptl/pthreadP.h:26,
>                  from <stdin>:2:
> ./include/sys/procfs.h:56:21: error: conflicting types for 'elf_vrregset_t'
>  typedef elf_vrreg_t elf_vrregset_t[ELF_NVRREG];
>                      ^
> In file included from ./libpthread/nptl/../nptl_db/thread_db.h:28:0,
>                  from ./libpthread/nptl/descr.h:31,
>                  from ./libpthread/nptl/pthreadP.h:26,
>                  from <stdin>:1:
> ./include/sys/procfs.h:56:21: error: conflicting types for 'elf_vrregset_t'
>  typedef elf_vrreg_t elf_vrregset_t[ELF_NVRREG];
>                      ^
> In file included from /home/akennedy/base_layer/build/rfs/t1010/buildroot-2016.02/output/build/linux-headers-3.12.55/usr/include/asm/sigcontext.h:13:0,
>                  from ./include/bits/sigcontext.h:30,
>                  from ./include/signal.h:420,
>                  from ./include/sys/procfs.h:26,
>                  from ./libpthread/nptl/../nptl_db/thread_db.h:28,
>                  from ./libpthread/nptl/descr.h:31,
>                  from ./libpthread/nptl/pthreadP.h:26,
>                  from <stdin>:2:
> /home/akennedy/base_layer/build/rfs/t1010/buildroot-2016.02/output/build/linux-headers-3.12.55/usr/include/asm/elf.h:154:21: note: previous declaration of 'elf_vrregset_t' was here
>  typedef elf_vrreg_t elf_vrregset_t[ELF_NVRREG];
>                      ^
> In file included from /home/akennedy/base_layer/build/rfs/t1010/buildroot-2016.02/output/build/linux-headers-3.12.55/usr/include/asm/sigcontext.h:13:0,
>                  from ./include/bits/sigcontext.h:30,
>                  from ./include/signal.h:420,
>                  from ./include/sys/procfs.h:26,
>                  from ./libpthread/nptl/../nptl_db/thread_db.h:28,
>                  from ./libpthread/nptl/descr.h:31,
>                  from ./libpthread/nptl/pthreadP.h:26,
>                  from <stdin>:1:
> /home/akennedy/base_layer/build/rfs/t1010/buildroot-2016.02/output/build/linux-headers-3.12.55/usr/include/asm/elf.h:154:21: note: previous declaration of 'elf_vrregset_t' was here
>  typedef elf_vrreg_t elf_vrregset_t[ELF_NVRREG];
>                      ^
> In file included from ./libpthread/nptl/sysdeps/powerpc/../../../nptl_db/thread_db.h:28:0,
>                  from ./libpthread/nptl/sysdeps/powerpc/../../descr.h:31,
>                  from ./libpthread/nptl/sysdeps/powerpc/tls.h:70,
>                  from ./include/tls.h:6,
>                  from ./include/bits/libc-lock.h:36,
>                  from ./include/bits/stdio-lock.h:22,
>                  from ./include/bits/uClibc_mutex.h:73,
>                  from ./include/bits/uClibc_stdio.h:83,
>                  from ./include/stdio.h:71,
>                  from <stdin>:2:
> ./include/sys/procfs.h:55:34: error: conflicting types for 'elf_vrreg_t'
>  } __attribute__ ((aligned (16))) elf_vrreg_t;
>                                   ^
> In file included from /home/akennedy/base_layer/build/rfs/t1010/buildroot-2016.02/output/build/linux-headers-3.12.55/usr/include/asm/sigcontext.h:13:0,
>                  from ./include/bits/sigcontext.h:30,
>                  from ./include/signal.h:420,
>                  from ./include/sys/procfs.h:26,
>                  from ./libpthread/nptl/sysdeps/powerpc/../../../nptl_db/thread_db.h:28,
>                  from ./libpthread/nptl/sysdeps/powerpc/../../descr.h:31,
>                  from ./libpthread/nptl/sysdeps/powerpc/tls.h:70,
>                  from ./include/tls.h:6,
>                  from ./include/bits/libc-lock.h:36,
>                  from ./include/bits/stdio-lock.h:22,
>                  from ./include/bits/uClibc_mutex.h:73,
>                  from ./include/bits/uClibc_stdio.h:83,
>                  from ./include/stdio.h:71,
>                  from <stdin>:2:
> /home/akennedy/base_layer/build/rfs/t1010/buildroot-2016.02/output/build/linux-headers-3.12.55/usr/include/asm/elf.h:153:21: note: previous declaration of 'elf_vrreg_t' was here
>  typedef __vector128 elf_vrreg_t;
>                      ^
> In file included from ./libpthread/nptl/sysdeps/powerpc/../../../nptl_db/thread_db.h:28:0,
>                  from ./libpthread/nptl/sysdeps/powerpc/../../descr.h:31,
>                  from ./libpthread/nptl/sysdeps/powerpc/tls.h:70,
>                  from ./include/tls.h:6,
>                  from ./include/bits/libc-lock.h:36,
>                  from ./include/bits/stdio-lock.h:22,
>                  from ./include/bits/uClibc_mutex.h:73,
>                  from ./include/bits/uClibc_stdio.h:83,
>                  from ./include/stdio.h:71,
>                  from <stdin>:2:
> ./include/sys/procfs.h:56:21: error: conflicting types for 'elf_vrregset_t'
>  typedef elf_vrreg_t elf_vrregset_t[ELF_NVRREG];
>                      ^
> In file included from /home/akennedy/base_layer/build/rfs/t1010/buildroot-2016.02/output/build/linux-headers-3.12.55/usr/include/asm/sigcontext.h:13:0,
>                  from ./include/bits/sigcontext.h:30,
>                  from ./include/signal.h:420,
>                  from ./include/sys/procfs.h:26,
>                  from ./libpthread/nptl/sysdeps/powerpc/../../../nptl_db/thread_db.h:28,
>                  from ./libpthread/nptl/sysdeps/powerpc/../../descr.h:31,
>                  from ./libpthread/nptl/sysdeps/powerpc/tls.h:70,
>                  from ./include/tls.h:6,
>                  from ./include/bits/libc-lock.h:36,
>                  from ./include/bits/stdio-lock.h:22,
>                  from ./include/bits/uClibc_mutex.h:73,
>                  from ./include/bits/uClibc_stdio.h:83,
>                  from ./include/stdio.h:71,
>                  from <stdin>:2:
> /home/akennedy/base_layer/build/rfs/t1010/buildroot-2016.02/output/build/linux-headers-3.12.55/usr/include/asm/elf.h:154:21: note: previous declaration of 'elf_vrregset_t' was here
>  typedef elf_vrreg_t elf_vrregset_t[ELF_NVRREG];
>                      ^
>   CC libm/asinf.os
>   CC libm/asinhf.os
>   CC libm/atan2f.os
> make[1]: *** [libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrobustlock.h] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make[1]: *** [libpthread/nptl/sysdeps/unix/sysv/linux/pthread-pi-defines.h] Error 1
> make[1]: *** [libpthread/nptl/sysdeps/unix/sysv/linux/lowlevelrwlock.h] Error 1
> In file included from ./libpthread/nptl/sysdeps/powerpc/../../../nptl_db/thread_db.h:28:0,
>                  from ./libpthread/nptl/sysdeps/powerpc/../../descr.h:31,
>                  from ./libpthread/nptl/sysdeps/powerpc/tls.h:70,
>                  from ./include/tls.h:6,
>                  from <stdin>:2:
> ./include/sys/procfs.h:55:34: error: conflicting types for 'elf_vrreg_t'
>  } __attribute__ ((aligned (16))) elf_vrreg_t;
>                                   ^
> In file included from /home/akennedy/base_layer/build/rfs/t1010/buildroot-2016.02/output/build/linux-headers-3.12.55/usr/include/asm/sigcontext.h:13:0,
>                  from ./include/bits/sigcontext.h:30,
>                  from ./include/signal.h:420,
>                  from ./include/sys/procfs.h:26,
>                  from ./libpthread/nptl/sysdeps/powerpc/../../../nptl_db/thread_db.h:28,
>                  from ./libpthread/nptl/sysdeps/powerpc/../../descr.h:31,
>                  from ./libpthread/nptl/sysdeps/powerpc/tls.h:70,
>                  from ./include/tls.h:6,
>                  from <stdin>:2:
> /home/akennedy/base_layer/build/rfs/t1010/buildroot-2016.02/output/build/linux-headers-3.12.55/usr/include/asm/elf.h:153:21: note: previous declaration of 'elf_vrreg_t' was here
>  typedef __vector128 elf_vrreg_t;
>                      ^
> In file included from ./libpthread/nptl/sysdeps/powerpc/../../../nptl_db/thread_db.h:28:0,
>                  from ./libpthread/nptl/sysdeps/powerpc/../../descr.h:31,
>                  from ./libpthread/nptl/sysdeps/powerpc/tls.h:70,
>                  from ./include/tls.h:6,
>                  from <stdin>:2:
> ./include/sys/procfs.h:56:21: error: conflicting types for 'elf_vrregset_t'
>  typedef elf_vrreg_t elf_vrregset_t[ELF_NVRREG];
>                      ^
> In file included from /home/akennedy/base_layer/build/rfs/t1010/buildroot-2016.02/output/build/linux-headers-3.12.55/usr/include/asm/sigcontext.h:13:0,
>                  from ./include/bits/sigcontext.h:30,
>                  from ./include/signal.h:420,
>                  from ./include/sys/procfs.h:26,
>                  from ./libpthread/nptl/sysdeps/powerpc/../../../nptl_db/thread_db.h:28,
>                  from ./libpthread/nptl/sysdeps/powerpc/../../descr.h:31,
>                  from ./libpthread/nptl/sysdeps/powerpc/tls.h:70,
>                  from ./include/tls.h:6,
>                  from <stdin>:2:
> /home/akennedy/base_layer/build/rfs/t1010/buildroot-2016.02/output/build/linux-headers-3.12.55/usr/include/asm/elf.h:154:21: note: previous declaration of 'elf_vrregset_t' was here
>  typedef elf_vrreg_t elf_vrregset_t[ELF_NVRREG];
>                      ^
> make[1]: *** [libpthread/nptl/sysdeps/powerpc/tcb-offsets.h] Error 1
> make[1]: Leaving directory `/home/akennedy/base_layer/build/rfs/t1010/buildroot-2016.02/output/build/uclibc-1.0.12'
> make: *** [/home/akennedy/base_layer/build/rfs/t1010/buildroot-2016.02/output/build/uclibc-1.0.12/.stamp_built] Error 2
> 
> _______________________________________________
> devel mailing list
> devel at uclibc-ng.org
> http://mailman.uclibc-ng.org/cgi-bin/mailman/listinfo/devel

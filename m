From: Chris Kerios <ckerios@gmail.com>
Date: Tue, 3 Aug 2010 20:05:07 -0400
Subject: [Buildroot] atngw100_defconfig does not build on 2010.08-rc1
	4.2.2-avr32-2.1.5 gcc toolchain
Message-ID: <AANLkTik8jzgsdxp3fsmBvx5BRe8w5_eUKTQx4dvCtd_h@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I was building the atngw100_defconfig with all the default answers and
ran into the following...
Regards,
Chris


/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5-initial/./gcc/xgcc
-B/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5-initial/./gcc/
-B/home/chris/buildroot-2010.08-rc1/output/staging/usr/avr32-unknown-linux-uclibc/bin/
-B/home/chris/buildroot-2010.08-rc1/output/staging/usr/avr32-unknown-linux-uclibc/lib/
-isystem /home/chris/buildroot-2010.08-rc1/output/staging/usr/avr32-unknown-linux-uclibc/include
-isystem /home/chris/buildroot-2010.08-rc1/output/staging/usr/avr32-unknown-linux-uclibc/sys-include
-O2  -g -Os -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition
-isystem ./include  -fPIC -mrelax -g -DHAVE_GTHR_DEFAULT -DIN_LIBGCC2
-D__GCC_FLOAT_NOT_NEEDED -Dinhibit_libc -I. -I.
-I/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc
-I/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/.
-I/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/../include
-I/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/../libcpp/include
-I/home/chris/buildroot-2010.08-rc1/output/toolchain/gmp/include
-I/home/chris/buildroot-2010.08-rc1/output/toolchain/mpfr/include
-I/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/../libdecnumber
-I../libdecnumber  -fexceptions -c
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/unwind-dw2-fde-glibc.c
-o libgcc/./unwind-dw2-fde-glibc.o
In file included from ./gthr-default.h:1,
                 from
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr.h:114,
                 from
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/unwind-dw2.c:42:
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:43:21:
error: pthread.h: No such file or directory
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:44:20:
error: unistd.h: No such file or directory
In file included from ./gthr-default.h:1,
                 from
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr.h:114,
                 from
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/unwind-dw2.c:42:
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:46:
error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before
?__gthread_key_t?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:47:
error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before
?__gthread_once_t?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:48:
error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before
?__gthread_mutex_t?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:49:
error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before
?__gthread_recursive_mutex_t?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:92:
error: ?pthread_once? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:92:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_once?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:93:
error: ?pthread_getspecific? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:93:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_getspecific?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:94:
error: ?pthread_setspecific? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:94:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_setspecific?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:95:
error: ?pthread_create? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:95:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_create?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:96:
error: ?pthread_cancel? undeclared here (not in a function)
In file included from ./gthr-default.h:1,
                 from
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr.h:114,
                 from
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/unwind-dw2-fde-glibc.c:49:
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:43:21:
error: pthread.h: No such file or directory
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:44:20:
error: unistd.h: No such file or directory
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:96:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_cancel?
In file included from ./gthr-default.h:1,
                 from
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr.h:114,
                 from
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/unwind-dw2-fde-glibc.c:49:
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:46:
error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before
?__gthread_key_t?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:47:
error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before
?__gthread_once_t?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:48:
error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before
?__gthread_mutex_t?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:49:
error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before
?__gthread_recursive_mutex_t?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:97:
error: ?pthread_mutex_lock? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:97:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_mutex_lock?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:98:
error: ?pthread_mutex_trylock? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:98:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_mutex_trylock?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:92:
error: ?pthread_once? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:99:
error: ?pthread_mutex_unlock? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:99:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_mutex_unlock?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:92:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_once?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:100:
error: ?pthread_mutex_init? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:100:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_mutex_init?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:93:
error: ?pthread_getspecific? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:103:
error: ?pthread_key_create? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:103:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_key_create?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:93:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_getspecific?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:104:
error: ?pthread_key_delete? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:94:
error: ?pthread_setspecific? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:104:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_key_delete?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:94:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_setspecific?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:105:
error: ?pthread_mutexattr_init? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:95:
error: ?pthread_create? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:105:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_mutexattr_init?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:95:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_create?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:106:
error: ?pthread_mutexattr_settype? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:96:
error: ?pthread_cancel? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:106:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_mutexattr_settype?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:96:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_cancel?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:107:
error: ?pthread_mutexattr_destroy? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:97:
error: ?pthread_mutex_lock? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:97:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_mutex_lock?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:98:
error: ?pthread_mutex_trylock? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:107:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_mutexattr_destroy?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:572:
error: expected ?)? before ?*? token
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:581:
error: expected ?)? before ?*? token
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:587:
error: expected ?)? before ?key?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:593:
error: expected ?)? before ?key?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:599:
error: expected ?)? before ?key?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:605:
error: expected ?)? before ?*? token
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:614:
error: expected ?)? before ?*? token
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:623:
error: expected ?)? before ?*? token
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:98:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_mutex_trylock?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:633:
error: expected ?)? before ?*? token
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:99:
error: ?pthread_mutex_unlock? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:654:
error: expected ?)? before ?*? token
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:660:
error: expected ?)? before ?*? token
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:99:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_mutex_unlock?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:666:
error: expected ?)? before ?*? token
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:100:
error: ?pthread_mutex_init? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:100:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_mutex_init?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:103:
error: ?pthread_key_create? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:103:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_key_create?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:104:
error: ?pthread_key_delete? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:104:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_key_delete?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:105:
error: ?pthread_mutexattr_init? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:105:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_mutexattr_init?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:106:
error: ?pthread_mutexattr_settype? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:106:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_mutexattr_settype?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:107:
error: ?pthread_mutexattr_destroy? undeclared here (not in a function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:107:
warning: type defaults to ?int? in declaration of
?__gthrw_pthread_mutexattr_destroy?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:572:
error: expected ?)? before ?*? token
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:581:
error: expected ?)? before ?*? token
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:587:
error: expected ?)? before ?key?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:593:
error: expected ?)? before ?key?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:599:
error: expected ?)? before ?key?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:605:
error: expected ?)? before ?*? token
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:614:
error: expected ?)? before ?*? token
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:623:
error: expected ?)? before ?*? token
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:633:
error: expected ?)? before ?*? token
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:654:
error: expected ?)? before ?*? token
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:660:
error: expected ?)? before ?*? token
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/gthr-posix.h:666:
error: expected ?)? before ?*? token
make[3]: *** [libgcc/./unwind-dw2.o] Error 1
make[3]: *** Waiting for unfinished jobs....
In file included from
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/unwind-dw2-fde-glibc.c:435:
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/unwind-dw2-fde.c:53:
error: expected ?=?, ?,?, ?;?, ?asm? or ?__attribute__? before
?object_mutex?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/unwind-dw2-fde.c:
In function ?__register_frame_info_bases?:
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/unwind-dw2-fde.c:96:
warning: implicit declaration of function ?__gthread_mutex_lock?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/unwind-dw2-fde.c:96:
error: ?object_mutex? undeclared (first use in this function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/unwind-dw2-fde.c:96:
error: (Each undeclared identifier is reported only once
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/unwind-dw2-fde.c:96:
error: for each function it appears in.)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/unwind-dw2-fde.c:101:
warning: implicit declaration of function ?__gthread_mutex_unlock?
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/unwind-dw2-fde.c:
In function ?__register_frame_info_table_bases?:
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/unwind-dw2-fde.c:140:
error: ?object_mutex? undeclared (first use in this function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/unwind-dw2-fde.c:
In function ?__deregister_frame_info_bases?:
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/unwind-dw2-fde.c:184:
error: ?object_mutex? undeclared (first use in this function)
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/unwind-dw2-fde.c:
In function ?_Unwind_Find_FDE?:
/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5/gcc/unwind-dw2-fde.c:977:
error: ?object_mutex? undeclared (first use in this function)
make[3]: *** [libgcc/./unwind-dw2-fde-glibc.o] Error 1
make[3]: Leaving directory
`/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5-initial/gcc'
make[2]: *** [stmp-multilib] Error 2
rm gcc.pod
make[2]: Leaving directory
`/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5-initial/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory
`/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5-initial'
make: *** [/home/chris/buildroot-2010.08-rc1/output/toolchain/gcc-4.2.2-avr32-2.1.5-initial/.compiled]
Error 2

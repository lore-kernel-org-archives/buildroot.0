From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 25 Feb 2020 10:44:20 +0000
Subject: [Buildroot] [Bug 12581] 2020.02-rc1 glibc failing to build on
 fedora 31
In-Reply-To: <bug-12581-163@https.bugs.busybox.net/>
References: <bug-12581-163@https.bugs.busybox.net/>
Message-ID: <bug-12581-163-jt0Q1rQuGT@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12581

--- Comment #2 from Dr I J Ormshaw <ian_ormshaw@waters.com> ---
Error is:

/home/ian/build/hiwire-linux-030c5e86-x86_64/buildroot/host/bin/x86_64-WatersAMST-linux-gnu-gcc
tzfile.c -c -std=gnu11 -fgnu89-inline  -O2 -Wall -Wwrite-strings -Wundef
-Werror -fmerge-all-constants -frounding-math -fno-stack-protector
-Wstrict-prototypes -Wold-style-definition -fmath-errno   -fPIC
-DTZDIR='"/usr/share/zoneinfo"' -DTZDEFAULT='"/etc/localtime"'
-DTZDEFRULES='"posixrules"'  -ftls-model=initial-exec      -I../include
-I/home/ian/build/hiwire-linux-030c5e86-x86_64/buildroot/build/glibc-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/build/time

-I/home/ian/build/hiwire-linux-030c5e86-x86_64/buildroot/build/glibc-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/build
 -I../sysdeps/unix/sysv/linux/x86_64/64  -I../sysdeps/unix/sysv/linux/x86_64 
-I../sysdeps/unix/sysv/linux/x86/include -I../sysdeps/unix/sysv/linux/x86 
-I../sysdeps/x86/nptl  -I../sysdeps/unix/sysv/linux/wordsize-64 
-I../sysdeps/x86_64/nptl  -I../sysdeps/unix/sysv/linux/include
-I../sysdeps/unix/sysv/linux  -I../sysdeps/nptl  -I../sysdeps/pthread 
-I../sysdeps/gnu  -I../sysdeps/unix/inet  -I../sysdeps/unix/sysv 
-I../sysdeps/unix/x86_64  -I../sysdeps/unix  -I../sysdeps/posix 
-I../sysdeps/x86_64/64  -I../sysdeps/x86_64/fpu  -I../sysdeps/x86/fpu/include
-I../sysdeps/x86/fpu  -I../sysdeps/x86_64  -I../sysdeps/x86 
-I../sysdeps/ieee754/float128  -I../sysdeps/ieee754/ldbl-96/include
-I../sysdeps/ieee754/ldbl-96  -I../sysdeps/ieee754/dbl-64/wordsize-64 
-I../sysdeps/ieee754/dbl-64  -I../sysdeps/ieee754/flt-32 
-I../sysdeps/wordsize-64  -I../sysdeps/ieee754  -I../sysdeps/generic  -I..
-I../libio -I. -nostdinc -isystem
/home/ian/build/hiwire-linux-030c5e86-x86_64/buildroot/host/lib/gcc/x86_64-WatersAMST-linux-gnu/9.2.0/include
-isystem
/home/ian/build/hiwire-linux-030c5e86-x86_64/buildroot/host/lib/gcc/x86_64-WatersAMST-linux-gnu/9.2.0/include-fixed
-isystem
/home/ian/build/hiwire-linux-030c5e86-x86_64/buildroot/host/x86_64-WatersAMST-linux-gnu/sysroot/usr/include
 -D_LIBC_REENTRANT -include
/home/ian/build/hiwire-linux-030c5e86-x86_64/buildroot/build/glibc-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/build/libc-modules.h
-DMODULE_NAME=libc -include ../include/libc-symbols.h  -DPIC -DSHARED    
-DTOP_NAMESPACE=glibc -o
/home/ian/build/hiwire-linux-030c5e86-x86_64/buildroot/build/glibc-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/build/time/tzfile.os
-MD -MP -MF
/home/ian/build/hiwire-linux-030c5e86-x86_64/buildroot/build/glibc-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/build/time/tzfile.os.dt
-MT
/home/ian/build/hiwire-linux-030c5e86-x86_64/buildroot/build/glibc-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/build/time/tzfile.os
echo 'time/offtime.o time/asctime.o time/clock.o time/ctime.o time/ctime_r.o
time/difftime.o time/gmtime.o time/localtime.o time/mktime.o time/time.o
time/gettimeofday.o time/settimeofday.o time/adjtime.o time/tzset.o
time/tzfile.o time/getitimer.o time/setitimer.o time/stime.o time/dysize.o
time/timegm.o time/ftime.o time/getdate.o time/strptime.o time/strptime_l.o
time/strftime.o time/wcsftime.o time/strftime_l.o time/wcsftime_l.o
time/timespec_get.o time/era.o time/alt_digit.o time/lc-time-cleanup.o
time/ntp_gettime.o time/ntp_gettimex.o' >
/home/ian/build/hiwire-linux-030c5e86-x86_64/buildroot/build/glibc-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/build/time/stamp.oT
mv -f
/home/ian/build/hiwire-linux-030c5e86-x86_64/buildroot/build/glibc-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/build/time/stamp.oT
/home/ian/build/hiwire-linux-030c5e86-x86_64/buildroot/build/glibc-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/build/time/stamp.o
In file included from <command-line>:
../sysdeps/unix/sysv/linux/x86/time.c:43:31: error: 'time' alias between
functions of incompatible types 'time_t(time_t *)' {aka 'long int(long int *)'}
and 'time_t (*(void))(time_t *)' {aka 'long int (*(void))(long int *)'}
[-Werror=attribute-alias=]
   43 | libc_ifunc_hidden (time_type, time,
      |                               ^~~~
./../include/libc-symbols.h:140:26: note: in definition of macro
'_strong_alias'
  140 |   extern __typeof (name) aliasname __attribute__ ((alias (#name))) \
      |                          ^~~~~~~~~
./../include/libc-symbols.h:937:3: note: in expansion of macro 'strong_alias'
  937 |   strong_alias (__libc_##name, name);
      |   ^~~~~~~~~~~~
./../include/libc-symbols.h:1025:3: note: in expansion of macro
'__ifunc_hidden'
 1025 |   __ifunc_hidden (redirected_name, name, expr, void, INIT_ARCH)
      |   ^~~~~~~~~~~~~~
../sysdeps/unix/sysv/linux/x86/time.c:43:1: note: in expansion of macro
'libc_ifunc_hidden'
   43 | libc_ifunc_hidden (time_type, time,
      | ^~~~~~~~~~~~~~~~~

-- 
You are receiving this mail because:
You are on the CC list for the bug.

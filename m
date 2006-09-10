From: Michael Boutte <maboutte@pacbell.net>
Date: Sun, 10 Sep 2006 09:34:47 -0700
Subject: [Buildroot] Buildroot fails on powerpc with busybox login.c
Message-ID: <45043EA7.5070709@pacbell.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Ever since approximately version 16076 the initial make of buildroot 
fails with errors in the busybox/loginutils/login.c as shown in the snip 
below.
  CC loginutils/login.o
/home/mike/projects/software/snip875/build-tools/uclibc-4/buildroot/build_powerpc/busybox/loginutils/login.c: 
In function 'login_main':
/home/mike/projects/software/snip875/build-tools/uclibc-4/buildroot/build_powerpc/busybox/loginutils/login.c:143: 
warning: implicit declaration of function 'read_or_build_utent'
/home/mike/projects/software/snip875/build-tools/uclibc-4/buildroot/build_powerpc/busybox/loginutils/login.c:145: 
error: 'utent' undeclared (first use in this function)
/home/mike/projects/software/snip875/build-tools/uclibc-4/buildroot/build_powerpc/busybox/loginutils/login.c:145: 
error: (Each undeclared identifier is reported only once
/home/mike/projects/software/snip875/build-tools/uclibc-4/buildroot/build_powerpc/busybox/loginutils/login.c:145: 
error: for each function it appears in.)
/home/mike/projects/software/snip875/build-tools/uclibc-4/buildroot/build_powerpc/busybox/loginutils/login.c:204: 
warning: implicit declaration of function 'write_utent'
make[2]: *** 
[/home/mike/projects/software/snip875/build-tools/uclibc-4/buildroot/build_powerpc/busybox/loginutils/login.o] 
Error 1
make[1]: *** [_all] Error 2
make[1]: Leaving directory 
`/home/mike/projects/software/snip875/build-tools/uclibc-4/buildroot/build_powerpc/busybox'
make: *** 
[/home/mike/projects/software/snip875/build-tools/uclibc-4/buildroot/build_powerpc/busybox/busybox] 
Error 2

Mike

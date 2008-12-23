From: =?ISO-8859-1?Q?Bernhard_G=F6del?= <bernhard.goedel@gmx.at>
Date: Tue, 23 Dec 2008 11:38:42 +0100
Subject: [Buildroot] avr32: lbipthread problem
Message-ID: <4950BFB2.7010302@gmx.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to build a toolchain based on uClibc for the AVR32. I'm using 
  buildroot-20081120 (as I had problems with binutils in newer 
snapshots). I've configured threading support to NPTL, don't know 
whether the compile error below happens also with other configurations.

I'm experiencing the following issues:

1. The file tls.h is missing.
In order to overcome a problem with the missing tls.h I created an empty 
file named tls.h in 
/buildroot/toolchain_build_avr32/uClibc-0.9.29-avr32-2.1.5/include


2. __THROW undefined in pt-machine.h
/libpthread/linuxthreads/sysdeps/avr32/pt-machine.h:16: error: expected 
',' or ';' before '{' token

Reason for that was obviously that the __THROW definition was missing in 
this file. I simply defined it as blank in the same file because I 
didn't figure out where the original definition of this preprocessor 
macro is.


3. The file sysdep-cancel.h is missing
I created an empty file in
/buildroot/toolchain_build_avr32/uClibc-0.9.29-avr32-2.1.5/libpthread/linuxthreads
to overcome this problem.


4. finally I'm stuck with this one:
configure: error: Pthreads are required to build libgomp
make[2]: *** [configure-target-libgomp] Error 1


Any suggestions are welcome :-)

Bernhard

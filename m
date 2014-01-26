From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sun, 26 Jan 2014 13:07:34 +0100
Subject: [Buildroot] full rebuild and errors:
Message-ID: <52E4FA86.7030906@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I successfully compiled buildroot for Raspberry Pi following this guide:

https://github.com/albertd/buildroot-rpi

I had a problem with some applications (btw it was: EGL Error : Could 
not create the egl surface: error = 0x300b) and I read some users were 
able to solve just rebuilding buildroot.
Thus, I issued:

make cleanall

as stated in the documentation. But this time I get the following errors:

/home/mark/dev/buildroot-rpi/output/host/usr/bin/ccache /usr/bin/gcc 
-std=gnu99   -O2 -I/home/mark/dev/buildroot-rpi/output/host/usr/include 
-L/home/mark/dev/buildroot-rpi/output/host/lib 
-L/home/mark/dev/buildroot-rpi/output/host/usr/lib 
-Wl,-rpath,/home/mark/dev/buildroot-rpi/output/host/usr/lib -o m4 m4.o 
builtin.o debug.o eval.o format.o freeze.o input.o macro.o output.o 
path.o symtab.o ../lib/libm4.a
m4.o: In function `main':
m4.c:(.text.startup+0x260): undefined reference to `version_etc'
m4.c:(.text.startup+0x3ef): undefined reference to 
`emit_bug_reporting_address'
collect2: error: ld returned 1 exit status
make[3]: *** [m4] Error 1
make[3]: Leaving directory 
`/home/mark/dev/buildroot-rpi/output/build/host-m4-1.4.16/src'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory 
`/home/mark/dev/buildroot-rpi/output/build/host-m4-1.4.16'
make[1]: *** [all] Error 2
make[1]: Leaving directory 
`/home/mark/dev/buildroot-rpi/output/build/host-m4-1.4.16'
make: *** 
[/home/mark/dev/buildroot-rpi/output/build/host-m4-1.4.16/.stamp_built] 
Error 2


Google doesn't help me on this.
Do you have any idea why this happens?

Thanks
Mark

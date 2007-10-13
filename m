From: bjornfor at stud.ntnu.no <bjornfor@stud.ntnu.no>
Date: Sat, 13 Oct 2007 15:29:56 +0200
Subject: [Buildroot] filesystem build fails
Message-ID: <20071013152956.xyx1nl8q8sk84ws4@webmail.ntnu.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to build a system on Ubuntu 7.04 host. Everything works  
great as long as filesystems are not built. I believe it has to do  
with my host, but don't know what. The "Checking build system  
dependencies:" of Buildroot says "OK". I have binutils-2.17.50 and  
gcc-4.1.2 on host. If I try to build e.g. a jffs2 filesystem, the  
following errors appear:


make[3]: Entering directory  
`/home/bjornfor/prosjekt/buildroot/toolchain_build_i386/fakeroot-1.8-host'
CONFIG_FILES= CONFIG_HEADERS= /bin/sh ./config.status
config.status: executing depfiles commands
config.status: executing libtool commands
/bin/sh ./libtool --tag=CC   --mode=link /usr/bin/gcc  -g -O2   -o  
faked faked.o libcommunicate.la -ldl
eval: 1: libtool_args+=: not found
eval: 1: compile_command+=: not found
----------[removed some repeating output]-----------
eval: 1: libtool_args+=: not found
libtool: link: /usr/bin/gcc  ./.libs/libcommunicate.a -ldl
/usr/lib/gcc/i486-linux-gnu/4.1.2/../../../../lib/crt1.o: In function  
`_start':
(.text+0x18): undefined reference to `main'
collect2: ld returned 1 exit status
make[3]: *** [faked] Error 1
make[3]: Leaving directory  
`/home/bjornfor/prosjekt/buildroot/toolchain_build_i386/fakeroot-1.8-host'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory  
`/home/bjornfor/prosjekt/buildroot/toolchain_build_i386/fakeroot-1.8-host'
make[1]: *** [all] Error 2
make[1]: Leaving directory  
`/home/bjornfor/prosjekt/buildroot/toolchain_build_i386/fakeroot-1.8-host'
make: ***  
[/home/bjornfor/prosjekt/buildroot/toolchain_build_i386/fakeroot-1.8-host/faked] Error  
2

It doesn't matter what other Buildroot options used, the filesystem  
build fails anyway. Any hints or help will be greatly appreciated.

Regards,
Bj?rn Forsman, Norway

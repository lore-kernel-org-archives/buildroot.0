From: Peter Mendham <petermendham@computing.dundee.ac.uk>
Date: Fri, 01 Dec 2006 10:09:39 +0000
Subject: [Buildroot] Build problem with buildroot config of Busybox?
Message-ID: <456FFF63.5050904@computing.dundee.ac.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I seem to have a knack for posting to the wrong list, but I think this 
is buildrot rather than BusyBox related.  Having applied Berhard's trick 
to get me past the uClibc build problems I've now hit another snag.  
Buildroot *seems* to be trying to build BusyBox for an i386 even though 
I specified PowerPC.  Is that right?  I may be misinterpreting the error 
messages (which I have included below).  I may have configured something 
incorrectly, but I thought  there was only one place to select the 
target architecture.

Any ideas as to how to approach this problem greatly appreciated.
-- Peter

make -j1 
CC=/home/pmendham/powerpc-405-linux-gnu/buildroot/build_powerpc_nofpu/staging_dir/bin/powerpc-linux-uclibc-gcc 
CROSS_COMPILE="/home/pmendham/powerpc-405-linux-gnu/buildroot/build_powerpc_nofpu/staging_dir/bin/powerpc-linux-uclibc-" 
\
                
CROSS="/home/pmendham/powerpc-405-linux-gnu/buildroot/build_powerpc_nofpu/staging_dir/bin/powerpc-linux-uclibc-" 
PREFIX="/home/pmendham/powerpc-405-linux-gnu/buildroot/build_powerpc_nofpu/root" 
\
                EXTRA_CFLAGS="-Os -pipe " -C 
/home/pmendham/powerpc-405-linux-gnu/buildroot/build_powerpc_nofpu/busybox
make[1]: Entering directory 
`/home/pmendham/powerpc-405-linux-gnu/buildroot/build_powerpc_nofpu/busybox'
  SPLIT   include/autoconf.h -> include/config/*
  GEN     include/bbconfigopts.h
  HOSTCC  applets/usage
  GEN     include/usage_compressed.h
  CC      applets/applets.o
cc1: error: invalid option `arch=i386'
cc1: error: invalid option `preferred-stack-boundary=2'
make[2]: *** [applets/applets.o] Error 1
make[1]: *** [applets] Error 2
make[1]: Leaving directory 
`/home/pmendham/powerpc-405-linux-gnu/buildroot/build_powerpc_nofpu/busybox'
make: *** 
[/home/pmendham/powerpc-405-linux-gnu/buildroot/build_powerpc_nofpu/busybox/busybox] 
Error 2
 

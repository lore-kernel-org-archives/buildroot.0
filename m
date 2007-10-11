From: Gregory Borges <gregory.borges@gmail.com>
Date: Thu, 11 Oct 2007 13:30:52 -0700
Subject: [Buildroot] fakeroot link error building for ARM
Message-ID: <800803a60710111330m4075fe24l2c6428fd9d0e3d95@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using Ubuntu 7.04, Buildroot snapshot 10/10/2007, building for ARM/Xscale
(same for ARM/generic) I get the following error (sorry if I have included
irrelevent stuff):

# Just in case
chmod a+x
/home/gborges/buildroot/project_build_arm/mstone/root/usr/share/udhcpc/default.script
chmod: cannot access
`/home/gborges/buildroot/project_build_arm/mstone/root/usr/share/udhcpc/default.script':
No such file or directory
make: [/home/gborges/buildroot/project_build_arm/mstone/root/bin/busybox]
Error 1 (ignored)
/usr/bin/make -j1 -C /home/gborges/buildroot/toolchain_build_arm/fakeroot-
1.8-host
make[1]: Entering directory
`/home/gborges/buildroot/toolchain_build_arm/fakeroot-1.8-host'
/usr/bin/make  all-recursive
make[2]: Entering directory
`/home/gborges/buildroot/toolchain_build_arm/fakeroot-1.8-host'
Making all in scripts
make[3]: Entering directory
`/home/gborges/buildroot/toolchain_build_arm/fakeroot-1.8-host/scripts'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/home/gborges/buildroot/toolchain_build_arm/fakeroot-1.8-host/scripts'
Making all in test
make[3]: Entering directory
`/home/gborges/buildroot/toolchain_build_arm/fakeroot-1.8-host/test'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/home/gborges/buildroot/toolchain_build_arm/fakeroot-1.8-host/test'
make[3]: Entering directory
`/home/gborges/buildroot/toolchain_build_arm/fakeroot-1.8-host'
CONFIG_FILES= CONFIG_HEADERS= /bin/sh ./config.status
config.status: executing depfiles commands
config.status: executing libtool commands
/bin/sh ./libtool --tag=CC   --mode=link /usr/bin/gcc  -g -O2   -o faked
faked.o libcommunicate.la -ldl
eval: 1: libtool_args+=: not found
eval: 1: compile_command+=: not found
eval: 1: finalize_command+=: not found
eval: 1: libtool_args+=: not found
eval: 1: compile_command+=: not found
eval: 1: finalize_command+=: not found
eval: 1: libtool_args+=: not found
eval: 1: compile_command+=: not found
eval: 1: finalize_command+=: not found
eval: 1: libtool_args+=: not found
eval: 1: compile_command+=: not found
eval: 1: finalize_command+=: not found
eval: 1: libtool_args+=: not found
eval: 1: compile_command+=: not found
eval: 1: finalize_command+=: not found
eval: 1: libtool_args+=: not found
eval: 1: libtool_args+=: not found
libtool: link: /usr/bin/gcc  ./.libs/libcommunicate.a -ldl
/usr/lib/gcc/i486-linux-gnu/4.1.2/../../../../lib/crt1.o: In function
`_start':
(.text+0x18): undefined reference to `main'
collect2: ld returned 1 exit status
make[3]: *** [faked] Error 1
make[3]: Leaving directory
`/home/gborges/buildroot/toolchain_build_arm/fakeroot-1.8-host'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/gborges/buildroot/toolchain_build_arm/fakeroot-1.8-host'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/gborges/buildroot/toolchain_build_arm/fakeroot-1.8-host'
make: *** [/home/gborges/buildroot/toolchain_build_arm/fakeroot-1.8-host/faked]
Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071011/a4876795/attachment.htm 

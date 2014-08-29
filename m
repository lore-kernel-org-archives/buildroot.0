From: lee choon gay <choongay@yahoo.com>
Date: Fri, 29 Aug 2014 09:17:47 -0700
Subject: [Buildroot] buildroot+libinput-0.5.0
Message-ID: <1409329067.37322.YahooMailNeo@web141705.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.
I would like to install libinput for Weston with buildroot-2014.05.
I selected libevdev and mtdev as follow and my toolchain is Sourcery CodeBench x86/x86_64 2012.09.


menuconfig-->Target packages-->Libraries-->Other-->libevdev
menuconfig-->Target packages-->Libraries-->Hardware handling-->mtdev


I extracted my libinput-0.5.0.tar.xz.
Inside my libinput-0.5.0 folder, I did the following.

1)export PKG_CONFIG_PATH=/home/leecgy/buildroot_sourcery_x86/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/
2)./configure CC=/home/leecgy/buildroot_sourcery_x86/output/host/usr/bin/i686-pc-linux-gnu-gcc -libdir=/home/leecgy/buildroot_sourcery_x86/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/lib --prefix=/my/target/directory

3)make

Configure is working fine, but I get the following error during make.
I would like to check with you on how to link the following header file during make.


leecgy at ubuntu:~/libinput-0.5.0$ make
make  all-recursive
make[1]: Entering directory `/home/leecgy/libinput-0.5.0'
Making all in src
make[2]: Entering directory `/home/leecgy/libinput-0.5.0/src'
  CC       libinput_la-libinput.lo
In file included from libinput.c:35:0:
evdev.h:30:31: fatal error: libevdev/libevdev.h: No such file or directory
compilation terminated.
make[2]: *** [libinput_la-libinput.lo] Error 1
make[2]: Leaving directory `/home/leecgy/libinput-0.5.0/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/leecgy/libinput-0.5.0'
make: *** [all] Error 2


My header files are located in
/home/leecgy/buildroot_sourcery_x86/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include/libevdev-1.0/libevdev/libevdev.h
/home/leecgy/buildroot_sourcery_x86/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include/libevdev-1.0/libevdev/libevdev-uinput.h

Thank you very much.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140829/b51681e1/attachment.html>

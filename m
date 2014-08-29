From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 29 Aug 2014 17:21:20 +0100
Subject: [Buildroot] buildroot+libinput-0.5.0
In-Reply-To: <1409329067.37322.YahooMailNeo@web141705.mail.bf1.yahoo.com>
References: <1409329067.37322.YahooMailNeo@web141705.mail.bf1.yahoo.com>
Message-ID: <5400A880.2090508@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That error has been already fixed:

http://git.buildroot.net/buildroot/commit/?id=e05c6a791d11dbbd619e6be2ebb990cb21db0832

You can apply that patch, or you can wait a few days (less than a week, 
I guess) when buildroot-2014.08 it's released.

Regards,

--
Vincent
On 08/29/2014 05:17 PM, lee choon gay wrote:
> Hi.
> I would like to install libinput for Weston with buildroot-2014.05.
> I selected libevdev and mtdev as follow and my toolchain is Sourcery
> CodeBench x86/x86_64 2012.09.
>
> menuconfig-->Target packages-->Libraries-->Other-->libevdev
> menuconfig-->Target packages-->Libraries-->Hardware handling-->mtdev
>
> I extracted my libinput-0.5.0.tar.xz.
> Inside my libinput-0.5.0 folder, I did the following.
>
> 1)export
> PKG_CONFIG_PATH=/home/leecgy/buildroot_sourcery_x86/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/
> 2)./configure
> CC=/home/leecgy/buildroot_sourcery_x86/output/host/usr/bin/i686-pc-linux-gnu-gcc
> -libdir=/home/leecgy/buildroot_sourcery_x86/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/lib
> --prefix=/my/target/directory
> 3)make
>
> Configure is working fine, but I get the following error during make.
> I would like to check with you on how to link the following header file
> during make.
>
> leecgy at ubuntu:~/libinput-0.5.0$ make
> make  all-recursive
> make[1]: Entering directory `/home/leecgy/libinput-0.5.0'
> Making all in src
> make[2]: Entering directory `/home/leecgy/libinput-0.5.0/src'
>    CC libinput_la-libinput.lo
> In file included from libinput.c:35:0:
> evdev.h:30:31: fatal error: libevdev/libevdev.h: No such file or directory
> compilation terminated.
> make[2]: *** [libinput_la-libinput.lo] Error 1
> make[2]: Leaving directory `/home/leecgy/libinput-0.5.0/src'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/home/leecgy/libinput-0.5.0'
> make: *** [all] Error 2
>
> My header files are located in
> /home/leecgy/buildroot_sourcery_x86/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include/libevdev-1.0/libevdev/libevdev.h
> /home/leecgy/buildroot_sourcery_x86/output/host/usr/i686-buildroot-linux-gnu/sysroot/usr/include/libevdev-1.0/libevdev/libevdev-uinput.h
>
> Thank you very much.
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

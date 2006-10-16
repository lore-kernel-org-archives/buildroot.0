From: Mark Currie <mark@ziliant.com>
Date: Mon, 16 Oct 2006 15:59:29 +0200
Subject: [Buildroot] libtool-1.5.20 error building libusb-0.1.10a
Message-ID: <20061016155930.A30373DA3@ctb-mesg7.saix.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I managed to solve my first problem building libusb (g++ not installing) by
first doing a buildroot make clean. However I now get the following error
from libtool:

if /bin/sh ./libtool --mode=compile
/home/markc/buildroot/build_arm_nofpu/libusb-0.1.12/compile
/home/markc/buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc
-DHAVE_CONFIG_H   -I.  -Werror  -Os -pipe  -Wall -MT usb.lo -MD -MP -MF
".deps/usb.Tpo" -c -o usb.lo usb.c; \
then mv -f ".deps/usb.Tpo" ".deps/usb.Plo"; else rm -f ".deps/usb.Tpo"; exit
1; fi
libtool: compile: unable to infer tagged configuration
libtool: compile: specify a tag with `--tag'
make[2]: *** [usb.lo] Error 1
make[2]: Leaving directory
`/home/markc/buildroot/build_arm_nofpu/libusb-0.1.12'make[1]: ***
[install-recursive] Error 1
make[1]: Leaving directory
`/home/markc/buildroot/build_arm_nofpu/libusb-0.1.12'make: ***
[/home/markc/buildroot/build_arm_nofpu/root/usr/lib/libusb.so] Error 2

Cannot find any refs to this error. Can anyone help ?

Cross-compile platform is arm920-T using gcc-3.4.4
libtool-1.5.20, libusb-0.1.10a

Markc

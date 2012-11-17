From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Nov 2012 20:58:58 +0100
Subject: [Buildroot] [PATCH] libusb: disable on avr32
In-Reply-To: <1353182156-28906-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Sat, 17 Nov 2012 19:55:56 +0000")
References: <1353182156-28906-1-git-send-email-spdawson@gmail.com>
Message-ID: <87wqxkrofx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> For target architecture avr32, the gpsd package fails to build when
 spdawson> libusb is selected. The following autobuild failure illustrates the problem.

 spdawson>   http://autobuild.buildroot.net/results/aa3d4763a0e90c995bc8431cf345730ee22e65a1/build-end.log

 spdawson> The issue is that libusb requires timerfd_settime and timerfd_create, but
 spdawson> the underlying syscalls are not implemented on avr32.

 spdawson> This patch disables the libusb package for the avr32 target architecture.

What about libusb's reverse dependencies?

git grep 'select BR2_PACKAGE_LIBUSB'
package/bluez_utils/Config.in:  select BR2_PACKAGE_LIBUSB
package/ccid/Config.in: select BR2_PACKAGE_LIBUSB
package/libftdi/Config.in:      select BR2_PACKAGE_LIBUSB
package/libftdi/Config.in:      select BR2_PACKAGE_LIBUSB_COMPAT
package/libhid/Config.in:       select BR2_PACKAGE_LIBUSB
package/libhid/Config.in:       select BR2_PACKAGE_LIBUSB_COMPAT
package/libiqrf/Config.in:      select BR2_PACKAGE_LIBUSB
package/libnfc/Config.in:       select BR2_PACKAGE_LIBUSB
package/libnfc/Config.in:       select BR2_PACKAGE_LIBUSB_COMPAT
package/openocd/Config.in:      select BR2_PACKAGE_LIBUSB
package/openocd/Config.in:      select BR2_PACKAGE_LIBUSB_COMPAT
package/pcsc-lite/Config.in:    select BR2_PACKAGE_LIBUSB
package/python-nfc/Config.in:   select BR2_PACKAGE_LIBUSB
package/python-nfc/Config.in:   select BR2_PACKAGE_LIBUSB_COMPAT
package/usb_modeswitch/Config.in:       select BR2_PACKAGE_LIBUSB
package/usb_modeswitch/Config.in:       select BR2_PACKAGE_LIBUSB_COMPAT
package/usbutils/Config.in:     select BR2_PACKAGE_LIBUSB

-- 
Bye, Peter Korsgaard

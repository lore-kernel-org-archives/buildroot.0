From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Nov 2012 21:13:15 +0100
Subject: [Buildroot] [PATCH] libusb: disable on avr32
In-Reply-To: <CAHt8ZCMF-cvx4W+GrGUxqn1iBx9XDmGutVv-xGr1uF4M=o-A1A@mail.gmail.com>
 (Simon Dawson's message of "Sat, 17 Nov 2012 20:02:55 +0000")
References: <1353182156-28906-1-git-send-email-spdawson@gmail.com>
 <87wqxkrofx.fsf@dell.be.48ers.dk>
 <CAHt8ZCMF-cvx4W+GrGUxqn1iBx9XDmGutVv-xGr1uF4M=o-A1A@mail.gmail.com>
Message-ID: <87sj88rns4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Simon" == Simon Dawson <spdawson@gmail.com> writes:

 Simon> Hi Peter; thanks for the feedback.
 Simon> On 17 November 2012 19:58, Peter Korsgaard <jacmet@uclibc.org> wrote:
 >> What about libusb's reverse dependencies?
 >> 
 >> git grep 'select BR2_PACKAGE_LIBUSB'
 >> package/bluez_utils/Config.in:  select BR2_PACKAGE_LIBUSB
 >> package/ccid/Config.in: select BR2_PACKAGE_LIBUSB
 >> package/libftdi/Config.in:      select BR2_PACKAGE_LIBUSB
 >> package/libftdi/Config.in:      select BR2_PACKAGE_LIBUSB_COMPAT
 >> package/libhid/Config.in:       select BR2_PACKAGE_LIBUSB
 >> package/libhid/Config.in:       select BR2_PACKAGE_LIBUSB_COMPAT
 >> package/libiqrf/Config.in:      select BR2_PACKAGE_LIBUSB
 >> package/libnfc/Config.in:       select BR2_PACKAGE_LIBUSB
 >> package/libnfc/Config.in:       select BR2_PACKAGE_LIBUSB_COMPAT
 >> package/openocd/Config.in:      select BR2_PACKAGE_LIBUSB
 >> package/openocd/Config.in:      select BR2_PACKAGE_LIBUSB_COMPAT
 >> package/pcsc-lite/Config.in:    select BR2_PACKAGE_LIBUSB
 >> package/python-nfc/Config.in:   select BR2_PACKAGE_LIBUSB
 >> package/python-nfc/Config.in:   select BR2_PACKAGE_LIBUSB_COMPAT
 >> package/usb_modeswitch/Config.in:       select BR2_PACKAGE_LIBUSB
 >> package/usb_modeswitch/Config.in:       select BR2_PACKAGE_LIBUSB_COMPAT
 >> package/usbutils/Config.in:     select BR2_PACKAGE_LIBUSB

 Simon> Ah, yes. What's the right thing to do here? I don't really like the
 Simon> thought of that "depends on !BR2_avr32" all over the place, but I
 Simon> guess that's the cleanest solution, right?

Yes, that's the only solution we have right now.

Remember to look recursively upwards. These libusb users might be
selected by other packages.

-- 
Bye, Peter Korsgaard

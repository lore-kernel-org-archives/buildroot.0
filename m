From: Simon Dawson <spdawson@gmail.com>
Date: Sat, 17 Nov 2012 20:02:55 +0000
Subject: [Buildroot] [PATCH] libusb: disable on avr32
In-Reply-To: <87wqxkrofx.fsf@dell.be.48ers.dk>
References: <1353182156-28906-1-git-send-email-spdawson@gmail.com>
 <87wqxkrofx.fsf@dell.be.48ers.dk>
Message-ID: <CAHt8ZCMF-cvx4W+GrGUxqn1iBx9XDmGutVv-xGr1uF4M=o-A1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter; thanks for the feedback.

On 17 November 2012 19:58, Peter Korsgaard <jacmet@uclibc.org> wrote:
> What about libusb's reverse dependencies?
>
> git grep 'select BR2_PACKAGE_LIBUSB'
> package/bluez_utils/Config.in:  select BR2_PACKAGE_LIBUSB
> package/ccid/Config.in: select BR2_PACKAGE_LIBUSB
> package/libftdi/Config.in:      select BR2_PACKAGE_LIBUSB
> package/libftdi/Config.in:      select BR2_PACKAGE_LIBUSB_COMPAT
> package/libhid/Config.in:       select BR2_PACKAGE_LIBUSB
> package/libhid/Config.in:       select BR2_PACKAGE_LIBUSB_COMPAT
> package/libiqrf/Config.in:      select BR2_PACKAGE_LIBUSB
> package/libnfc/Config.in:       select BR2_PACKAGE_LIBUSB
> package/libnfc/Config.in:       select BR2_PACKAGE_LIBUSB_COMPAT
> package/openocd/Config.in:      select BR2_PACKAGE_LIBUSB
> package/openocd/Config.in:      select BR2_PACKAGE_LIBUSB_COMPAT
> package/pcsc-lite/Config.in:    select BR2_PACKAGE_LIBUSB
> package/python-nfc/Config.in:   select BR2_PACKAGE_LIBUSB
> package/python-nfc/Config.in:   select BR2_PACKAGE_LIBUSB_COMPAT
> package/usb_modeswitch/Config.in:       select BR2_PACKAGE_LIBUSB
> package/usb_modeswitch/Config.in:       select BR2_PACKAGE_LIBUSB_COMPAT
> package/usbutils/Config.in:     select BR2_PACKAGE_LIBUSB

Ah, yes. What's the right thing to do here? I don't really like the
thought of that "depends on !BR2_avr32" all over the place, but I
guess that's the cleanest solution, right?

Simon.

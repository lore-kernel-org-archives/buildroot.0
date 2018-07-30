From: Patrick Doyle <wpdster@gmail.com>
Date: Mon, 30 Jul 2018 17:29:36 -0400
Subject: [Buildroot] Random Linux/device tree/GPIO question posted to the
 wrong list...
Message-ID: <CAF_dkJBrU=bF+LZOSe6RNKukbGFjPHOMJUfUXRHs4_8NJ-50Dw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

But you folks all know about this sort of stuff anyway, so I figured
I'd start by asking here.

I was just shocked to learn that, although I allocated a pin to a
certain function in my device tree, I was able to override the
operation of that pin via /sys/class/gpio (and thus crash my board
when it could no longer access it's flash properly).

Can anybody here tell me how I can prevent the GPIO subsystem from
overriding the pinmux I specified in my device tree?  I guess I
thought that:

            pinctrl at fc038000 {
                pinctrl_nand_default: nand_default {
                                        pinmux = <PIN_PA8__NWE_NANDWE>,
                                                 <PIN_PA9__NCS3>,
                                                 <PIN_PA10__A21_NANDALE>,
                                                 <PIN_PA11__A22_NANDCLE>,
                                                 <PIN_PA12__NRD_NANDOE>,
                                                 <PIN_PD8__NANDRDY>,
                                                 <PIN_PA0__D0>,
                                                 <PIN_PA1__D1>,
                                                 <PIN_PA2__D2>,
                                                 <PIN_PA3__D3>,
                                                 <PIN_PA4__D4>,
                                                 <PIN_PA5__D5>,
                                                 <PIN_PA6__D6>,
                                                 <PIN_PA7__D7>;
                                        bias-disable;
                                };

would have done the trick (on my Microchip SAMA5D2x device).

--wpd

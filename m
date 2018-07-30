From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Jul 2018 23:51:09 +0200
Subject: [Buildroot] Random Linux/device tree/GPIO question posted to
 the wrong list...
In-Reply-To: <CAF_dkJBrU=bF+LZOSe6RNKukbGFjPHOMJUfUXRHs4_8NJ-50Dw@mail.gmail.com>
References: <CAF_dkJBrU=bF+LZOSe6RNKukbGFjPHOMJUfUXRHs4_8NJ-50Dw@mail.gmail.com>
Message-ID: <20180730235109.0fe5f681@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Patrick,

On Mon, 30 Jul 2018 17:29:36 -0400, Patrick Doyle wrote:
> But you folks all know about this sort of stuff anyway, so I figured
> I'd start by asking here.
> 
> I was just shocked to learn that, although I allocated a pin to a
> certain function in my device tree, I was able to override the
> operation of that pin via /sys/class/gpio (and thus crash my board
> when it could no longer access it's flash properly).
> 
> Can anybody here tell me how I can prevent the GPIO subsystem from
> overriding the pinmux I specified in my device tree?  I guess I
> thought that:
> 
>             pinctrl at fc038000 {
>                 pinctrl_nand_default: nand_default {
>                                         pinmux = <PIN_PA8__NWE_NANDWE>,
>                                                  <PIN_PA9__NCS3>,
>                                                  <PIN_PA10__A21_NANDALE>,
>                                                  <PIN_PA11__A22_NANDCLE>,
>                                                  <PIN_PA12__NRD_NANDOE>,
>                                                  <PIN_PD8__NANDRDY>,
>                                                  <PIN_PA0__D0>,
>                                                  <PIN_PA1__D1>,
>                                                  <PIN_PA2__D2>,
>                                                  <PIN_PA3__D3>,
>                                                  <PIN_PA4__D4>,
>                                                  <PIN_PA5__D5>,
>                                                  <PIN_PA6__D6>,
>                                                  <PIN_PA7__D7>;
>                                         bias-disable;
>                                 };
> 
> would have done the trick (on my Microchip SAMA5D2x device).

This snippet of Device Tree only declares a pinmux configuration. If
there is nothing referencing pinctrl_nand_default, then this pinmux
configuration is not used/applied, and the pins are not "reserved".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 16:17:56 +0200
Subject: [Buildroot] Random Linux/device tree/GPIO question posted to
 the wrong list...
In-Reply-To: <CAF_dkJAfeaGXejcOkUk8=WMfS6eNbqLjNYPZHaRU1wArb7_G6w@mail.gmail.com>
References: <CAF_dkJBrU=bF+LZOSe6RNKukbGFjPHOMJUfUXRHs4_8NJ-50Dw@mail.gmail.com>
 <20180730235109.0fe5f681@windsurf>
 <CAF_dkJAfeaGXejcOkUk8=WMfS6eNbqLjNYPZHaRU1wArb7_G6w@mail.gmail.com>
Message-ID: <20180731161756.47cb4d72@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Patrick,

On Tue, 31 Jul 2018 09:53:34 -0400, Patrick Doyle wrote:

> Thank you for the quick reply.  pinctrl_nand_default _is_ referenced
> by the device tree clause for the nand controller:
> 
>         nand0: nand at 80000000 {
>             nand-bus-width = <8>;
>             nand-ecc-mode = "hw";
>             nand-on-flash-bbt;
>             atmel,has-pmecc;
>             atmel,pmecc-cap = <12>;
>             atmel,pmecc-sector-size = <512>;
>             pinctrl-names = "default";
>             pinctrl-0 = <&pinctrl_nand_default &pinctrl_nand_rdy_en>;
>             status = "okay";
> ...
> 
> Hence my confusion.  Am I missing something else somewhere?

Asked internally, and my colleague Maxime Ripard (in Cc) gave some
explanation about this: it depends on whether the pinctrl driver uses
the strict mode or not and the Atmel doesn't.

This allows to request a pin as a GPIO even if this pin is already
muxed as a different functionality. Some details about this are
available at "GPIO mode pitfalls" in
https://www.kernel.org/doc/Documentation/driver-api/pinctl.rst (link
also provided by Maxime).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
